<%@page import="java.util.Calendar"%>
<%--<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include.jsp" %>

<!DOCTYPE html>
<html>
    <head>
        <!--head-->
        <jsp:include page="/WEB-INF/jsp/template-e-comerce/head.jsp"/>
        <!-- all css here -->
        <jsp:include page="/WEB-INF/jsp/template-e-comerce/cssTemplate.jsp"/>
        
        <style>            
            .btn-file {
                position: relative;
                overflow: hidden;
            }
            .btn-file input[type=file] {
                position: absolute;
                top: 0;
                right: 0;
                min-width: 100%;
                min-height: 100%;
                font-size: 100px;
                text-align: right;
                filter: alpha(opacity=0);
                opacity: 0;
                outline: none;
                background: white;
                cursor: inherit;
                display: block;
            }
            img.img-50{
                width: 50%;
                height: 50%;
            }
            .img-generica.selected{
                border: 2px #337ab7 solid;
            }
        </style>
    </head>
    <body>
        <!--[if lt IE 8]>
                <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
            <![endif]-->
        <!-- Add your site or application content here -->
        <!-- header-top-area start -->
        <jsp:include page="/WEB-INF/jsp/template-e-comerce/headerTopArea.jsp">
           <jsp:param name="muestraSesion" value="si"/>
           <jsp:param name="logout" value="../logout.html"/>
        </jsp:include>
        <!-- header-top-area end -->
        <div class="sticky-wrapper">
            <header>			

                <!-- header-bottom-area end -->         
                <!-- main-menu-area end -->
                <!-- mobile-menu-area start -->
                <jsp:include page="/WEB-INF/jsp/template-e-comerce/mainMenuAreaVisible.jsp"/>
                <!-- mobile-menu-area end -->			
            </header>
        </div>
        <!-- HOME SLIDER -->
        <!-- heading-banner start -->
        <div class="heading-banner">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <ul class="breadcrumb">
                            <li><a href="../home.html">Mantenedore beneficios</a></li>
                            <!--<li class="active">Login</li>-->
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!-- heading-banner end -->
        <!-- my-account-area start -->
<!--        <div class="my-account-area">-->
            <div class="container">
                <h2>Información de beneficio</h2>
                <!--https://v4-alpha.getbootstrap.com/components/forms/-->
                <form:form  method="POST" 
                            action="../beneficio/guardar.html" 
                            id="form-beneficio" 
                            modelAttribute="beneficioForm" 
                            enctype="multipart/form-data"
                            accept-charset="iso-8859-1">
                      <div class="form-group">
                        <form:hidden path="idBeneficio"/>  
                        <label for="ti-nombre-promocion" class="col-2 col-form-label">Nombre Promoción</label>
                        <div class="col-10">
                          <form:input path="nombre" autocomplete="off" id="ti-nombre-promocion" maxlength="150" cssClass="form-control"/>
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="f-inicio" class="col-2 col-form-label">Fecha Expiración</label>
                        <div class="col-10">
                            <input class="form-control" type="date" value="2011-08-19" id="f-inicio" name="fechaInicio">
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="f-expiracion" class="col-2 col-form-label">Fecha Expiración</label>
                        <div class="col-10">
                            <input class="form-control" type="date" value="2011-08-19" id="f-expiracion" name="fechaExpiracion">
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="ul-lista-condiciones" class="col-2 col-form-label">Condiciones</label>
                        <div class="col-10">
                            <button type="button" class="btn btn-primary">+ Agregar</button>
                            <ul class="list-group" id="ul-lista-condiciones">
                                <li class="list-group-item disabled">Cras justo odio</li>
                                <li class="list-group-item">Dapibus ac facilisis in</li>
                                <li class="list-group-item">Morbi leo risus</li>
                                <li class="list-group-item">Porta ac consectetur ac</li>
                                <li class="list-group-item">Vestibulum at eros</li>                                
                            </ul>
                            <input type="hidden" name="condiciones[0]" value="condicion 1"/>
                            <input type="hidden" name="condiciones[1]" value="condicion 2"/>
                            <input type="hidden" name="condiciones[2]" value="condicion 3"/>
                            <input type="hidden" name="condiciones[3]" value="condicion 4"/>
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="ti-stock" class="col-2 col-form-label">Stock</label>
                        <div class="col-10">
                          <form:input path="stock" autocomplete="off" id="ti-stock" maxlength="50" cssClass="form-control"/>
                        </div>
                      </div>
                    <div class="form-group">
                        <label for="ti-limite-stock" class="col-2 col-form-label">Limite Stock</label>
                        <div class="col-10">
                          <form:input path="limiteStock" autocomplete="off" id="ti-limite-stock" maxlength="50" cssClass="form-control"/>
                        </div>
                      </div>
                     <div class="form-group">
                        <label for="ti-categoria" class="col-2 col-form-label">Categoría</label>
                        <div class="col-10">
                            <form:select path="idCategoriaSelected" 
                                         id = "select-categorias" 
                                         cssClass="form-control" onchange="Beneficio.onChangeCategoria();">
                                <form:option value="-1" label="--Seleccione Categoria--"/>
                                <form:options items="${categorias}" itemValue="idCategoria" itemLabel="nombre"/>                           
                            </form:select>
                        </div>
                      </div>
                    <div class="form-group">
                        <label for="ti-sub-categoria" class="col-2 col-form-label">Sub-Categoría</label>
                        <div class="col-10">
                            <select id = "select-sub-categorias" class="form-control">
                                <option value="-1">--Seleccione Sub Categoria--</option>                                
                            </select>
                            <input type="hidden" name="idSubCategoriaSelected" id="input-idSubCategoriaSelected"/>
                        </div>
                      </div>
                      
                      <div class="form-group">
                        <label for="ti-stock" class="col-2 col-form-label">Sucursales/Tiendas de Canje</label>
                      </div>
                      <c:if test="${not empty sucursalesProveedor}">
                        <c:forEach items="${sucursalesProveedor}" var="sp">
                            <div class="form-check form-check-inline">
                              <label class="form-check-label">
                                      <form:checkbox cssClass="form-check-input" path="sucursalesSelected" value="${sp.idSucursal}"/><c:out value="${sp.nombreSucursal}"/>
                              </label>
                            </div>
                        </c:forEach>
                    </c:if>
                        
                        
                        
                      <div class="form-group">
                        <label class="btn btn-default btn-file">
                            Adjuntar <input type="file" hidden id="f-adjuntar" multiple="multiple" name = "images">
                        </label>
                          <span class ="n-file-adjuntar">0 Imagenes</span>  
                      </div>
                    <div class="form-group">
                        <label class="btn btn-default btn-file">
                            <button type="button" class="btn btn-primary adj-generica" onclick="Beneficio.onLoadImagenGenerica();">Adjuntar Genérico</button>
                        </label>
                        <span class ="n-file-adjuntar-generico">0 Imagenes</span>
                        <div class="contents-imagen-generica">
                        </div>
                        
                      </div>
                      
                      <div class="form-group">
                        <label for="ta-descripcion">Descripción</label>
                         <form:textarea path="descripcion" id="ti-descripcion" cssClass="form-control"/>  
                      </div>
                      <div class="form-group">
                        <label for="ti-stock" class="col-2 col-form-label">Tipo de Promoción</label>
                      </div>                                            
                      <div class="form-check">
                        <label class="form-check-label">
<!--                          <input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios1" value="option1" checked>-->
                          <form:radiobutton path="idTipoBeneficioSelected" value="1" cssClass="form-check-input"/> Descuento
                          
                        </label>
                        <div class="col-10">
<!--                          <input class="form-control" type="text" value="50%" id="ti-dscto">-->
                          <form:input path="porcentajeDescuento" autocomplete="off" id="ti-descuento" maxlength="50" cssClass="form-control"/>
                        </div>
                      </div>
                      <div class="form-check">
                        <label class="form-check-label">
<!--                          <input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios2" value="option2">-->
                          <form:radiobutton path="idTipoBeneficioSelected" value="2" cssClass="form-check-input"/> Precio Oferta
                          
                        </label>                          
                        <label for="ti-antes" class="col-2 col-form-label">Antes</label>
                        <div class="col-10">
<!--                          <input class="form-control" type="text" value="1" id="ti-antes">-->
                          <form:input path="precioNormal" autocomplete="off" id="ti-normal" maxlength="50" cssClass="form-control"/>
                        </div>
                        <label for="ti-hoy" class="col-2 col-form-label">Hoy</label>
                        <div class="col-10">
<!--                          <input class="form-control" type="text" value="1" id="ti-hoy">-->
                          <form:input path="precioOferta" autocomplete="off" id="ti-oferta" maxlength="50" cssClass="form-control"/>
                        </div>
                      </div>
                    <div class="form-check">
                        <label class="form-check-label">
<!--                          <input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios2" value="option2">-->
                          <form:radiobutton path="idTipoBeneficioSelected" value="3" cssClass="form-check-input"/> Producto/Servicio Adicional
                         </label>
                        <div class="form-group">
                            <div class="col-10">
                                <button type="button" class="btn btn-primary">+ Agregar</button>
                                <ul class="list-group" id="ul-lista-condiciones">
                                    <li class="list-group-item disabled">Adicional 1</li>
                                    <li class="list-group-item">Adicional 2</li>
                                    <li class="list-group-item">Adicional 3</li>
                                    <li class="list-group-item">Adicional 4</li>
                                    <li class="list-group-item">Adicional 5</li>
                                </ul>
                                <input type="hidden" name="adicionales[0]" value="Adicional 1"/>
                                <input type="hidden" name="adicionales[1]" value="Adicional 2"/>
                                <input type="hidden" name="adicionales[2]" value="Adicional 3"/>
                                <input type="hidden" name="adicionales[3]" value="Adicional 4"/>
                                <input type="hidden" name="adicionales[4]" value="Adicional 5"/>
                            </div>
                        </div>
                      </div>
                    
                      
                      <div class="form-group"> 
                        <div class="col-sm-offset-2 col-sm-10">
                          <div class="checkbox">
                            <label><input type="checkbox"> Remember me</label>
                          </div>
                        </div>
                      </div>
                </form:form> 
                <div class="form-group"> 
                    <div class="col-sm-offset-2 col-sm-10">
                        <button type="submit" class="btn btn-default btn-guardar-beneficio" onclick="Beneficio.onValidaGuardaBeneficio();">Guardar</button>
                    </div>
                </div>
            </div>
<!--        </div>-->


        <!-- my-account-area end -->
        <!-- footer start -->
        <!-- footer end -->
        <!-- Color Variations -->
        <jsp:include page="/WEB-INF/jsp/template-e-comerce/colorSchemeSelect.jsp"/>

        <!-- all js here -->
        <!-- jquery latest version -->
        <jsp:include page="/WEB-INF/jsp/template-e-comerce/jsTemplate.jsp"/>
        <!--Js Login (dejar versión *.min.js ofuscada-->

        <!--Modal -->
        <jsp:include page="/WEB-INF/jsp/utils/modal.jsp">     
            <jsp:param name="btnAceptar" value="Aceptar"/>
            <jsp:param name="btnCancelar" value="Cancelar"/>
        </jsp:include>
        <!--Modal-->    
        <!-- Loading -->
        <jsp:include page="/WEB-INF/jsp/utils/loading.jsp"/>
        <!-- Loading -->
        <script type="text/javascript" src="<c:url value="/resources/js/beneficio/beneficio.js"/>?v=<%=Calendar.getInstance().getTimeInMillis()%>"></script>

        <!-- Creates the bootstrap modal where the image will appear -->
        <div class="modal fade" id="imagemodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                        <h4 class="modal-title" id="myModalLabel">Preview Imagen</h4>
                    </div>
                    <div class="modal-body">
                        <img src="" id="imagepreview">
                        <!--img src="" id="imagepreview" style="width: 400px; height: 264px;" >-->
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                    </div>
                </div>
            </div>
        </div>
        
        
        
        <!-- Creates the bootstrap modal where the image will appear -->
        <div class="modal fade" id="gallery-imagen-generica" tabindex="-1" role="dialog" aria-labelledby="gallery-imagen-generica" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                        <h4 class="modal-title"> Listado Imagenes Genéricas</h4>
                    </div>
                    <div class="modal-body">
                        <table id = "t-img-generica">
                        </table>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
