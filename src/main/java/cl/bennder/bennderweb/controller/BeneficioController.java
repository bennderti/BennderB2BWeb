/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.bennder.bennderweb.controller;

import cl.bennder.bennderweb.constantes.TiposBeneficio;
import cl.bennder.bennderweb.model.BeneficioForm;
import cl.bennder.bennderweb.model.ImagenGenericaForm;
import cl.bennder.bennderweb.services.BeneficioService;
import cl.bennder.bennderweb.session.UsuarioSession;
import cl.bennder.bennderweb.session.BeneficioSession;
import cl.bennder.entitybennderwebrest.model.Categoria;
import cl.bennder.entitybennderwebrest.model.Comuna;
import cl.bennder.entitybennderwebrest.model.ImagenGenerica;
import cl.bennder.entitybennderwebrest.model.SucursalProveedor;
import cl.bennder.entitybennderwebrest.model.Validacion;
import cl.bennder.entitybennderwebrest.request.GetTodasCategoriaRequest;
import cl.bennder.entitybennderwebrest.request.InfoInicioBeneficioRequest;
import cl.bennder.entitybennderwebrest.request.PublicarBeneficiosRequest;
import cl.bennder.entitybennderwebrest.request.UploadImagenesGenericaRequest;
import cl.bennder.entitybennderwebrest.response.CargarMantenedorBeneficioResponse;
import cl.bennder.entitybennderwebrest.response.InfoInicioBeneficioResponse;
import cl.bennder.entitybennderwebrest.response.ValidacionResponse;
import com.google.gson.Gson;
import java.io.IOException;
import java.util.List;
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
    private BeneficioService beneficioService;
    
    //.- Index
    //@RequestMapping(value = "/beneficio/obtener/{idBeneficio}.html", method = RequestMethod.GET, produces = "text/html;charset=UTF-8")
    @RequestMapping(value = "/beneficio/editar.html", method = RequestMethod.GET, produces = "text/html;charset=UTF-8")
    public ModelAndView editarBeneficio(@RequestParam("id") Integer idBeneficio) {
        log.info("INICIO");
        log.info("idBeneficio ->{}",idBeneficio);
        ModelAndView modelAndView = new ModelAndView("proveedor/nuevo");
        
        InfoInicioBeneficioRequest  request = new InfoInicioBeneficioRequest();
        request.setIdUsuario(usuarioSession.getIdUsuario());
        request.setIdBeneficio(idBeneficio);
        InfoInicioBeneficioResponse response = beneficioService.getInfoInicioCreaActualizaBeneficio(request);
        BeneficioForm beneficioForm = beneficioService.convertirDatosFormularioBeneficio(response.getDatosBeneficio());
        beneficioForm.setTotalImagenessPermitidos(response.getMaxImagenes());
        String arrayImagenes =  new Gson().toJson(beneficioForm.getImagenesBeneficio());
        //var obj = JSON.parse('{ "name":"John", "age":30, "city":"New York"}');
        modelAndView.addObject("arrayImagenesJson", arrayImagenes);
        modelAndView.addObject("beneficioForm", beneficioForm);
        modelAndView.addObject("categorias", response.getCategorias());        
        modelAndView.addObject("regiones", response.getRegionesSucursal());          
        modelAndView.addObject("rutaImagenExample", "/BennderB2BWeb/resources/beneficio/img/example.png");
        beneficioSession.setIamgenesGenericas(response.getImgenesGenericas());
        beneficioSession.setComunasSucursales(response.getComunasSucursales());
        beneficioSession.setRegionesSucursal(response.getRegionesSucursal());        
        beneficioService.seleccionaSucursales(response.getSucursales(), beneficioForm.getSucursalesSelected());
        beneficioSession.setSucursales(response.getSucursales()); 
        modelAndView.addObject("sucursales", response.getSucursales());
        beneficioSession.setCategorias(response.getCategorias());
        List<Categoria> subcategorias = beneficioService.getSubCategoriasByIdCat(beneficioForm.getIdCategoriaSelected());
        modelAndView.addObject("subcategorias", subcategorias); 
        //.- condiciones
        modelAndView.addObject("condiciones",  beneficioForm.getCondiciones());        
        //.- comunas beneficio
        //modelAndView.addObject("comunas",  beneficioService.getComunaByIdReg(beneficioForm.getIdRegionSelected()));
        
        //.- comunas
        
        
        //.- adicionales
        if(beneficioForm.getIdTipoBeneficioSelected()!=null && beneficioForm.getIdTipoBeneficioSelected().compareTo(TiposBeneficio.PRODUCTO_ADICIONAL) == 0){
            modelAndView.addObject("adicionales",  beneficioForm.getAdicionales()); 
        }        
        log.info("FIN");
        return modelAndView;
    }
    @RequestMapping(value = "/beneficio/crear.html", method = RequestMethod.GET, produces = "text/html;charset=UTF-8")
    public ModelAndView crearBeneficio() {
        log.info("INICIO");
        log.info("Usuario proveedor ->{}",usuarioSession.getIdUsuario());
        ModelAndView modelAndView = new ModelAndView("proveedor/nuevo");
        BeneficioForm beneficioForm = new BeneficioForm();
        InfoInicioBeneficioRequest  request = new InfoInicioBeneficioRequest();
        request.setIdUsuario(usuarioSession.getIdUsuario());
        InfoInicioBeneficioResponse response = beneficioService.getInfoInicioCreaActualizaBeneficio(request);
        beneficioForm.setTotalImagenessPermitidos(response.getMaxImagenes());
        modelAndView.addObject("beneficioForm", beneficioForm);
        modelAndView.addObject("arrayImagenesJson", new Gson().toJson(beneficioForm.getImagenesBeneficio()));        
        modelAndView.addObject("categorias", response.getCategorias());
        modelAndView.addObject("regiones", response.getRegionesSucursal());          
        modelAndView.addObject("rutaImagenExample", "/BennderB2BWeb/resources/beneficio/img/example.png");
        modelAndView.addObject("sucursales", response.getSucursales());
        beneficioSession.setIamgenesGenericas(response.getImgenesGenericas());
        beneficioSession.setComunasSucursales(response.getComunasSucursales());
        beneficioSession.setRegionesSucursal(response.getRegionesSucursal());
        beneficioSession.setSucursales(response.getSucursales());        
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
    public @ResponseBody String  guardaDatosGenerales(@ModelAttribute("beneficioForm") BeneficioForm beneficioForm) {
        log.info("INICIO");
        log.info("Usuario connected ->{}",usuarioSession.getIdUsuario());
        log.info("Datos beneficio ->{}.",beneficioForm.toString());
        //ModelAndView modelAndView = new ModelAndView("redirect:../home.html");
        //beneficioService.validaGuardarBeneficio(beneficioForm);
        beneficioSession.setBeneficioForm(beneficioForm);
        
        log.info("FIN");
        String respJson =  new Gson().toJson(new Validacion("0", "0", "OK"));
        return respJson;
    }
    @RequestMapping(value = "/beneficio/guardarImagenes.html", method = RequestMethod.POST, produces = "text/html;charset=UTF-8")
    public @ResponseBody String  guardaImagenes(@ModelAttribute("beneficioForm") BeneficioForm beneficioForm) {
        log.info("INICIO");
        log.info("Usuario connected ->{}",usuarioSession.getIdUsuario());
        log.info("Datos imagenes upload ->{}.",beneficioForm.toString());
        
        if(beneficioSession.getBeneficioForm()!=null){
            log.info("seteando imagenes upload");
           beneficioSession.getBeneficioForm().setImages(beneficioForm.getImages());
        }
        log.info("Datos imagenes session ->{}.",beneficioSession.getBeneficioForm().toString());
        
        //ModelAndView modelAndView = new ModelAndView("redirect:../home.html");
        ValidacionResponse validacion = beneficioService.validaGuardarBeneficio(beneficioSession.getBeneficioForm());
        String respJson =  new Gson().toJson(validacion.getValidacion());        
        log.info("FIN");
        return respJson;
    }
    
//    @RequestMapping(value = "/beneficio/guardar.html", method = RequestMethod.POST, produces = "text/html;charset=UTF-8")
//    public @ResponseBody String  guardarBeneficio(@ModelAttribute("beneficioForm") BeneficioForm beneficioForm) {
//        log.info("INICIO");
//        log.info("Usuario connected ->{}",usuarioSession.getIdUsuario());
//        log.info("Datos beneficio ->{}.",beneficioForm.toString());
//        
//        //ModelAndView modelAndView = new ModelAndView("redirect:../home.html");
//        beneficioService.validaGuardarBeneficio(beneficioForm);
//        
//        log.info("FIN");
//        String respJson =  new Gson().toJson(new Validacion("0", "0", "OK"));
//        return respJson;
//    }
    
    
    
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
    
    @RequestMapping(value="/beneficio/getComunaByIdReg.html", method=RequestMethod.GET, produces = "text/html;charset=UTF-8")
    public @ResponseBody String getComunaByIdReg(@RequestParam("idRegion") Integer idRegion, 
                                              HttpSession session){
        log.info("INICIO");
        List<Comuna> comunas = beneficioService.getComunaByIdReg(idRegion);
        if(comunas!=null){
            log.info("comunas.size()->{}",comunas.size());
        }
        String respJson =  new Gson().toJson(comunas);
        log.info("FIN");
        return respJson;
    }
    
     @RequestMapping(value="/beneficio/getSucursalByIdComuna.html", method=RequestMethod.GET, produces = "text/html;charset=UTF-8")
    public @ResponseBody String getSucursalByIdComuna(@RequestParam("idComuna") Integer idComuna, 
                                              HttpSession session){
        log.info("INICIO");
        List<SucursalProveedor> sucursales = beneficioService.getSucursalByIdComuna(idComuna);
        if(sucursales!=null){
            log.info("sucursales.size()->{}",sucursales.size());
        }
        String respJson =  new Gson().toJson(sucursales);
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
    
//    @RequestMapping(value = "/mantenedorBeneficio.html", method = RequestMethod.GET, produces = "text/html;charset=UTF-8")
//    public ModelAndView mantenedorBeneficio() {
//        log.info("INICIO");
//        log.info("Usuario connected ->{}",usuarioSession.getIdUsuario());
//        
//        
//        
//        ModelAndView modelAndView = new ModelAndView("home");
//        log.info("FIN");
//        return modelAndView;
//    }
//    
    //    @RequestMapping(value = "beneficio/cargarMantenedorBeneficio", method = RequestMethod.POST)
    @RequestMapping(value = "/beneficios.html", method = RequestMethod.GET, produces = "text/html;charset=UTF-8")
    public ModelAndView cargarMantenedorBeneficio() {
        log.info("Inicio");                    
        
        CargarMantenedorBeneficioResponse response = beneficioService.cargarMantenedorBeneficio();
        
        ModelAndView modelAndView = new ModelAndView("beneficios");
        
        modelAndView.addObject("beneficios", response.getListaBeneficios());        
        
        log.info("Fin");
        
        return modelAndView;
    }
   
    @RequestMapping(value="/beneficio/publicarBeneficios.html", method=RequestMethod.POST, produces = "text/html;charset=UTF-8")
    public @ResponseBody String publicarBeneficios(@RequestParam("listaIdBeneficios") List<Integer> listaIdBeneficios, HttpSession session){
        log.info("INICIO");
        log.info("Cantidad de beneficios a publicar ->{}",listaIdBeneficios.size());
        
        ValidacionResponse response = new ValidacionResponse();        
        
        PublicarBeneficiosRequest request = new PublicarBeneficiosRequest();
        request.setListaIdBeneficios(listaIdBeneficios);
        
        response = beneficioService.publicarBeneficios(request);
        
        //String respuesta = response.getValidacion().getMensaje();
        String respJson =  new Gson().toJson(response.getValidacion());
        log.info("respJson->{}",respJson);
        log.info("FIN");
        return respJson;
    }
    
}
