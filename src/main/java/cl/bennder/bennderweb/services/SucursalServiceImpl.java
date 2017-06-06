/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.bennder.bennderweb.services;

import cl.bennder.bennderweb.constantes.URLServiciosBennderB2B;
import cl.bennder.bennderweb.properties.Properties;
import cl.bennder.bennderweb.rest.connector.RestConnector;
import cl.bennder.bennderweb.session.SucursalSession;
import cl.bennder.bennderweb.session.UsuarioSession;
import cl.bennder.entitybennderwebrest.model.Comuna;
import cl.bennder.entitybennderwebrest.request.InfoInicioSucursalRequest;
import cl.bennder.entitybennderwebrest.request.InfoSucursalRequest;
import cl.bennder.entitybennderwebrest.response.InfoInicioSucursalResponse;
import cl.bennder.entitybennderwebrest.response.InfoSucursalResponse;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author ext_dayanez
 */
@Service
public class SucursalServiceImpl implements SucursalService{

    @Autowired
    private UsuarioSession usuarioSession;
    
    @Autowired
    private SucursalSession sucursalSession;
    
    
    @Override
    public InfoInicioSucursalResponse getInfoInicioSucursal(InfoInicioSucursalRequest request) {
        return RestConnector.clientRestGeneric(Properties.URL_SERVIDOR + URLServiciosBennderB2B.URL_SUCURSAL_INFO_INICIO, request, InfoInicioSucursalResponse.class, usuarioSession.getToken());
    }

    @Override
    public InfoSucursalResponse guardarSucursal(InfoSucursalRequest request) {
        return RestConnector.clientRestGeneric(Properties.URL_SERVIDOR + URLServiciosBennderB2B.URL_SUCURSAL_GUARDAR, request, InfoSucursalResponse.class, usuarioSession.getToken());
    }
    

    @Override
    public List<Comuna> getComunasByRegion(Integer idRegion) {
        List<Comuna> comunas = new ArrayList<>();
        if(sucursalSession.getComunas()!=null){
        
            for(Comuna c:sucursalSession.getComunas()){
                if(c.getRegion()!=null && c.getRegion().getIdRegion()!=null && c.getRegion().getIdRegion().compareTo(idRegion) == 0){
                    comunas.add(c);
                }
            }
        
        }        
        return comunas;
        
    }
    
    
    
}
