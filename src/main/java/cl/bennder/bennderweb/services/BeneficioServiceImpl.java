/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.bennder.bennderweb.services;

import cl.bennder.bennderweb.constantes.TipoImagenes;
import cl.bennder.bennderweb.constantes.URLServiciosBennderB2B;
import cl.bennder.bennderweb.model.BeneficioForm;
import cl.bennder.bennderweb.properties.Properties;
import cl.bennder.bennderweb.rest.connector.RestConnector;
import cl.bennder.bennderweb.session.BeneficioSession;
import cl.bennder.bennderweb.session.UsuarioSession;
import cl.bennder.entitybennderwebrest.model.BeneficioImagen;
import cl.bennder.entitybennderwebrest.model.Categoria;
import cl.bennder.entitybennderwebrest.model.Comuna;
import cl.bennder.entitybennderwebrest.model.ImagenGenerica;
import cl.bennder.entitybennderwebrest.model.SucursalProveedor;
import cl.bennder.entitybennderwebrest.model.TipoBeneficio;
import cl.bennder.entitybennderwebrest.model.Validacion;
import cl.bennder.entitybennderwebrest.request.GetTodasCategoriaRequest;
import cl.bennder.entitybennderwebrest.request.InfoBeneficioRequest;
import cl.bennder.entitybennderwebrest.request.InfoInicioBeneficioRequest;
import cl.bennder.entitybennderwebrest.request.PublicarBeneficiosRequest;
import cl.bennder.entitybennderwebrest.request.UploadImagenesGenericaRequest;
import cl.bennder.entitybennderwebrest.response.CargarMantenedorBeneficioResponse;
import cl.bennder.entitybennderwebrest.response.GetTodasCategoriaResponse;
import cl.bennder.entitybennderwebrest.response.InfoBeneficioResponse;
import cl.bennder.entitybennderwebrest.response.InfoInicioBeneficioResponse;
import cl.bennder.entitybennderwebrest.response.UploadImagenesGenericaResponse;
import cl.bennder.entitybennderwebrest.response.ValidacionResponse;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author dyanez
 */
@Service
public class BeneficioServiceImpl implements BeneficioService{

    private static final Logger log = LoggerFactory.getLogger(BeneficioServiceImpl.class);
    
    @Autowired
    private UsuarioSession usuarioSession;
    
    @Autowired
    private BeneficioSession beneficioSession;

    

    @Override
    public void seleccionaSucursales(List<SucursalProveedor> sucursales, List<Integer> sucursalesSelecciondas) {
        if(sucursales!=null && sucursales.size() > 0){
            for(SucursalProveedor sp : sucursales){
                for(Integer is : sucursalesSelecciondas){
                    if(sp.getIdSucursal().compareTo(is) == 0){
                        sp.setSelected(1);
                        break;
                    }
                }
            }
        }
    }
    
    

    @Override
    public BeneficioForm convertirDatosFormularioBeneficio(InfoBeneficioRequest request) {
        log.info("inicio");
        BeneficioForm beneficioForm = new BeneficioForm();
        
        if(request != null){
            log.info("datos recibidos para beneficio ->{}",request.getIdBeneficio());
            beneficioForm.setNombre(request.getTitulo());
            beneficioForm.setIdBeneficio(request.getIdBeneficio());
            beneficioForm.setDescripcion(request.getDescripcion());
            beneficioForm.setStock(request.getStock());
            beneficioForm.setLimiteStock(request.getLimiteStock());
            SimpleDateFormat formatoDelTexto = new SimpleDateFormat("yyyy-MM-dd");
            beneficioForm.setFechaInicio(formatoDelTexto.format(request.getFechaInicial()));
            beneficioForm.setFechaExpiracion(formatoDelTexto.format(request.getFechaExpiracion()));
            beneficioForm.setIdCategoriaSelected(request.getIdCategoria());
            beneficioForm.setIdSubCategoriaSelected(request.getIdSubCategoria());
            beneficioForm.setAdicionales(request.getAdicionales());
            beneficioForm.setSucursalesSelected(request.getSucursales());
            beneficioForm.setCondiciones(request.getCondiciones());
            beneficioForm.setPorcentajeDescuento(request.getPorcentajeDescuento());
            beneficioForm.setPrecioNormal(request.getPrecioNormal());
            beneficioForm.setPrecioOferta(request.getPrecioOferta());
            beneficioForm.setIdTipoBeneficioSelected(request.getTipoBeneficio().getIdTipoBeneficio());
            if(request.isTieneImagenGenerica()){
               beneficioForm.setTipoCargaImagen(TipoImagenes.GENERICA);
            }
            else{
                beneficioForm.setTipoCargaImagen(TipoImagenes.PRIVADA);
            }
            //genéricos y específicos
            if(request.getImagenesBeneficio()!=null && request.getImagenesBeneficio().size() > 0){
                for(BeneficioImagen bimg: request.getImagenesBeneficio()){
                   beneficioForm.getImagenesBeneficio().add(bimg.getUrlImagen());
                }
            }
        }
        else{
            log.info("sin datos para beneficio encontrado");
        }

        
        
        return beneficioForm;
    }
    
    

    @Override
    public List<SucursalProveedor> getSucursalByIdComuna(Integer idComuna) {
        
        List<SucursalProveedor>  lista = new ArrayList<>();
        if(beneficioSession!=null && beneficioSession.getSucursales()!=null && beneficioSession.getSucursales().size() > 0){
            for(SucursalProveedor s : beneficioSession.getSucursales()){
                if(s.getIdComuna().compareTo(idComuna) == 0){
                    lista.add(s);
                }
            }
        }        
        return lista;
    }

    @Override
    public List<Comuna> getComunaByIdReg(Integer idRegion) {
        List<Comuna>  lista = new ArrayList<>();
        if(beneficioSession!=null && beneficioSession.getComunasSucursales()!=null && beneficioSession.getComunasSucursales().size() > 0){
            for(Comuna c : beneficioSession.getComunasSucursales()){
                if(c.getRegion()!=null && c.getRegion().getIdRegion()!=null &&  c.getRegion().getIdRegion().compareTo(idRegion) == 0){
                    lista.add(c);
                }
            }
        }        
        return lista;
    }
    
    

    @Override
    public ValidacionResponse validaGuardarBeneficio(BeneficioForm beneficioForm) {
        ValidacionResponse response = new ValidacionResponse(new Validacion("0", "1", "Problemas al validar datos de beneficio a guardar"));
        log.info("inicio");
        log.info("Datos formulario ->{}",beneficioForm.toString());
        InfoBeneficioRequest request = new   InfoBeneficioRequest();      
        try {   
            request.setIdBeneficio(beneficioForm.getIdBeneficio());
            request.setTitulo(beneficioForm.getNombre());
            request.setDescripcion(beneficioForm.getDescripcion());
            request.setStock(beneficioForm.getStock());
            request.setLimiteStock(beneficioForm.getLimiteStock());
            SimpleDateFormat formatoDelTexto = new SimpleDateFormat("yyyy-MM-dd");
            request.setFechaInicial(formatoDelTexto.parse(beneficioForm.getFechaInicio()));
            request.setFechaExpiracion(formatoDelTexto.parse(beneficioForm.getFechaExpiracion()));
            request.setIdCategoria(beneficioForm.getIdSubCategoriaSelected());
            
            request.setAdicionales(beneficioForm.getAdicionales());
            request.setSucursales(beneficioForm.getSucursalesSelected());
            request.setCondiciones(beneficioForm.getCondiciones());
            request.setPorcentajeDescuento(beneficioForm.getPorcentajeDescuento());
            request.setPrecioNormal(beneficioForm.getPrecioNormal());
            request.setPrecioOferta(beneficioForm.getPrecioOferta());
            if(beneficioForm.getIdTipoBeneficioSelected()!=null){
                TipoBeneficio tb = new TipoBeneficio();
                tb.setIdTipoBeneficio(beneficioForm.getIdTipoBeneficioSelected());
                request.setTipoBeneficio(tb);
            }
            
            /*
            int ordenBase = 1;
                    int orden = 1;
                    for (MultipartFile multipartFile : imagenes) {
                            String fileName = multipartFile.getOriginalFilename();
                            log.info("imagen subida ->{}",fileName);
                            //Integer idBeneficio, Integer idImagen, String nombre, byte[] imagen, Integer orden, String imagenBase64, String path
                            //BeneficioImagen bimagen = new BeneficioImagen(idBeneficio, fileName, multipartFile.getBytes(), ordenBase);
                            BeneficioImagen bimagen = new BeneficioImagen();
                            bimagen.setNombre(fileName);
                            bimagen.setImagen(multipartFile.getBytes());
                            bimagen.setIdBeneficio(idBeneficio);
                            if(ordenBase < (indexPrincipal + 1)){
                                orden = ordenBase + 1;
                            }
                            else if ( ordenBase == (indexPrincipal + 1 )){
                                orden = 1;//ya que indexPrincipal comienza desde 0
                                log.info("La imagen ->{} se configura como principal (orden 1)",fileName);
                            }
                            else{
                                orden  = ordenBase;
                            }
                            log.info("Orden a actualizar ->{} para beneficio ->{}",orden,fileName);
                            bimagen.setOrden(orden);
                            ordenBase++;
                            request.getBeneficioImagenes().add(bimagen);
                    }*/
            
            
            if(TipoImagenes.PRIVADA.equals(beneficioForm.getTipoCargaImagen())){
                log.info("Proveedor ha indicado imágenes privadas...");
                log.info("Cargando información de imágenes privadas...");
                List<BeneficioImagen> temps = new ArrayList<>();
                boolean tieneImages = true;
                if(beneficioForm.getImages()!=null && beneficioForm.getImages().size()==1 && 
                   beneficioForm.getImages().get(0).getBytes()!=null && beneficioForm.getImages().get(0).getBytes().length == 0){
                    tieneImages = false;
                    log.info("Sin imágenes privadas válidas...");
                }
                
                
                if(beneficioForm.getIdBeneficio()!=null && !tieneImages){
                    log.info("Edición de beneficio con imagenes privadas pero sin modificar iumagenes desde dialogo...");
                    
                    if(beneficioForm.getNameImagenesValidas()!=null && beneficioForm.getNameImagenesValidas().size() > 0){
                        List<ImagenGenerica> tempsPrivada = new ArrayList<>();
                        ImagenGenerica imgGenerica = null;
                        for(String urlImg : beneficioForm.getNameImagenesValidas()){
                                imgGenerica = new ImagenGenerica();
                                imgGenerica.setUrlImagen(urlImg);
                                if(!urlImg.contains(beneficioForm.getNameImagePrincipal())){                                
                                    tempsPrivada.add(imgGenerica);
                                }
                                else{
                                    log.info("Imagen principal ->{}",beneficioForm.getNameImagePrincipal());
                                    request.getImagenesGenericas().add(imgGenerica);
                                }
                        }
                        //utilizamos aitrbuto de imagene genérica
                        request.setTieneImagenGenerica(false);
                        request.getImagenesGenericas().addAll(tempsPrivada);
                        request.setImagenesBeneficio(null);
                    } 
                }
                else{
                    if(beneficioForm.getImages()!=null && beneficioForm.getImages().size() > 0){
                         for(MultipartFile m : beneficioForm.getImages()){
                             if(m!=null && m.getBytes()!=null && m.getBytes().length > 0){                            
                                 if(beneficioForm.getNameImagenesValidas()!=null && beneficioForm.getNameImagenesValidas().size()> 0 && beneficioForm.getNameImagenesValidas().contains(m.getOriginalFilename())){
                                    log.info("m.getOriginalFilename() válida ->{}",m.getOriginalFilename());
                                    BeneficioImagen img = new BeneficioImagen();
                                    img.setNombre(m.getOriginalFilename());
                                    img.setImagen(m.getBytes());
                                    if(!img.getNombre().equals(beneficioForm.getNameImagePrincipal())){

                                        temps.add(img);
                                    }
                                    else{
                                        log.info("Imagen principal ->{}",beneficioForm.getNameImagePrincipal());
                                        request.getImagenesBeneficio().add(img);
                                    }
                                 }
                                 else{
                                     log.info("m.getOriginalFilename() NO válida(dimensiones no válidas)->{}",m.getOriginalFilename());
                                 }

                             }
                         }
                         request.getImagenesBeneficio().addAll(temps);
                         if(request.getImagenesBeneficio()!=null && request.getImagenesBeneficio().size()>0){
                            request.setTieneImagenGenerica(false);
                         }
                     }
                }
            }
            else{
                log.info("Proveedor ha indicado imágenes genéricas...");
                log.info("Cargando información de imágenes genéricas...");
                if(beneficioForm.getNameImagenesValidas()!=null && beneficioForm.getNameImagenesValidas().size() > 0){
                    List<ImagenGenerica> temps = new ArrayList<>();
                    ImagenGenerica imgGenerica = null;
                    for(String urlImg : beneficioForm.getNameImagenesValidas()){
                            imgGenerica = new ImagenGenerica();
                            imgGenerica.setUrlImagen(urlImg);
                            if(!urlImg.contains(beneficioForm.getNameImagePrincipal())){                                
                                temps.add(imgGenerica);
                            }
                            else{
                                log.info("Imagen principal ->{}",beneficioForm.getNameImagePrincipal());
                                request.getImagenesGenericas().add(imgGenerica);
                            }
                    }
                    if(request.getImagenesGenericas()!=null && request.getImagenesGenericas().size() > 0){
                        request.setTieneImagenGenerica(true);
                    }
                    
                    
                    request.getImagenesGenericas().addAll(temps);
                }                
            }
            
            
            
            //request.setImagenesGenericas(beneficioForm.getImagenesGenericas());
            log.info("Datos formulario(parte 2,request) ->{}",request.toString());
            log.info("consumiendo servicio encargado de guardar datos de beneficio");      
            InfoBeneficioResponse rGuardarBeneficio = RestConnector.clientRestGeneric(Properties.URL_SERVIDOR + URLServiciosBennderB2B.URL_GUARDAR_BENEFICIO, request, InfoBeneficioResponse.class, usuarioSession.getToken());
            response.setValidacion(rGuardarBeneficio.getValidacion());
            log.info("Validación de servicio guardar beneficio ->{}",rGuardarBeneficio.toString());
            
        } catch (Exception ex) {
            log.error("Error en validaGuardarBeneficio, ",ex);
            response.setValidacion(new Validacion("1","1","Error al validar datos de beneficio a guardar"));
        }
        log.info("fin");
        return response;
    }
    
    

    @Override
    public List<String> getImagenesGenericasByCatSubSession(Integer idCat,Integer idSubCat) {
        List<String> urlImgs = new ArrayList<>();
        if(beneficioSession!=null && beneficioSession.getIamgenesGenericas()!=null && beneficioSession.getIamgenesGenericas().size() > 0){
            for(ImagenGenerica img : beneficioSession.getIamgenesGenericas()){
                if(img.getIdCategoria().compareTo(idCat) == 0 && img.getIdSubCategoria().compareTo(idSubCat) == 0){
                    urlImgs.add(img.getUrlImagen());
                }
            }
        }
        
        return urlImgs;
    }
    
    @Override
    public InfoInicioBeneficioResponse getInfoInicioCreaActualizaBeneficio(InfoInicioBeneficioRequest request) {
        return RestConnector.clientRestGeneric(Properties.URL_SERVIDOR + URLServiciosBennderB2B.URL_INFO_CREA_UPDATE_BENEFICIO, request, InfoInicioBeneficioResponse.class, usuarioSession.getToken());
    }
    

    @Override
    public UploadImagenesGenericaResponse uploadImagenesGenerica(UploadImagenesGenericaRequest request) {
        return RestConnector.clientRestGeneric(Properties.URL_SERVIDOR + URLServiciosBennderB2B.URL_UPLOAD_IMAGENES_GENERICA, request, UploadImagenesGenericaResponse.class, usuarioSession.getToken());
    }
    
    

    @Override
    public GetTodasCategoriaResponse getTodasCategorias(GetTodasCategoriaRequest request) {
        GetTodasCategoriaResponse r = RestConnector.clientRestGeneric(Properties.URL_SERVIDOR + URLServiciosBennderB2B.URL_GET_ALL_CATEGORIA, request, GetTodasCategoriaResponse.class, usuarioSession.getToken());
        beneficioSession.setCategorias(r.getCategorias());
        return r;
    }
    
    

    @Override
    public List<SucursalProveedor> sucursalesProveedor() {
        List<SucursalProveedor> sucursalProveedores = new ArrayList<>();
        sucursalProveedores.add(new SucursalProveedor(1, 1, "Sucursal 1"));
        sucursalProveedores.add(new SucursalProveedor(2, 1, "Sucursal 2"));
        sucursalProveedores.add(new SucursalProveedor(3, 1, "Sucursal 3"));
        sucursalProveedores.add(new SucursalProveedor(4, 1, "Sucursal 4"));
        return sucursalProveedores;
    }
    
    
    
//    @Override
//    public List<Categoria> getCategorias() {
//       
//        List<Categoria> SubCategorias = new ArrayList<>();
//        SubCategorias.add(new Categoria(11, "Sub Categoria 11", 1, null));
//        SubCategorias.add(new Categoria(12, "Sub Categoria 12", 1, null));
//        SubCategorias.add(new Categoria(13, "Sub Categoria 13", 1, null));
//        
//        List<Categoria> SubCategorias2 = new ArrayList<>();
//        SubCategorias2.add(new Categoria(21, "Sub Categoria 21", 2, null));
//        SubCategorias2.add(new Categoria(22, "Sub Categoria 22", 2, null));
//        SubCategorias2.add(new Categoria(23, "Sub Categoria 23", 2, null));
//        
//        List<Categoria> SubCategorias3 = new ArrayList<>();
//        SubCategorias3.add(new Categoria(31, "Sub Categoria 31", 3, null));
//        SubCategorias3.add(new Categoria(32, "Sub Categoria 32", 3, null));
//        SubCategorias3.add(new Categoria(33, "Sub Categoria 33", 3, null));
//        
//        List<Categoria> categorias = new ArrayList<>();
//        categorias.add(new Categoria(1, "categoria 1", -1, SubCategorias));
//        categorias.add(new Categoria(2, "categoria 2", -1, SubCategorias2));
//        categorias.add(new Categoria(3, "categoria 3", -1, SubCategorias3));
//        
//        beneficioSession.setCategorias(categorias);
//        return categorias;
//    }

    @Override
    public List<Categoria> getSubCategoriasByIdCat(Integer idCat) {
        List<Categoria> subCategorias = new ArrayList<>();
        if(beneficioSession.getCategorias() == null){
            GetTodasCategoriaRequest r = new GetTodasCategoriaRequest();
            //r.setIdUsuario(usuarioSession.getIdUsuario());
            beneficioSession.setCategorias(getTodasCategorias(r).getCategorias());
        }
        if(beneficioSession!=null && beneficioSession.getCategorias()!=null){
            for(Categoria c : beneficioSession.getCategorias()){
                if(c.getIdCategoria().compareTo(idCat) == 0){
                   subCategorias = c.getSubCategorias();
                   log.info("sub.categorias encontradas para categoria ->{}",idCat);
                   break;
                }
            }
        }
        
        return subCategorias;
    }

    @Override
    public CargarMantenedorBeneficioResponse cargarMantenedorBeneficio() {
        return RestConnector.clientRestGeneric(Properties.URL_SERVIDOR + URLServiciosBennderB2B.URL_CARGAR_MANTENEDOR_BENEFICIO, this, CargarMantenedorBeneficioResponse.class, usuarioSession.getToken());
    }

    @Override
    public ValidacionResponse publicarBeneficios(PublicarBeneficiosRequest request) {
        return RestConnector.clientRestGeneric(Properties.URL_SERVIDOR + URLServiciosBennderB2B.URL_PUBLICAR_BENEFICIO, request, ValidacionResponse.class, usuarioSession.getToken());
    }
}
