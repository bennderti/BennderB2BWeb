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
                            action="../proveedor/informacionGeneral.html" 
                            id="form-proveedor" 
                            modelAttribute="beneficioForm" 
                            enctype="multipart/form-data">
                      <div class="form-group">
                        <label for="ti-nombre-promocion" class="col-2 col-form-label">Nombre Promoción</label>
                        <div class="col-10">
                          <input class="form-control" type="text" value="" id="ti-nombre-promocion">
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="example-datetime-local-input" class="col-2 col-form-label">Fecha Inicio</label>
                        <div class="col-10">
                          <input class="form-control" type="datetime-local" value="2011-08-19T13:45:00" id="example-datetime-local-input">
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="example-date-input" class="col-2 col-form-label">Fecha Expiración</label>
                        <div class="col-10">
                          <input class="form-control" type="date" value="2011-08-19" id="example-date-input">
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
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="ti-stock" class="col-2 col-form-label">Stock</label>
                        <div class="col-10">
                          <input class="form-control" type="text" value="1" id="ti-stock">
                        </div>
                      </div>
                     <div class="form-group">
                        <label for="ti-stock" class="col-2 col-form-label">Categoría</label>
                        <div class="col-10">
                            <select class="form-control">
                                <option>2</option>
                                <option>3</option>
                                <option>4</option>
                                <option>5</option>                                
                            </select>
                        </div>
                      </div>
                    <div class="form-group">
                        <label for="ti-stock" class="col-2 col-form-label">Sub-Categoría</label>
                        <div class="col-10">
                            <select class="form-control">
                                <option>2</option>
                                <option>3</option>
                                <option>4</option>
                                <option>5</option>                                
                            </select>
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
                          <button type="submit" class="btn btn-default">Submit</button>
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
