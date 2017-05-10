/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.bennder.bennderweb.session;

import cl.bennder.entitybennderwebrest.model.Categoria;
import cl.bennder.entitybennderwebrest.model.ImagenGenerica;
import java.util.List;

/**
 *
 * @author dyanez
 */
public class BeneficioSession {
    private List<ImagenGenerica> iamgenesGenericas;
    private List<Categoria> categorias;
    
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
    
}
