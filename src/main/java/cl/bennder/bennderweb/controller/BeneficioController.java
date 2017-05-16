/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.bennder.bennderweb.controller;

import cl.bennder.bennderweb.model.BeneficioForm;
import cl.bennder.bennderweb.model.ImagenGenericaForm;
import cl.bennder.bennderweb.services.BeneficioService;
import cl.bennder.bennderweb.session.UsuarioSession;
import cl.bennder.bennderweb.services.UsuarioServices;
import cl.bennder.bennderweb.session.BeneficioSession;
import cl.bennder.entitybennderwebrest.model.Categoria;
import cl.bennder.entitybennderwebrest.model.ImagenGenerica;
import cl.bennder.entitybennderwebrest.model.Validacion;
import cl.bennder.entitybennderwebrest.request.GetTodasCategoriaRequest;
import cl.bennder.entitybennderwebrest.request.InfoInicioBeneficioRequest;
import cl.bennder.entitybennderwebrest.request.UploadImagenesGenericaRequest;
import cl.bennder.entitybennderwebrest.response.InfoInicioBeneficioResponse;
import com.google.gson.Gson;
import java.io.IOException;
import java.util.List;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author dyanez 28-12-2016
 */
@Controller
public class BeneficioController {
    
    @Autowired
    private UsuarioSession usuarioSession;
    
    @Autowired
    private BeneficioSession beneficioSession;
    
    private static final Logger log = LoggerFactory.getLogger(BeneficioController.class);
    
    @Autowired
    private UsuarioServices usuarioServices;
    
    @Autowired
    private BeneficioService beneficioService;
    
    //.- Index
    @RequestMapping(value = "/beneficio/obtener/{idBeneficio}.html", method = RequestMethod.GET, produces = "text/html;charset=UTF-8")
    public ModelAndView editarBeneficio(@PathVariable Integer idBeneficio) {
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
        ModelAndView modelAndView = new ModelAndView("proveedor/nuevo");
        modelAndView.addObject("beneficioForm", new BeneficioForm());
//        //.- obtener y guardar en sesion rutas de categorias y subcategorias de imagenes
//        GetTodasCategoriaRequest r = new GetTodasCategoriaRequest();
//        //r.setIdUsuario(usuarioSession.getIdUsuario());
//        modelAndView.addObject("categorias", beneficioService.getTodasCategorias(r).getCategorias());
//        modelAndView.addObject("sucursalesProveedor", beneficioService.sucursalesProveedor());
          InfoInicioBeneficioRequest  request = new InfoInicioBeneficioRequest();
          //.- sacar despues que tenga
          request.setIdUsuario(usuarioSession.getIdUsuario());
          InfoInicioBeneficioResponse response = beneficioService.getInfoInicioCreaActualizaBeneficio(request);
          modelAndView.addObject("categorias", response.getCategorias());
          modelAndView.addObject("sucursalesProveedor", response.getSucursales());
          beneficioSession.setIamgenesGenericas(response.getImgenesGenericas());
          
        
        log.info("FIN");
        return modelAndView;
    }
    @RequestMapping(value = "/beneficio/nuevo.html", method = RequestMethod.GET, produces = "text/html;charset=UTF-8")
    public ModelAndView nuevo() {
        log.info("INICIO");
        log.info("Usuario proveedor ->{}",usuarioSession.getIdUsuario());
        ModelAndView modelAndView = new ModelAndView("proveedor/nuevo");
//        modelAndView.addObject("beneficioForm", new BeneficioForm());
//          InfoInicioBeneficioRequest  request = new InfoInicioBeneficioRequest();
//          //.- sacar despues que tenga
//          request.setIdUsuario(usuarioSession.getIdUsuario());
//          InfoInicioBeneficioResponse response = beneficioService.getInfoInicioCreaActualizaBeneficio(request);
//          modelAndView.addObject("categorias", response.getCategorias());
//          modelAndView.addObject("sucursalesProveedor", response.getSucursales());
//          beneficioSession.setIamgenesGenericas(response.getImgenesGenericas());
          
        
        log.info("FIN");
        return modelAndView;
    }
//    @RequestMapping(value = "/beneficio/guardar.html", method = RequestMethod.POST, produces = "text/html;charset=UTF-8")
//    public ModelAndView guardarBeneficio(@ModelAttribute("beneficioForm") BeneficioForm beneficioForm) {
//        log.info("INICIO");
//        log.info("Usuario connected ->{}",usuarioSession.getIdUsuario());
//        log.info("Datos beneficio ->{}.",beneficioForm.toString());
//        
//        ModelAndView modelAndView = new ModelAndView("redirect:../home.html");
//        beneficioService.validaGuardarBeneficio(beneficioForm);
//        
//        log.info("FIN");
//        return modelAndView;
//    }
    
    @RequestMapping(value = "/beneficio/guardar.html", method = RequestMethod.POST, produces = "text/html;charset=UTF-8")
    public @ResponseBody String  guardarBeneficio(@ModelAttribute("beneficioForm") BeneficioForm beneficioForm) {
        log.info("INICIO");
        log.info("Usuario connected ->{}",usuarioSession.getIdUsuario());
        log.info("Datos beneficio ->{}.",beneficioForm.toString());
        
        //ModelAndView modelAndView = new ModelAndView("redirect:../home.html");
        //beneficioService.validaGuardarBeneficio(beneficioForm);
        
        log.info("FIN");
        String respJson =  new Gson().toJson(new Validacion("0", "0", "OK"));
        return respJson;
    }
    
    
    
    @RequestMapping(value = "/beneficio/imagenesGenericas.html", method = RequestMethod.GET, produces = "text/html;charset=UTF-8")
    public ModelAndView imagenesGenericas() {
        log.info("INICIO");
        log.info("Usuario proveedor ->{}",usuarioSession.getIdUsuario());
        ModelAndView modelAndView = new ModelAndView("proveedor/uploadImgGenericas");
        modelAndView.addObject("imagenGenericaForm", new ImagenGenericaForm());
        //.- obtener y guardar en sesion rutas de categorias y subcategorias de imagenes
        GetTodasCategoriaRequest r = new GetTodasCategoriaRequest();
        //r.setIdUsuario(usuarioSession.getIdUsuario());
        modelAndView.addObject("categorias", beneficioService.getTodasCategorias(r).getCategorias());
        
        log.info("FIN");
        return modelAndView;
    }
    
    @RequestMapping(value = "/beneficio/imagenesGenericas.html", method = RequestMethod.POST, produces = "text/html;charset=UTF-8")
    public ModelAndView uploadImagenesGenericas(@ModelAttribute("imagenGenericaForm") ImagenGenericaForm imagenGenericaForm) {
        log.info("INICIO");
        log.info("Usuario proveedor ->{}",usuarioSession.getIdUsuario());
        UploadImagenesGenericaRequest request = new UploadImagenesGenericaRequest();
        
        try {
            if(imagenGenericaForm !=null && imagenGenericaForm.getImages()!=null && imagenGenericaForm.getImages().size() > 0){
                log.info("completando datos de imagenes genéricas a enviar, datos ->{}",imagenGenericaForm.toString());
                for(MultipartFile mFile : imagenGenericaForm.getImages()){
                    if(mFile!=null && mFile.getBytes()!=null && mFile.getOriginalFilename()!=null && mFile.getBytes().length > 0){
                        request.getImagenes().add(new ImagenGenerica(imagenGenericaForm.getIdCategoria(), imagenGenericaForm.getIdSubCategoria(), mFile.getOriginalFilename(), mFile.getBytes(), null, null));
                    }
                }
                log.info("enviando imagenes a servidor...");
                beneficioService.uploadImagenesGenerica(request);
            }
        } catch (IOException ex) {
                    log.error("Error IOException.",ex);
        }
        ModelAndView modelAndView = new ModelAndView("redirect:../home.html");
        log.info("FIN");
        return modelAndView;
    }
    
    
    @RequestMapping(value="/beneficio/getSubCatById.html", method=RequestMethod.GET, produces = "text/html;charset=UTF-8")
    public @ResponseBody String getSubCatById(@RequestParam("idCat") Integer idCategoria, 
                                              HttpSession session){
        log.info("INICIO");
        List<Categoria> subcategorias = beneficioService.getSubCategoriasByIdCat(idCategoria);
        if(subcategorias!=null){
            log.info("subcategorias.size()->{}",subcategorias.size());
        }
        String respJson =  new Gson().toJson(subcategorias);
        log.info("FIN");
        return respJson;
    }
    
    @RequestMapping(value="/beneficio/getImgsGenericas.html", method=RequestMethod.GET, produces = "text/html;charset=UTF-8")
    public @ResponseBody String getImagenesGenericas(@RequestParam("idCat") Integer idCategoria, 
                                                     @RequestParam("idSubCat") Integer idSubCategoria,
                                                    HttpSession session){
        log.info("INICIO");
        log.info("Obteniendo iamgenes genericas para cat->{}  y subcat->{}",idCategoria,idSubCategoria);
        List<String> imgs = beneficioService.getImagenesGenericasByCatSubSession(idCategoria,idSubCategoria);
        String respJson =  new Gson().toJson(imgs);
        log.info("FIN");
        return respJson;
    }
    
    
}
