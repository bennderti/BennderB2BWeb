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
public class BeneficioForm {
    private Integer idBeneficio;
    private String nombre;
    private String fechaInicio;
    private String fechaExpiracion;
    private String descripcion;
    private Integer stock;
    private Integer idCategoriaSelected;
    private Integer idSubCategoriaSelected;
    private List<Integer> sucursalesSelected;
    private List<MultipartFile> images;
    private List<String> imagenesGenericas;
    private List<String> condiciones;
    public BeneficioForm() {
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public Integer getStock() {
        return stock;
    }

    public void setStock(Integer stock) {
        this.stock = stock;
    }
    
    public Integer getIdBeneficio() {
        return idBeneficio;
    }

    public void setIdBeneficio(Integer idBeneficio) {
        this.idBeneficio = idBeneficio;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public List<MultipartFile> getImages() {
        return images;
    }

    public void setImages(List<MultipartFile> images) {
        this.images = images;
    }

    public List<String> getImagenesGenericas() {
        return imagenesGenericas;
    }

    public void setImagenesGenericas(List<String> imagenesGenericas) {
        this.imagenesGenericas = imagenesGenericas;
    }

    public String getFechaInicio() {
        return fechaInicio;
    }

    public void setFechaInicio(String fechaInicio) {
        this.fechaInicio = fechaInicio;
    }

    public String getFechaExpiracion() {
        return fechaExpiracion;
    }

    public void setFechaExpiracion(String fechaExpiracion) {
        this.fechaExpiracion = fechaExpiracion;
    }

    public List<String> getCondiciones() {
        return condiciones;
    }

    public void setCondiciones(List<String> condiciones) {
        this.condiciones = condiciones;
    }

    public Integer getIdCategoriaSelected() {
        return idCategoriaSelected;
    }

    public void setIdCategoriaSelected(Integer idCategoriaSelected) {
        this.idCategoriaSelected = idCategoriaSelected;
    }

    public Integer getIdSubCategoriaSelected() {
        return idSubCategoriaSelected;
    }

    public void setIdSubCategoriaSelected(Integer idSubCategoriaSelected) {
        this.idSubCategoriaSelected = idSubCategoriaSelected;
    }

    public List<Integer> getSucursalesSelected() {
        return sucursalesSelected;
    }

    public void setSucursalesSelected(List<Integer> sucursalesSelected) {
        this.sucursalesSelected = sucursalesSelected;
    }

    @Override
    public String toString() {
        return "BeneficioForm{" + "idBeneficio=" + idBeneficio + ", nombre=" + nombre + ", fechaInicio=" + fechaInicio + ", fechaExpiracion=" + fechaExpiracion + ", descripcion=" + descripcion + ", stock=" + stock + ", idCategoriaSelected=" + idCategoriaSelected + ", idSubCategoriaSelected=" + idSubCategoriaSelected + ", sucursalesSelected=" + sucursalesSelected + ", imagenesGenericas=" + imagenesGenericas + ", condiciones=" + condiciones + '}';
    }

    
    
    
    
    
}
