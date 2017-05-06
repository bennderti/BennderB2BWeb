<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/jsp/include.jsp" %>

<!DOCTYPE html>
<html class="no-js" lang="en">
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
                            enctype="multipart/form-data">
                      <div class="form-group">
                        <label for="ti-nombre-promocion" class="col-2 col-form-label">Nombre Promoción</label>
                        <div class="col-10">
                          <form:input path="nombre" autocomplete="off" id="ti-nombre-promocion" maxlength="50" cssClass="form-control"/>
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
                        <label for="ti-categoria" class="col-2 col-form-label">Sub-Categoría</label>
                        <div class="col-10">
                            <form:select path="idSubCategoriaSelected" 
                                         id = "select-sub-categorias" 
                                         cssClass="form-control">
                                <form:option value="-1" label="--Seleccione Sub Categoria--"/>
                                <form:options items="${subCategorias}" itemValue="idCategoria" itemLabel="nombre"/>                           
                            </form:select>
                        </div>
                      </div>
                      
                      <div class="form-group">
                        <label for="ti-stock" class="col-2 col-form-label">Sucursales/Tiendas de Canje</label>
                      </div>
                      <c:if test="${not empty sucursalesProveedor}">
                        <c:forEach items="${sucursalesProveedor}" var="sp">
                            <div class="form-check form-check-inline">
                              <label class="form-check-label">
<!--                                  <input class="form-check-input" type="checkbox" id="inlineCheckbox3" value="option3" disabled> Sucursal 3-->
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
                            <button type="button" class="btn btn-primary">Adjuntar Genérico</button>
                        </label>
                        <span class ="n-file-adjuntar-generico">0 Imagenes</span>
                        <input name="imagenesGenericas[0]" type="hidden" value="/etc/1.png"/>
                        <input name="imagenesGenericas[1]" type="hidden" value="/etc/2.png"/>
                        <input name="imagenesGenericas[2]" type="hidden" value="/etc/3.png"/>
                        <input name="imagenesGenericas[3]" type="hidden" value="/etc/4.png"/>
                        <input name="imagenesGenericas[4]" type="hidden" value="/etc/5.png"/>
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
                          <input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios1" value="option1" checked>
                          Descuento
                        </label>
                        <div class="col-10">
                          <input class="form-control" type="text" value="50%" id="ti-dscto">
                        </div>
                      </div>
                      <div class="form-check">
                        <label class="form-check-label">
                          <input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios2" value="option2">
                          Precio Oferta
                        </label>                          
                        <label for="ti-antes" class="col-2 col-form-label">Antes</label>
                        <div class="col-10">
                          <input class="form-control" type="text" value="1" id="ti-antes">
                        </div>
                        <label for="ti-hoy" class="col-2 col-form-label">Hoy</label>
                        <div class="col-10">
                          <input class="form-control" type="text" value="1" id="ti-hoy">
                        </div>
                      </div>
                    <div class="form-check">
                        <label class="form-check-label">
                          <input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios2" value="option2">
                          Producto/Servicio Adicional
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
                      <div class="form-group"> 
                        <div class="col-sm-offset-2 col-sm-10">
                          <button type="submit" class="btn btn-default btn-guardar">Guardar</button>
                        </div>
                      </div>
                </form:form> 
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
    </body>
</html>
