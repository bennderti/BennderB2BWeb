/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.bennder.bennderweb.services;

import cl.bennder.entitybennderwebrest.model.Proveedor;
import cl.bennder.entitybennderwebrest.request.CategoriaByIdRequest;
import cl.bennder.entitybennderwebrest.request.DatosGeneralProveedorRequest;
import cl.bennder.entitybennderwebrest.request.ProveedorIdRequest;
import cl.bennder.entitybennderwebrest.request.SubCategoriaProveedorRequest;
import cl.bennder.entitybennderwebrest.response.BeneficiosCargadorResponse;
import cl.bennder.entitybennderwebrest.response.CategoriasResponse;
import cl.bennder.entitybennderwebrest.response.DatosGeneralProveedorResponse;
import cl.bennder.entitybennderwebrest.response.ProveedoresResponse;
import cl.bennder.entitybennderwebrest.response.SubCategoriaProveedorResponse;
import cl.bennder.entitybennderwebrest.response.UploadBeneficioImagenResponse;
import java.util.List;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author dyanez
 */
public interface ProveedorServices {
    
    /***
     * Obtiene la lista de categorias de un proveedor
     * @author dyanez
     * @param request Identificar de proveedor
     * @return Lista de categorias para proveedor
     */
    public CategoriasResponse obtenerCategoriaByProveedor(ProveedorIdRequest request);
    
    /***
     * Proveedores habilitados
     * @param request
     * @return 
     */
    public ProveedoresResponse obtenerProveedorHabilitados(ProveedorIdRequest request);
    
    /***
     * Permite obtener los operadores desde session o capa de servicio
     * @return Lista de proveedores habilitados
     */
    public List<Proveedor> getProveedoreSessionServices();
    
    public Proveedor getProveedorByIdLista(List<Proveedor> lista,Integer idProveedor);
    
    /***
     * Metodo que consume servicio que permite guardar/actualizar los datos generales de proveedor
     * @param request Datos generales de proveedor
     * @return Validación de guardado de proveedor
     */
    public DatosGeneralProveedorResponse guardaDatosGeneralesProveedor(DatosGeneralProveedorRequest request);
    
    public SubCategoriaProveedorResponse getSubCategoriasProveedor(SubCategoriaProveedorRequest request);
    public BeneficiosCargadorResponse getBeneficiosByIdCat(CategoriaByIdRequest request);
    
    /***
     * Método que permite cargar una lista de imagenes a un beneficio en particular, en donde orden 1 indica que es imagen
     * @param imagenes listados de imagenes
     * @param idBeneficio
     * @param indexPrincipal
     * @param idProveedor identificador de proveedor
     * @return 
     */
    public UploadBeneficioImagenResponse uploadImagenesBeneficios(List<MultipartFile> imagenes, Integer idBeneficio,Integer indexPrincipal, Integer idProveedor);
    
    
}
