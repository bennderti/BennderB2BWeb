/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.bennder.bennderweb.session;

import cl.bennder.entitybennderwebrest.model.Comuna;
import cl.bennder.entitybennderwebrest.model.Region;
import java.util.List;

/**
 *
 * @author ext_dayanez
 */
public class SucursalSession {
    private List<Region> regiones;
    private List<Comuna> comunas;

    public SucursalSession() {
    }

    public List<Region> getRegiones() {
        return regiones;
    }

    public void setRegiones(List<Region> regiones) {
        this.regiones = regiones;
    }

    public List<Comuna> getComunas() {
        return comunas;
    }

    public void setComunas(List<Comuna> comunas) {
        this.comunas = comunas;
    }
    
}
