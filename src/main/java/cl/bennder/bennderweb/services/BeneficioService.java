/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.bennder.bennderweb.services;

import cl.bennder.bennderweb.model.BeneficioForm;
import cl.bennder.entitybennderwebrest.model.Categoria;
import cl.bennder.entitybennderwebrest.model.Comuna;
import cl.bennder.entitybennderwebrest.model.SucursalProveedor;
import cl.bennder.entitybennderwebrest.request.GetTodasCategoriaRequest;
import cl.bennder.entitybennderwebrest.request.InfoBeneficioRequest;
import cl.bennder.entitybennderwebrest.request.InfoInicioBeneficioRequest;
import cl.bennder.entitybennderwebrest.request.UploadImagenesGenericaRequest;
import cl.bennder.entitybennderwebrest.response.GetTodasCategoriaResponse;
import cl.bennder.entitybennderwebrest.response.InfoInicioBeneficioResponse;
import cl.bennder.entitybennderwebrest.response.UploadImagenesGenericaResponse;
import cl.bennder.entitybennderwebrest.response.ValidacionResponse;
import java.util.List;

/**
 *
 * @author dyanez
 */
public interface BeneficioService {
    
    public BeneficioForm convertirDatosFormularioBeneficio(InfoBeneficioRequest request);
    public List<String> getImagenesGenericasByCatSubSession(Integer idCat,Integer idSubCat);
     
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
    
    
       /***
     * Obtiene los datos de inicio necesarios para la creación/edición de beneficio
     * @param request datos de inicio como categorias, sucursales, info de imagenes genéricas
     * @return 
     */
    public InfoInicioBeneficioResponse getInfoInicioCreaActualizaBeneficio(InfoInicioBeneficioRequest request);
    
    public ValidacionResponse validaGuardarBeneficio(BeneficioForm beneficioForm);
    
    public List<Comuna> getComunaByIdReg(Integer idRegion);
    
    public List<SucursalProveedor> getSucursalByIdComuna(Integer idComuna);
    
}
