/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.bennder.bennderweb.session;

import cl.bennder.entitybennderwebrest.model.Categoria;
import cl.bennder.entitybennderwebrest.model.Comuna;
import cl.bennder.entitybennderwebrest.model.ImagenGenerica;
import cl.bennder.entitybennderwebrest.model.Region;
import cl.bennder.entitybennderwebrest.model.SucursalProveedor;
import java.util.List;

/**
 *
 * @author dyanez
 */
public class BeneficioSession {
    private List<ImagenGenerica> iamgenesGenericas;
    private List<Categoria> categorias;
    private List<SucursalProveedor> sucursales;
    private List<Region> regionesSucursal;
    private List<Comuna> comunasSucursales;
    
    public BeneficioSession() {
    }

    public List<Categoria> getCategorias() {
        return categorias;
    }

    public void setCategorias(List<Categoria> categorias) {
        this.categorias = categorias;
    }

    public List<ImagenGenerica> getIamgenesGenericas() {
        return iamgenesGenericas;
    }

    public void setIamgenesGenericas(List<ImagenGenerica> iamgenesGenericas) {
        this.iamgenesGenericas = iamgenesGenericas;
    }

    public List<SucursalProveedor> getSucursales() {
        return sucursales;
    }

    public void setSucursales(List<SucursalProveedor> sucursales) {
        this.sucursales = sucursales;
    }

    public List<Region> getRegionesSucursal() {
        return regionesSucursal;
    }

    public void setRegionesSucursal(List<Region> regionesSucursal) {
        this.regionesSucursal = regionesSucursal;
    }

    public List<Comuna> getComunasSucursales() {
        return comunasSucursales;
    }

    public void setComunasSucursales(List<Comuna> comunasSucursales) {
        this.comunasSucursales = comunasSucursales;
    }
    
}
