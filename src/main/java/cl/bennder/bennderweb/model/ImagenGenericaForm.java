/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.bennder.bennderweb.model;

import java.util.List;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author dyanez
 */
public class ImagenGenericaForm {
    private Integer idCategoria;
    private Integer idSubCategoria;
    private List<MultipartFile> images;

    public ImagenGenericaForm() {
    }

    public ImagenGenericaForm(Integer idCategoria, Integer idSubCategoria, List<MultipartFile> images) {
        this.idCategoria = idCategoria;
        this.idSubCategoria = idSubCategoria;
        this.images = images;
    }

    public Integer getIdCategoria() {
        return idCategoria;
    }

    public void setIdCategoria(Integer idCategoria) {
        this.idCategoria = idCategoria;
    }

    public Integer getIdSubCategoria() {
        return idSubCategoria;
    }

    public void setIdSubCategoria(Integer idSubCategoria) {
        this.idSubCategoria = idSubCategoria;
    }

    public List<MultipartFile> getImages() {
        return images;
    }

    public void setImages(List<MultipartFile> images) {
        this.images = images;
    }

    @Override
    public String toString() {
        return "ImagenGenericaForm{" + "idCategoria=" + idCategoria + ", idSubCategoria=" + idSubCategoria + '}';
    }
    
}
