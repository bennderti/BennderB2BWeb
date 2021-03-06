/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.bennder.bennderweb.services;

import cl.bennder.bennderweb.constantes.URLServiciosBennderB2B;
import cl.bennder.bennderweb.properties.Properties;
import cl.bennder.bennderweb.rest.connector.RestConnector;
import cl.bennder.bennderweb.session.UsuarioSession;
import cl.bennder.entitybennderwebrest.request.CambioPasswordRequest;
import cl.bennder.entitybennderwebrest.request.LoginRequest;
import cl.bennder.entitybennderwebrest.request.RecuperacionPasswordRequest;
import cl.bennder.entitybennderwebrest.response.CambioPasswordResponse;
import cl.bennder.entitybennderwebrest.response.LoginResponse;
import cl.bennder.entitybennderwebrest.response.ValidacionResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author dyanez
 */
@Service
public class UsuarioServicesImpl implements UsuarioServices{

    @Autowired
    UsuarioSession usuarioSession;
    
    @Override
    public ValidacionResponse recuperacionPassword(RecuperacionPasswordRequest request) {
        return RestConnector.clientRestGeneric(Properties.URL_SERVIDOR + URLServiciosBennderB2B.URL_MAIL_RECUPERACION_PASSWORD, request, ValidacionResponse.class, usuarioSession.getToken());
    }    
    
    @Override
    public LoginResponse validacionUsuario(LoginRequest request) {
        return RestConnector.clientRestGeneric(Properties.URL_SERVIDOR + URLServiciosBennderB2B.URL_VALIDACION_USUARIO, request, LoginResponse.class, usuarioSession.getToken());
    }

    @Override
    public CambioPasswordResponse cambioPassword(CambioPasswordRequest request) {
       return RestConnector.clientRestGeneric(Properties.URL_SERVIDOR + URLServiciosBennderB2B.URL_CAMBIO_PASSWORD, request, CambioPasswordResponse.class, usuarioSession.getToken());
    }
     
    
}
