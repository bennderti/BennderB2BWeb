package cl.bennder.bennderweb.controller;



import cl.bennder.bennderweb.model.FileUploadForm;
import cl.bennder.bennderweb.model.ProveedorForm;
import cl.bennder.bennderweb.session.UsuarioSession;
import cl.bennder.bennderweb.services.ProveedorServices;
import cl.bennder.bennderweb.session.ProveedorSession;
import cl.bennder.entitybennderwebrest.model.Proveedor;
import cl.bennder.entitybennderwebrest.model.Validacion;
import cl.bennder.entitybennderwebrest.request.CategoriaByIdRequest;
import cl.bennder.entitybennderwebrest.request.DatosGeneralProveedorRequest;
import cl.bennder.entitybennderwebrest.request.ProveedorIdRequest;
import cl.bennder.entitybennderwebrest.request.SubCategoriaProveedorRequest;
import cl.bennder.entitybennderwebrest.response.BeneficiosCargadorResponse;
import cl.bennder.entitybennderwebrest.response.CategoriasResponse;
import cl.bennder.entitybennderwebrest.response.DatosGeneralProveedorResponse;
import cl.bennder.entitybennderwebrest.response.SubCategoriaProveedorResponse;
import cl.bennder.entitybennderwebrest.response.UploadBeneficioImagenResponse;
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
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by Diego on 01-03-2017.
 */
@Controller
public class ProveedorController {

    private static final Logger log = LoggerFactory.getLogger(ProveedorController.class);

    
    @Autowired
    private ProveedorServices proveedorServices;
    

    @Autowired
    private UsuarioSession usuarioSession;
    
    @Autowired
    private ProveedorSession proveedorSession;
    
    /***
     * Método que carga propias del proveedor
     * @return View para visualizar funcionalidaes de proveedor
     */
    //@RequestMapping(value = "adminProveedor.html", method = RequestMethod.GET, produces = "text/html;charset=UTF-8")
    @RequestMapping(value = "proveedor/admin.html", method = RequestMethod.GET, produces = "text/html;charset=UTF-8")
    public ModelAndView adminProveedor() {
        log.info("INICIO");
        log.info("Usuario connected ->{}",usuarioSession.getIdUsuario());
        ModelAndView modelAndView = new ModelAndView("proveedor/adminProveedor");
        log.info("FIN");
        return modelAndView;
    }
    /***
     * Método que carga información general del proveedor
     * @param idProveedor Identificador de proveedor seleccionado
     * @return Vista para cargar información generarl de proveedor seleccionado
     */
    @RequestMapping(value = "proveedor/informacionGeneral.html", method = RequestMethod.GET, produces = "text/html;charset=UTF-8")
    public ModelAndView getInformacionGeneral(@RequestParam("id") Integer idProveedor) {
        log.info("INICIO");
        log.info("Usuario connected ->{}",usuarioSession.getIdUsuario());
        ModelAndView modelAndView = new ModelAndView("proveedor/informacionGeneral");
        List<Proveedor> lista = proveedorServices.getProveedoreSessionServices();
        modelAndView.addObject("proveedores", lista); 
        modelAndView.addObject("proveedorForm", new ProveedorForm());
        Proveedor p = proveedorServices.getProveedorByIdLista(lista, idProveedor);
        if(p != null){            
            ProveedorForm pf = new ProveedorForm(null, idProveedor,p.getIdProveedor(), p.getNombre(), p.getRut(), p.getRutDv(), p.getPathLogo(),null,p.getLogo(),null);
            //pf.setIdProveedorSelect(idProveedor);
            modelAndView.addObject("proveedorForm", pf);
        }
        log.info("FIN");
        return modelAndView;
    }
    
    /***
     * Método que guarda información general del proveedor
     * @param proveedorForm Datos generales de formulario de proveedor
     * @return 
     */
    @RequestMapping(value = "proveedor/informacionGeneral.html", method = RequestMethod.POST, produces = "text/html;charset=UTF-8")
    public /*@ResponseBody String*/ ModelAndView guardaInformacionGeneral(@ModelAttribute("proveedorForm") ProveedorForm proveedorForm) {
        log.info("INICIO");
        log.info("Usuario connected ->{}",usuarioSession.getIdUsuario());
        int tamanio = 0;
        ModelAndView modelAndView = new ModelAndView("redirect:../proveedor/lista.html");
        try {            
            if(proveedorForm.getLogoImagen()!=null && proveedorForm.getLogoImagen().getBytes()!=null){
                tamanio = proveedorForm.getLogoImagen().getBytes().length;
                log.info("proveedorForm.getLogoImagen())->{}, tamanio->{}",proveedorForm.getLogoImagen().getName(),tamanio);
            }
            DatosGeneralProveedorRequest request = new DatosGeneralProveedorRequest(new Proveedor(proveedorForm.getIdProveedorSelect(), proveedorForm.getNombre(), proveedorForm.getRut(), null, proveedorForm.getPathLogo(), null,proveedorForm.getLogoImagen()!=null?proveedorForm.getLogoImagen().getBytes():null,proveedorForm.getLogoImagen()!=null?proveedorForm.getLogoImagen().getOriginalFilename():null));
            //request.setIdUsuario(usuarioSession.getIdUsuario());
            DatosGeneralProveedorResponse response = proveedorServices.guardaDatosGeneralesProveedor(request);
            if("0".equals(response.getValidacion().getCodigo())){
                proveedorSession.setLista(null);
            }
            proveedorSession.setValidacion(response.getValidacion());            
            
        } catch (IOException ex) {
            log.error("Error en guardaInformacionGeneral, ",ex);
        }
        log.info("Datos proveedor ->{}, tamaño logo ->{} Bytes.",proveedorForm.toString(),tamanio);
        log.info("FIN");
        return modelAndView;
    }
    
    @RequestMapping(value = "proveedor/lista.html", method = RequestMethod.GET, produces = "text/html;charset=UTF-8")
    public ModelAndView listaProveedores() {
        log.info("INICIO");
        log.info("Usuario connected ->{}",usuarioSession.getIdUsuario());
        ModelAndView modelAndView = new ModelAndView("proveedor/informacionGeneral");
        modelAndView.addObject("proveedores", proveedorServices.getProveedoreSessionServices());
        modelAndView.addObject("proveedorForm", new ProveedorForm());
        modelAndView.addObject("validacion", proveedorSession.getValidacion());
        log.info("FIN");
        return modelAndView;
    }
    /***
     * Método que carga información lista de proveedor para cargar imagenes de beneficios
     * @return View para visualizar información general de proveedor
     */
    @RequestMapping(value = "proveedor/cargaImagenesBeneficio.html", method = RequestMethod.GET, produces = "text/html;charset=UTF-8")
    public ModelAndView cargaBeneficiosProveedores() {
        log.info("INICIO");
        log.info("Usuario connected ->{}",usuarioSession.getIdUsuario());
        ModelAndView modelAndView = new ModelAndView("proveedor/cargadorImagenes");
        modelAndView.addObject("proveedores", proveedorServices.getProveedoreSessionServices());
        log.info("FIN");
        return modelAndView;
    }
    
    @RequestMapping(value="proveedor/obtenerCategoriaByProveedor.html", method=RequestMethod.GET, produces = "text/html;charset=UTF-8")
    public @ResponseBody String obtenerCategoriaByProveedor(@RequestParam("id") Integer idProveedor, HttpSession session){
        log.info("INICIO - idProveedor ->{}",idProveedor);
        CategoriasResponse response = new CategoriasResponse();
        response.setValidacion(new Validacion("0", "1", "Sin categorias encontradas"));
        if(idProveedor!=null){
            response = proveedorServices.obtenerCategoriaByProveedor(new ProveedorIdRequest(idProveedor));
        }
        String respJson =  new Gson().toJson(response);
        log.info("FIN");
        return respJson;
    }
    
    @RequestMapping(value="proveedor/getSubCatById.html", method=RequestMethod.GET, produces = "text/html;charset=UTF-8")
    public @ResponseBody String getSubCatById(@RequestParam("idCat") Integer idCategoria, 
                                              @RequestParam("idProv") Integer idProveedor,
                                              HttpSession session){
        log.info("INICIO - idCategoria ->{},idProveedor->{}",idCategoria,idProveedor);
        SubCategoriaProveedorResponse response = new SubCategoriaProveedorResponse();
        response.setValidacion(new Validacion("0", "1", "Sin categorias encontradas"));
        if(idCategoria!=null){
            response = proveedorServices.getSubCategoriasProveedor(new SubCategoriaProveedorRequest(idCategoria, idProveedor));
        }
        String respJson =  new Gson().toJson(response);
        log.info("FIN");
        return respJson;
    }
    
    @RequestMapping(value="proveedor/getBeneficiosByIdCat.html", method=RequestMethod.GET, produces = "text/html;charset=UTF-8")
    public @ResponseBody String getBeneficiosByIdCat(@RequestParam("id") Integer idCategoria, HttpSession session){
        log.info("INICIO - idBeneficio ->{}",idCategoria);
        BeneficiosCargadorResponse response = new BeneficiosCargadorResponse();
        response.setValidacion(new Validacion("0", "1", "Sin beneficios encontradas"));
        if(idCategoria!=null){
            response = proveedorServices.getBeneficiosByIdCat(new CategoriaByIdRequest(idCategoria));
        }
        String respJson =  new Gson().toJson(response);
        log.info("FIN");
        return respJson;
    }
    @RequestMapping(value = "proveedor/uploadImagesBeneficios.html", method = RequestMethod.POST)
    public ModelAndView uploadImagesBeneficios(@ModelAttribute("uploadForm") FileUploadForm uploadForm,
                                               @RequestParam("idBeneficio") Integer idBeneficio,
                                               @RequestParam("indexPrincipal") Integer indexPrincipal,
                                               @RequestParam("idProv") Integer idProveedor) {
        log.info("INICIO");
        log.info("idProveedor ->{}",idProveedor);
        log.info("idBeneficio ->{}",idBeneficio);
        log.info("indexPrincipal ->{}",indexPrincipal);
        UploadBeneficioImagenResponse response =  proveedorServices.uploadImagenesBeneficios(uploadForm.getFiles(), idBeneficio, indexPrincipal,idProveedor);
        ModelAndView modelAndView = new ModelAndView("proveedor/cargadorImagenes");
        modelAndView.addObject("proveedores", proveedorServices.obtenerProveedorHabilitados(new ProveedorIdRequest()).getProveedores());
        modelAndView.addObject("respuesta",response.getValidacion());
        
        log.info("FIN");
        return modelAndView;
	}
        
        
    
    
//        @RequestMapping(value = "/files/{file_name}.html", method = RequestMethod.GET)
//        public void getFile(
//            @PathVariable("file_name") String fileName, 
//            HttpServletResponse response) {
//            try {
//              // get your file as InputStream
//              //InputStream is = ...;
//              // copy it to response's OutputStream
//              log.info("file_name-->{}",fileName);
//              File initialFile = new File("C:\\Users\\dyanez\\AppData\\Local\\Temp\\sample1.pdf");
//              //InputStream is = new ByteArrayInputStream(decodedBytes);
//              InputStream targetStream = FileUtils.openInputStream(initialFile);
//              org.apache.commons.io.IOUtils.copy(targetStream, response.getOutputStream());
//              response.flushBuffer();
//              response.setContentType("application/pdf");
//            } catch (IOException ex) {
//              log.info("Error writing file to output stream. Filename was '{}'", fileName, ex);
//              throw new RuntimeException("IOError writing file to output stream");
//            }
//
//        }
    
    
}
