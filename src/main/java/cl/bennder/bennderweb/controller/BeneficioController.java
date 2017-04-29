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
import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
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
public class BeneficioController {
    
    @Autowired
    private UsuarioSession usuarioSession;
    
    private static final Logger log = LoggerFactory.getLogger(BeneficioController.class);
    
    @Autowired
    private UsuarioServices usuarioServices;
    
        
    //.- Index
    @RequestMapping(value = "/beneficio/editar/{idBeneficio}.html", method = RequestMethod.GET, produces = "text/html;charset=UTF-8")
    public ModelAndView actualizarBeneficio(@PathVariable Integer idBeneficio) {
        log.info("INICIO");
        log.info("idBeneficio ->{}",idBeneficio);
        ModelAndView modelAndView = new ModelAndView("proveedor/beneficio");
        
        log.info("FIN");
        return modelAndView;
    }
    @RequestMapping(value = "/beneficio/crear.html", method = RequestMethod.GET, produces = "text/html;charset=UTF-8")
    public ModelAndView crearBeneficio() {
        log.info("INICIO");
        log.info("Usuario proveedor ->{}",usuarioSession.getIdUsuario());
        ModelAndView modelAndView = new ModelAndView("proveedor/beneficio");        
        log.info("FIN");
        return modelAndView;
    }
    
}
