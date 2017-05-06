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
                            <li><a href="../home.html">Imágenes Genéricas</a></li>
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
                <h2>Cargador de imanges gnéricas de categorías/sub-categorias.</h2>
                <!--https://v4-alpha.getbootstrap.com/components/forms/-->
                <form:form  method="POST" 
                            action="../beneficio/imagenesGenericas.html" 
                            id="form-img-generica" 
                            modelAttribute="imagenGenericaForm" 
                            enctype="multipart/form-data">
                     <div class="form-group">
                        <label for="ti-categoria" class="col-2 col-form-label">Categoría</label>
                        <div class="col-10">
                            <form:select path="idCategoria" 
                                         id = "select-categorias" 
                                         cssClass="form-control" onchange="Beneficio.onChangeSubCategoriaImgGenerica();">
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
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="btn btn-default btn-file">
                            Adjuntar <input type="file" hidden id="f-adjuntar" multiple="multiple" name = "images">
                        </label>
                      </div>
                      
                     <input type="hidden" name="idSubCategoria" id="ipth-id-subcat"/>
                </form:form>
                <div class="form-group"> 
                   <div class="col-sm-offset-2 col-sm-10">
                       <input type="submit" value="Cargar Imagenes" id="valida-proveedor" onclick="Beneficio.onValidaUploadImagen();"/>
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
    </body>
</html>
