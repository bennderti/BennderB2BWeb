/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.bennder.bennderweb.services;

import cl.bennder.bennderweb.rest.connector.RestConnector;
import cl.bennder.bennderweb.session.BeneficioSession;
import cl.bennder.bennderweb.session.UsuarioSession;
import cl.bennder.entitybennderwebrest.model.Categoria;
import cl.bennder.entitybennderwebrest.model.SucursalProveedor;
import cl.bennder.entitybennderwebrest.request.GetTodasCategoriaRequest;
import cl.bennder.entitybennderwebrest.request.UploadImagenesGenericaRequest;
import cl.bennder.entitybennderwebrest.response.GetTodasCategoriaResponse;
import cl.bennder.entitybennderwebrest.response.UploadImagenesGenericaResponse;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author dyanez
 */
@Service
public class BeneficioServiceImpl implements BeneficioService{

    @Autowired
    private UsuarioSession usuarioSession;
    
    @Autowired
    BeneficioSession beneficioSession;

    @Override
    public UploadImagenesGenericaResponse uploadImagenesGenerica(UploadImagenesGenericaRequest request) {
        return RestConnector.uploadImagenesGenerica(request);
    }
    
    

    @Override
    public GetTodasCategoriaResponse getTodasCategorias(GetTodasCategoriaRequest request) {
        GetTodasCategoriaResponse r = RestConnector.getTodasCategorias(request);
        beneficioSession.setCategorias(r.getCategorias());
        return r;
    }
    
    

    @Override
    public List<SucursalProveedor> sucursalesProveedor() {
        List<SucursalProveedor> sucursalProveedores = new ArrayList<>();
        sucursalProveedores.add(new SucursalProveedor(1, 1, "Sucursal 1"));
        sucursalProveedores.add(new SucursalProveedor(2, 1, "Sucursal 2"));
        sucursalProveedores.add(new SucursalProveedor(3, 1, "Sucursal 3"));
        sucursalProveedores.add(new SucursalProveedor(4, 1, "Sucursal 4"));
        return sucursalProveedores;
    }
    
    
    
//    @Override
//    public List<Categoria> getCategorias() {
//       
//        List<Categoria> SubCategorias = new ArrayList<>();
//        SubCategorias.add(new Categoria(11, "Sub Categoria 11", 1, null));
//        SubCategorias.add(new Categoria(12, "Sub Categoria 12", 1, null));
//        SubCategorias.add(new Categoria(13, "Sub Categoria 13", 1, null));
//        
//        List<Categoria> SubCategorias2 = new ArrayList<>();
//        SubCategorias2.add(new Categoria(21, "Sub Categoria 21", 2, null));
//        SubCategorias2.add(new Categoria(22, "Sub Categoria 22", 2, null));
//        SubCategorias2.add(new Categoria(23, "Sub Categoria 23", 2, null));
//        
//        List<Categoria> SubCategorias3 = new ArrayList<>();
//        SubCategorias3.add(new Categoria(31, "Sub Categoria 31", 3, null));
//        SubCategorias3.add(new Categoria(32, "Sub Categoria 32", 3, null));
//        SubCategorias3.add(new Categoria(33, "Sub Categoria 33", 3, null));
//        
//        List<Categoria> categorias = new ArrayList<>();
//        categorias.add(new Categoria(1, "categoria 1", -1, SubCategorias));
//        categorias.add(new Categoria(2, "categoria 2", -1, SubCategorias2));
//        categorias.add(new Categoria(3, "categoria 3", -1, SubCategorias3));
//        
//        beneficioSession.setCategorias(categorias);
//        return categorias;
//    }

    @Override
    public List<Categoria> getSubCategoriasByIdCat(Integer idCat) {
        List<Categoria> subCategorias = new ArrayList<>();
        if(beneficioSession.getCategorias() == null){
            GetTodasCategoriaRequest r = new GetTodasCategoriaRequest();
            //r.setIdUsuario(usuarioSession.getIdUsuario());
            beneficioSession.setCategorias(getTodasCategorias(r).getCategorias());
        }
        if(beneficioSession!=null && beneficioSession.getCategorias()!=null){
            for(Categoria c : beneficioSession.getCategorias()){
                if(c.getIdCategoria().compareTo(idCat) == 0){
                   subCategorias = c.getSubCategorias();
                }
            }
        }
        
        return subCategorias;
    }
    
}
