/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.bennder.bennderweb.services;

import cl.bennder.bennderweb.rest.connector.RestConnector;
import cl.bennder.entitybennderwebrest.request.LoginRequest;
import cl.bennder.entitybennderwebrest.request.RecuperacionPasswordRequest;
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
    
    @Override
    public ValidacionResponse recuperacionPassword(RecuperacionPasswordRequest request) {
        return RestConnector.recuperacionPassword(request);
    }    
    
    @Override
    public LoginResponse validacionUsuario(LoginRequest request) {
        return RestConnector.validacionUsuario(request);
    }
    
}
