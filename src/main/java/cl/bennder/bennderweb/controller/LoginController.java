/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.bennder.bennderweb.controller;

import cl.bennder.bennderweb.body.response.LoginBodyResponse;
import cl.bennder.bennderweb.constantes.GoToUrl;
import cl.bennder.bennderweb.model.LoginForm;
import cl.bennder.bennderweb.session.UsuarioSession;
import cl.bennder.bennderweb.services.UsuarioServices;
import cl.bennder.entitybennderwebrest.request.LoginRequest;
import cl.bennder.entitybennderwebrest.request.RecuperacionPasswordRequest;
import cl.bennder.entitybennderwebrest.response.LoginResponse;
import cl.bennder.entitybennderwebrest.response.ValidacionResponse;
import com.google.gson.Gson;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author dyanez 28-12-2016
 */
@Controller
public class LoginController {
    
    @Autowired
    private UsuarioSession usuarioSession;
    
    private static final Logger log = LoggerFactory.getLogger(LoginController.class);
    
    @Autowired
    private UsuarioServices usuarioServices;
    
        
    //.- Index
    @RequestMapping(value = "/index.html", method = RequestMethod.GET, produces = "text/html;charset=UTF-8")
    public ModelAndView index() {
        log.info("INICIO");
        ModelAndView modelAndView = new ModelAndView("login");
        modelAndView.addObject("loginForm", new LoginForm());
        log.info("FIN");
        return modelAndView;
    }
    @RequestMapping(value="login.html", method=RequestMethod.POST, produces = "text/html;charset=UTF-8")
    public @ResponseBody String login(@ModelAttribute("loginForm") LoginForm loginForm, HttpSession session,HttpServletRequest request){
        log.info("INICIO");
        log.info("datos ->{}",loginForm.toString());
        LoginResponse response = usuarioServices.validacionUsuario(new LoginRequest(loginForm.getUser(), loginForm.getPassword()));
        LoginBodyResponse rBody = new LoginBodyResponse();
        rBody.setValidacion(response.getValidacion());
        if(response.getValidacion()!=null && response.getValidacion().getCodigo()!=null && "0".equals(response.getValidacion().getCodigo())){
            String mensajeLog = "[IdUsuario -> "+response.getIdUsuario()+"]";
            usuarioSession.setIdUsuario(response.getIdUsuario());//rut de cliente sin dv
            session.setAttribute("user", loginForm.getUser());
            rBody.setGoToUrl(GoToUrl.URL_HOME);
            String uri = request.getScheme() + "://" +
             request.getServerName() + 
             ("http".equals(request.getScheme()) && request.getServerPort() == 80 || "https".equals(request.getScheme()) && request.getServerPort() == 443 ? "" : ":" + request.getServerPort() ) +
             request.getRequestURI() +
            (request.getQueryString() != null ? "?" + request.getQueryString() : "");
            
            log.info("{} uri->{}",mensajeLog,uri);
            log.info("{} Se redirecciona a login",mensajeLog);
        }
        String respJson =  new Gson().toJson(rBody);
        log.info("FIN");
        return respJson;
    }
    @RequestMapping(value="logout.html", method=RequestMethod.GET, produces = "text/html;charset=UTF-8")
    public String logout(HttpSession session){
        if(session != null){
            log.info("limpiando datos de sessión...");
            session.invalidate();
        }
        return "redirect:/index.html";
    }
    
    /***
     * Permite solicitar/recuperar la contraseña la cual es enviada al correo ingresado
     * @param usuario usuario bennder, usualmente email
     * @return 
     */
    @RequestMapping(value="requestPassword.html", method=RequestMethod.POST, produces = "text/html;charset=UTF-8")
    public @ResponseBody String recuperarPassword(@RequestParam("u") String usuario,HttpServletRequest request){
        log.info("INICIO");
        log.info("Usuario/correo a recuperar password ->{}",usuario);
        String uri = request.getScheme() + "://" +
             request.getServerName() + 
             ("http".equals(request.getScheme()) && request.getServerPort() == 80 || "https".equals(request.getScheme()) && request.getServerPort() == 443 ? "" : ":" + request.getServerPort() ) +
             "/BennderB2BWeb/index.html";
        log.info("url index->{}",uri);    
        ValidacionResponse response = usuarioServices.recuperacionPassword(new RecuperacionPasswordRequest(usuario,uri));
        String respJson =  new Gson().toJson(response);
        log.info("FIN");
        return respJson;
    }
    
    @RequestMapping(value = "/home.html", method = RequestMethod.GET, produces = "text/html;charset=UTF-8")
    public ModelAndView homeI() {
        log.info("INICIO");
        log.info("Usuario connected ->{}",usuarioSession.getIdUsuario());
        ModelAndView modelAndView = new ModelAndView("home");
        log.info("FIN");
        return modelAndView;
    }
    
}
