/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.bennder.bennderweb.controller;

import cl.bennder.bennderweb.services.SucursalService;
import cl.bennder.bennderweb.session.SucursalSession;
import cl.bennder.entitybennderwebrest.model.Comuna;
import cl.bennder.entitybennderwebrest.model.Sucursal;
import cl.bennder.entitybennderwebrest.request.InfoInicioSucursalRequest;
import cl.bennder.entitybennderwebrest.response.InfoInicioSucursalResponse;
import com.google.gson.Gson;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author ext_dayanez
 */
@Controller
public class SucursalController {
    
    @Autowired
    private SucursalService sucursalService;
    
    @Autowired
    private SucursalSession sucursalSession;
    
    private static final Logger log = LoggerFactory.getLogger(SucursalController.class);
    
    @RequestMapping(value = "/sucursal/crear.html", method = RequestMethod.GET, produces = "text/html;charset=UTF-8")
    public ModelAndView crearSucursal() {
        log.info("inicio");
        ModelAndView modelAndView = new ModelAndView("proveedor/sucursal");        
        InfoInicioSucursalResponse response = sucursalService.getInfoInicioSucursal(new InfoInicioSucursalRequest());
        modelAndView.addObject("sucursalForm", new Sucursal());
        modelAndView.addObject("regiones", response.getRegiones());
        sucursalSession.setComunas(response.getComunas());
        log.info("fin");
        return modelAndView;
    }
    
    @RequestMapping(value = "/sucursal/editar.html", method = RequestMethod.GET, produces = "text/html;charset=UTF-8")
    public ModelAndView editarSurcusal(@RequestParam("id") Integer idSucursal) {
        log.info("inicio");
        InfoInicioSucursalResponse response = sucursalService.getInfoInicioSucursal(new InfoInicioSucursalRequest(idSucursal));
        ModelAndView modelAndView = new ModelAndView("proveedor/sucursal");
        modelAndView.addObject("sucursalForm", response.getSucursal());
        modelAndView.addObject("regiones", response.getRegiones());
        sucursalSession.setComunas(response.getComunas());
        modelAndView.addObject("comunasRegion", sucursalService.getComunasByRegion(response.getSucursal().getDireccion().getComuna().getRegion().getIdRegion()));
        log.info("fin");
        return modelAndView;
    }
    
    @RequestMapping(value="/sucursal/getComunaByIdReg.html", method=RequestMethod.GET, produces = "text/html;charset=UTF-8")
    public @ResponseBody String getComunaByIdReg(@RequestParam("idRegion") Integer idRegion, 
                                              HttpSession session){
        log.info("INICIO");
        List<Comuna> comunas = sucursalService.getComunasByRegion(idRegion);
        if(comunas!=null){
            log.info("comunas.size()->{}",comunas.size());
        }
        String respJson =  new Gson().toJson(comunas);
        log.info("FIN");
        return respJson;
    }
}
