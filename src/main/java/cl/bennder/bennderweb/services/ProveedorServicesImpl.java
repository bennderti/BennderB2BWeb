/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.bennder.bennderweb.services;

import cl.bennder.bennderweb.constantes.URLServiciosBennderB2B;
import cl.bennder.bennderweb.properties.Properties;
import cl.bennder.bennderweb.rest.connector.RestConnector;
import cl.bennder.bennderweb.session.ProveedorSession;
import cl.bennder.bennderweb.session.UsuarioSession;
import cl.bennder.entitybennderwebrest.model.BeneficioImagen;
import cl.bennder.entitybennderwebrest.model.Proveedor;
import cl.bennder.entitybennderwebrest.model.Validacion;
import cl.bennder.entitybennderwebrest.request.CategoriaByIdRequest;
import cl.bennder.entitybennderwebrest.request.DatosGeneralProveedorRequest;
import cl.bennder.entitybennderwebrest.request.ProveedorIdRequest;
import cl.bennder.entitybennderwebrest.request.SubCategoriaProveedorRequest;
import cl.bennder.entitybennderwebrest.request.UploadBeneficioImagenRequest;
import cl.bennder.entitybennderwebrest.response.BeneficiosCargadorResponse;
import cl.bennder.entitybennderwebrest.response.CategoriasResponse;
import cl.bennder.entitybennderwebrest.response.DatosGeneralProveedorResponse;
import cl.bennder.entitybennderwebrest.response.ProveedoresResponse;
import cl.bennder.entitybennderwebrest.response.SubCategoriaProveedorResponse;
import cl.bennder.entitybennderwebrest.response.UploadBeneficioImagenResponse;
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
public class ProveedorServicesImpl implements ProveedorServices{

    private static final Logger log = LoggerFactory.getLogger(ProveedorServicesImpl.class);
    
    @Autowired
    private ProveedorSession proveedorSession;

    @Autowired
    private UsuarioSession usuarioSession;

    @Override
    public DatosGeneralProveedorResponse guardaDatosGeneralesProveedor(DatosGeneralProveedorRequest request) {
        return RestConnector.clientRestGeneric(Properties.URL_SERVIDOR + URLServiciosBennderB2B.URL_GURDA_DATOS_GRALES_PROVEEDOR, request, DatosGeneralProveedorResponse.class, usuarioSession.getToken());
    }

    /***
     * Obtiene las categorias por id de categoria
     * @param request
     * @return 
     */
    @Override
//    public CategoriasResponse obtenerCategoriasById(CategoriaByIdRequest request) {
    public SubCategoriaProveedorResponse getSubCategoriasProveedor(SubCategoriaProveedorRequest request) {
        return RestConnector.clientRestGeneric(Properties.URL_SERVIDOR + URLServiciosBennderB2B.URL_GET_SUB_CATEGORIAS_BY_ID_CAT_PROV, request, SubCategoriaProveedorResponse.class, usuarioSession.getToken());
    }

    @Override
    public BeneficiosCargadorResponse getBeneficiosByIdCat(CategoriaByIdRequest request) {
        return RestConnector.clientRestGeneric(Properties.URL_SERVIDOR + URLServiciosBennderB2B.URL_GET_BENEFICIOS_BY_ID_CAT, request, BeneficiosCargadorResponse.class, usuarioSession.getToken());
    }
    
    @Override
    public UploadBeneficioImagenResponse uploadImagenesBeneficios(List<MultipartFile> imagenes, Integer idBeneficio,Integer indexPrincipal, Integer idProveedor) { 
        UploadBeneficioImagenResponse response = new UploadBeneficioImagenResponse();
        response.setValidacion(new Validacion("0","1","Problemas al subir imagenes a beneficio"));
        log.info("inicio");
        try {
            if(indexPrincipal!=null && idBeneficio != null){
                if(imagenes!=null && imagenes.size() > 0){
                    log.info("imagenes.size() ->{}",imagenes.size());
                    log.info("completando datos request");
                    UploadBeneficioImagenRequest request = new UploadBeneficioImagenRequest();
                    request.setIdProveedor(idProveedor);
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
                    }
                    log.info("inicio - consultando servicio para enviar imagenes de beneficio...");
                    response = RestConnector.clientRestGeneric(Properties.URL_SERVIDOR + URLServiciosBennderB2B.URL_UPLOAD_IMAGENES_BENEFICIOS, request, UploadBeneficioImagenResponse.class, usuarioSession.getToken());
                    log.info("fin - consultando servicio para enviar imagenes de beneficio...");
                }
                else{
                    response.getValidacion().setCodigoNegocio("1");
                    response.getValidacion().setMensaje("Sin imagenes para cargar a beneficio");
                    log.info("Sin imagenes para cargar a beneficio");
                }
            }
            else{
                response.getValidacion().setCodigoNegocio("1");
                response.getValidacion().setMensaje("Faltan completar datos, beneficio o selección principal.");
                log.info("Faltan completar datos, beneficio o selección principal.");
            }
        } catch (Exception e) {
            response.setValidacion(new Validacion("1","1","Error al subir imagenes"));
            log.error("Exception uploadImagenesBeneficios,",e);
        }
        log.info("fin");
                
        return response;       
    }
    
    
    @Override
    public Proveedor getProveedorByIdLista(List<Proveedor> lista, Integer idProveedor) {
        Proveedor proveedor = null;
        if(lista!=null && lista.size() > 0){
            for(Proveedor p : lista){
                if(p.getIdProveedor().compareTo(idProveedor) == 0){
                    log.info("Se ha encontrado proveedor según id ->{}",idProveedor);
                    return p;
                }
            }
        }
        return proveedor;
    }
    
    
    @Override
    public CategoriasResponse obtenerCategoriaByProveedor(ProveedorIdRequest request) {
        return RestConnector.clientRestGeneric(Properties.URL_SERVIDOR + URLServiciosBennderB2B.URL_GET_CATEGORIAS_BY_PROVEEDOR, request, CategoriasResponse.class, usuarioSession.getToken());
    }

    @Override
    public ProveedoresResponse obtenerProveedorHabilitados(ProveedorIdRequest request) {
        return RestConnector.clientRestGeneric(Properties.URL_SERVIDOR + URLServiciosBennderB2B.URL_GET_PROVEEDORES_HABILITADOS, request, ProveedoresResponse.class, usuarioSession.getToken());
    }

    @Override
    public List<Proveedor> getProveedoreSessionServices() {
        List<Proveedor> lista = null;
        if(proveedorSession!=null && proveedorSession.getLista()!=null){
            log.info("obteniendo proveedores de capa de session");
            lista = proveedorSession.getLista();
        }
        else{
            log.info("obteniendo proveedores de capa de servicio");
            lista = this.obtenerProveedorHabilitados(new ProveedorIdRequest()).getProveedores();
            proveedorSession.setLista(lista);
        }
        return lista;
    }
    
    
    
}
