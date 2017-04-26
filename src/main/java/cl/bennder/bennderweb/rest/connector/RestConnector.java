/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.bennder.bennderweb.rest.connector;

import cl.bennder.bennderweb.constantes.URLServiciosBennderB2B;
import cl.bennder.bennderweb.properties.Properties;
import cl.bennder.entitybennderwebrest.request.CanjeaCuponRequest;
import cl.bennder.entitybennderwebrest.request.CategoriaByIdRequest;
import cl.bennder.entitybennderwebrest.request.CategoriasRequest;
import cl.bennder.entitybennderwebrest.request.DatosGeneralProveedorRequest;
import cl.bennder.entitybennderwebrest.request.GeneraCuponQrRequest;
import cl.bennder.entitybennderwebrest.request.GetCuponBeneficioRequest;
import cl.bennder.entitybennderwebrest.request.LoginRequest;
import cl.bennder.entitybennderwebrest.request.ProveedorIdRequest;
import cl.bennder.entitybennderwebrest.request.RecuperacionPasswordRequest;
import cl.bennder.entitybennderwebrest.request.SubCategoriaProveedorRequest;
import cl.bennder.entitybennderwebrest.request.UploadBeneficioImagenRequest;
import cl.bennder.entitybennderwebrest.request.ValidacionCuponPOSRequest;
import cl.bennder.entitybennderwebrest.response.BeneficiosCargadorResponse;
import cl.bennder.entitybennderwebrest.response.CanjeaCuponResponse;
import cl.bennder.entitybennderwebrest.response.CategoriasResponse;
import cl.bennder.entitybennderwebrest.response.DatosGeneralProveedorResponse;
import cl.bennder.entitybennderwebrest.response.GeneraCuponQrResponse;
import cl.bennder.entitybennderwebrest.response.GetCuponBeneficioResponse;
import cl.bennder.entitybennderwebrest.response.LoginResponse;
import cl.bennder.entitybennderwebrest.response.ProveedoresResponse;
import cl.bennder.entitybennderwebrest.response.SubCategoriaProveedorResponse;
import cl.bennder.entitybennderwebrest.response.UploadBeneficioImagenResponse;
import cl.bennder.entitybennderwebrest.response.ValidacionCuponPOSResponse;
import cl.bennder.entitybennderwebrest.response.ValidacionResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.web.client.RestTemplate;

/**
 *
 * @author dyanez
 */
public class RestConnector {
    private static final Logger LOG = LoggerFactory.getLogger(RestConnector.class);
    
    public static UploadBeneficioImagenResponse uploadImagenesBeneficios( final UploadBeneficioImagenRequest query ) {
        return clientRestGeneric(Properties.URL_SERVIDOR + URLServiciosBennderB2B.URL_UPLOAD_IMAGENES_BENEFICIOS, query, UploadBeneficioImagenResponse.class);
    }   
    public static DatosGeneralProveedorResponse guardaDatosGeneralesProveedor(final DatosGeneralProveedorRequest query){
        return clientRestGeneric(Properties.URL_SERVIDOR + URLServiciosBennderB2B.URL_GURDA_DATOS_GRALES_PROVEEDOR, query, DatosGeneralProveedorResponse.class);
    }
    public static CategoriasResponse obtenerCategoriaByProveedor( final ProveedorIdRequest query ) {
        return clientRestGeneric(Properties.URL_SERVIDOR + URLServiciosBennderB2B.URL_GET_CATEGORIAS_BY_PROVEEDOR, query, CategoriasResponse.class);
    }
    public static ProveedoresResponse obtenerProveedorHabilitados( final ProveedorIdRequest query ) {
        return clientRestGeneric(Properties.URL_SERVIDOR + URLServiciosBennderB2B.URL_GET_PROVEEDORES_HABILITADOS, query, ProveedoresResponse.class);
    } 
    //public static CategoriasResponse obtenerCategoriasById( final CategoriaByIdRequest query ) {
    public static SubCategoriaProveedorResponse obtenerSubCategoriasByIdCatProveedor( final SubCategoriaProveedorRequest query ) {
        return clientRestGeneric(Properties.URL_SERVIDOR + URLServiciosBennderB2B.URL_GET_SUB_CATEGORIAS_BY_ID_CAT_PROV, query, SubCategoriaProveedorResponse.class);
    }
    public static BeneficiosCargadorResponse getBeneficiosByIdCat( final CategoriaByIdRequest query ) {
        return clientRestGeneric(Properties.URL_SERVIDOR + URLServiciosBennderB2B.URL_GET_BENEFICIOS_BY_ID_CAT, query, BeneficiosCargadorResponse.class);
    }
    public static ValidacionResponse recuperacionPassword( final RecuperacionPasswordRequest query ) {
        //return clientRestGeneric(Properties.URL_SERVIDOR  + URLServiciosBennderB2B.URL_VALIDACION_USUARIO, query, LoginResponse.class);
        return clientRestGeneric(Properties.URL_SERVIDOR + URLServiciosBennderB2B.URL_MAIL_RECUPERACION_PASSWORD, query, ValidacionResponse.class);
    }
    public static LoginResponse validacionUsuario( final LoginRequest query ) {
        //return clientRestGeneric(Properties.URL_SERVIDOR  + URLServiciosBennderB2B.URL_VALIDACION_USUARIO, query, LoginResponse.class);
        return clientRestGeneric(Properties.URL_SERVIDOR + URLServiciosBennderB2B.URL_VALIDACION_USUARIO, query, LoginResponse.class);
    }    
    public static <Q, R> R clientRestGeneric( String url, Q query, Class<R> responseClass ) {
        LOG.info("INICIO");
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        HttpEntity<Q> req = new HttpEntity<>(query, headers);

        RestTemplate restTemplate = new RestTemplate();
        restTemplate.getMessageConverters().add(new MappingJackson2HttpMessageConverter());

        LOG.info("URL->{} ", url);
        
        ResponseEntity<R> callResult = restTemplate.exchange(url, HttpMethod.POST, req, responseClass);

        if ( callResult == null ) {
            LOG.error("Sin respuesta de servicio REST (ResponseEntity)");
            return null;
        }

        R response = callResult.getBody();
//        if ( response == null ) {
//            LOG.error("Sin respuesta de servicio REST (getBody)");
//            return null;
//        }

//        Validacion validacion = null;
//
//        // Search all the methods for a repuesta
//        for ( Method method : response.getClass().getDeclaredMethods() ) {
//            // If the method is public, without params and giving back a Repuesta
//            if ( Modifier.isPublic(method.getModifiers())
//                 && ( method.getParameterTypes().length == 0 )
//                 && method.getReturnType().equals(Validacion.class) ) {
//                // We should have it
//                try {
//                    validacion = (Validacion) method.invoke(response);
//                    break;
//                }
//                catch ( IllegalAccessException | InvocationTargetException ignored ) {
//                    // Simply skip this method
//                }
//            }
//        }

//        if ( validacion == null ) {
//            LOG.error("Sin respuesta servicio REST (validacion)");
//            return new Validacion("1", "Sin respuesta servicio REST (validacion)");
//        }
//        if ( "0".compareTo(validacion.getCodigo()) != 0) {
//            LOG.error("Respuesta NOK, mensaje->{}", validacion.getMensaje());
//            return null;
//        }
        LOG.info("FIN");
        return response;
    }
}
