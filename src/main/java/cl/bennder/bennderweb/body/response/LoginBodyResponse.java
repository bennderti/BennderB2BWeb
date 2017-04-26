/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.bennder.bennderweb.body.response;

import cl.bennder.entitybennderwebrest.model.Validacion;

/**
 *
 * @author dyanez
 */
public class LoginBodyResponse{
    private String goToUrl;
    private Validacion validacion;

    public LoginBodyResponse() {
    }

    public LoginBodyResponse(String goToUrl, Validacion validacion) {
        this.goToUrl = goToUrl;
        this.validacion = validacion;
    }

    public String getGoToUrl() {
        return goToUrl;
    }

    public void setGoToUrl(String goToUrl) {
        this.goToUrl = goToUrl;
    }

    public Validacion getValidacion() {
        return validacion;
    }

    public void setValidacion(Validacion validacion) {
        this.validacion = validacion;
    }
    
    
}
