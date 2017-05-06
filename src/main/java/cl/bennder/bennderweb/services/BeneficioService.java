/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.bennder.bennderweb.services;

import cl.bennder.entitybennderwebrest.model.Categoria;
import cl.bennder.entitybennderwebrest.model.SucursalProveedor;
import cl.bennder.entitybennderwebrest.request.GetTodasCategoriaRequest;
import cl.bennder.entitybennderwebrest.request.UploadImagenesGenericaRequest;
import cl.bennder.entitybennderwebrest.response.GetTodasCategoriaResponse;
import cl.bennder.entitybennderwebrest.response.UploadImagenesGenericaResponse;
import java.util.List;

/**
 *
 * @author dyanez
 */
public interface BeneficioService {
    
    //.- obtención de datos iniciales para creación/edicion beneficio
    
    //.- obtencion de categorias session
//    public List<Categoria> getCategorias(); 
    
    //.- obtencion de sub categorias por session
    public List<Categoria> getSubCategoriasByIdCat(Integer idCat);
    
    public List<SucursalProveedor> sucursalesProveedor();
    
    /***
     * Obtiene todas las categorias/subcategorias con datos simples.
     * @param request
     * @return Lista categoroias
     */
    public GetTodasCategoriaResponse getTodasCategorias(GetTodasCategoriaRequest request);
    
    
    /***
     * Método que consume servicio de guardar y subir las iamgenes generecias de categoria/subcategoria seleccionada
     * @param request
     * @return 
     */
    public UploadImagenesGenericaResponse uploadImagenesGenerica(UploadImagenesGenericaRequest request);
    
}
