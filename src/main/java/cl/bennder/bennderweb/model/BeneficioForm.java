/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.bennder.bennderweb.model;

import cl.bennder.entitybennderwebrest.model.ImagenGenerica;
import cl.bennder.entitybennderwebrest.utils.UtilsBennder;
import java.util.ArrayList;
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
    private Integer limiteStock;
    private Integer idCategoriaSelected;
    private Integer idSubCategoriaSelected;
    private Integer idTipoBeneficioSelected;
    private List<Integer> sucursalesSelected;
    private List<MultipartFile> images;
    private List<ImagenGenerica> imagenesGenericas;
    private List<String> condiciones;
    private List<String> adicionales;
    private Integer precioNormal;
    private Integer precioOferta;
    private Integer porcentajeDescuento;
    private Integer idRegionSelected;
    private Integer tipoCargaImagen;//tipo carga imagen, 1: Privada,2:Generica
    private String nameImagePrincipal;//nombre de imagen principal seleccionada
    private Integer totalImagenessPermitidos;//total de imagenes permitidas
    private Integer anchoMaxImg;
    private Integer altoMaxImg;
    private List<String> imagenesBeneficio;
    private List<String> nameImagenesValidas;
    
    public BeneficioForm() {
        this.idTipoBeneficioSelected = -1;
        this.tipoCargaImagen = 0;
        this.totalImagenessPermitidos = 4;
        this.anchoMaxImg = 720;
        this.altoMaxImg = 420;
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

    public List<ImagenGenerica> getImagenesGenericas() {
        return imagenesGenericas;
    }

    public void setImagenesGenericas(List<ImagenGenerica> imagenesGenericas) {
        this.imagenesGenericas = imagenesGenericas;
    }
    

    public String getFechaInicio() {
        if(fechaInicio == null){
            fechaInicio = UtilsBennder.getFechaActualFormato("yyyy-MM-dd");
        }        
        return fechaInicio;
    }

    public void setFechaInicio(String fechaInicio) {
        this.fechaInicio = fechaInicio;
    }

    public String getFechaExpiracion() {
        if(fechaExpiracion == null){
            fechaExpiracion = UtilsBennder.getFechaActualFormato("yyyy-MM-dd");
        }
        else{
           fechaExpiracion = UtilsBennder.getFechaActualFormato(fechaExpiracion); 
        }
        return fechaExpiracion;
    }

    public List<String> getImagenesBeneficio() {
        if(imagenesBeneficio == null){
            imagenesBeneficio = new ArrayList<>();
        }
        return imagenesBeneficio;
    }

    public void setImagenesBeneficio(List<String> imagenesBeneficio) {
        this.imagenesBeneficio = imagenesBeneficio;
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

    public Integer getLimiteStock() {
        return limiteStock;
    }

    public void setLimiteStock(Integer limiteStock) {
        this.limiteStock = limiteStock;
    }

    public Integer getIdTipoBeneficioSelected() {
        return idTipoBeneficioSelected;
    }

    public void setIdTipoBeneficioSelected(Integer idTipoBeneficioSelected) {
        this.idTipoBeneficioSelected = idTipoBeneficioSelected;
    }

    public List<String> getAdicionales() {
        return adicionales;
    }

    public void setAdicionales(List<String> adicionales) {
        this.adicionales = adicionales;
    }

    public Integer getPrecioNormal() {
        return precioNormal;
    }

    public void setPrecioNormal(Integer precioNormal) {
        this.precioNormal = precioNormal;
    }

    public Integer getPrecioOferta() {
        return precioOferta;
    }

    public void setPrecioOferta(Integer precioOferta) {
        this.precioOferta = precioOferta;
    }

    public Integer getPorcentajeDescuento() {
        return porcentajeDescuento;
    }

    public void setPorcentajeDescuento(Integer porcentajeDescuento) {
        this.porcentajeDescuento = porcentajeDescuento;
    }

    public Integer getIdRegionSelected() {
        return idRegionSelected;
    }

    public void setIdRegionSelected(Integer idRegionSelected) {
        this.idRegionSelected = idRegionSelected;
    }

    public Integer getTipoCargaImagen() {
        return tipoCargaImagen;
    }

    public void setTipoCargaImagen(Integer tipoCargaImagen) {
        this.tipoCargaImagen = tipoCargaImagen;
    }

    public String getNameImagePrincipal() {
        return nameImagePrincipal;
    }

    public void setNameImagePrincipal(String nameImagePrincipal) {
        this.nameImagePrincipal = nameImagePrincipal;
    }

    public Integer getTotalImagenessPermitidos() {
        return totalImagenessPermitidos;
    }

    public void setTotalImagenessPermitidos(Integer totalImagenessPermitidos) {
        this.totalImagenessPermitidos = totalImagenessPermitidos;
    }

    public Integer getAnchoMaxImg() {
        return anchoMaxImg;
    }

    public void setAnchoMaxImg(Integer anchoMaxImg) {
        this.anchoMaxImg = anchoMaxImg;
    }

    public Integer getAltoMaxImg() {
        return altoMaxImg;
    }

    public void setAltoMaxImg(Integer altoMaxImg) {
        this.altoMaxImg = altoMaxImg;
    }

    public List<String> getNameImagenesValidas() {
        return nameImagenesValidas;
    }

    public void setNameImagenesValidas(List<String> nameImagenesValidas) {
        this.nameImagenesValidas = nameImagenesValidas;
    }

    @Override
    public String toString() {
        return "BeneficioForm{" + "idBeneficio=" + idBeneficio + ", nombre=" + nombre + ", fechaInicio=" + fechaInicio + ", fechaExpiracion=" + fechaExpiracion + ", descripcion=" + descripcion + ", stock=" + stock + ", limiteStock=" + limiteStock + ", idCategoriaSelected=" + idCategoriaSelected + ", idSubCategoriaSelected=" + idSubCategoriaSelected + ", idTipoBeneficioSelected=" + idTipoBeneficioSelected + ", sucursalesSelected=" + sucursalesSelected + ", images=" + images + ", imagenesGenericas=" + imagenesGenericas + ", condiciones=" + condiciones + ", adicionales=" + adicionales + ", precioNormal=" + precioNormal + ", precioOferta=" + precioOferta + ", porcentajeDescuento=" + porcentajeDescuento + ", idRegionSelected=" + idRegionSelected + ", tipoCargaImagen=" + tipoCargaImagen + ", nameImagePrincipal=" + nameImagePrincipal + ", totalImagenessPermitidos=" + totalImagenessPermitidos + ", anchoMaxImg=" + anchoMaxImg + ", altoMaxImg=" + altoMaxImg + ", nameImagenesValidas=" + nameImagenesValidas + '}';
    }



    

    
    

    
    
    


        
    
}
