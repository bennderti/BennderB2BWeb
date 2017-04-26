/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.bennder.bennderweb.session;

import cl.bennder.entitybennderwebrest.model.Validacion;

/**
 *
 * @author dyanez
 */
public class UsuarioSession {

    private Integer idUsuario;//rut sin dv
    private String usuario;//ejemplo correo
    private String codigoCuponEncriptado;
    private Validacion validacion;

    public UsuarioSession() {
    }

    public Integer getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(Integer idUsuario) {
        this.idUsuario = idUsuario;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getCodigoCuponEncriptado() {
        return codigoCuponEncriptado;
    }

    public void setCodigoCuponEncriptado(String codigoCuponEncriptado) {
        this.codigoCuponEncriptado = codigoCuponEncriptado;
    }

    public Validacion getValidacion() {
        if(validacion == null){
            this.validacion = new Validacion();
        }
        return validacion;
    }

    public void setValidacion(Validacion validacion) {
        this.validacion = validacion;
    }
    
    

}
