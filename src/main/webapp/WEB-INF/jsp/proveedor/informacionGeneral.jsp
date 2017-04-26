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
    <jsp:include page="/WEB-INF/jsp/template-e-comerce/headerTopArea.jsp"/>
    <!-- header-top-area end -->
    <div class="sticky-wrapper">
        <header>			
                        <div class="header-bottom-area">
                            <div class="container">
                                <div class="row logo-bennder">
                                    <div class="">
                                        <div class="logo">
                                            <a href="<c:url value='proveedor/admin.html'/>"><img src="<c:url value="/resources/img/bennder/logo.png"/>"></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
			<!-- header-bottom-area end -->         
			<!-- main-menu-area end -->
			<!-- mobile-menu-area start -->
			<%--<jsp:include page="/WEB-INF/jsp/template-e-comerce/mainMenuAreaVisible.jsp"/>--%>
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
                        <li><a href="#">Información General <strong>Proveedores</strong></a></li>
                        <!--<li class="active">Login</li>-->
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- heading-banner end -->
    <link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/login/login.css"/>?v=<%=Calendar.getInstance().getTimeInMillis()%>">
    <!-- my-account-area start -->
    <div class="my-account-area">
        <div class="container">
            <div class="row center-login">
                <!--<div class="col-md-6 col-sm-6">-->
                <div class="">
                    <jsp:include page="/WEB-INF/jsp/utils/alerta.jsp">
                        <jsp:param name="validacion" value="${validacion}"/>
                    </jsp:include>
                    <form:form method="POST" action="../proveedor/informacionGeneral.html" id="form-proveedor" modelAttribute="proveedorForm" enctype="multipart/form-data">
                            <div class="form-fields">
                                <p>
                                    <label>Proveedores <span class="required">*</span></label>
                                    <form:select path="idProveedorSelect" id = "lista-proveedor" cssClass="form-control" onchange="ProveedorBennder.onChangeProveedor();">
                                        <form:option value="-1" label="--Seleccione Proveedor--"/>
                                        <form:options items="${proveedores}" itemValue="idProveedor" itemLabel="nombre"/>                           
                                    </form:select>
                                </p>
                                <p>
                                    <label>Nombre <span class="required">*</span></label>
                                    <form:input path="nombre" autocomplete="off" id="nombre-proveedor" maxlength="50" cssClass="form-control"/>
                                </p>  
                                <p>
                                    <label>Rut (sin digito verificador) <span class="required">*</span></label>
                                    <form:input path="rut" autocomplete="off" id="rut-proveedor" maxlength="50" cssClass="form-control"/>
                                </p>  
                                <p>
                                    <label>Selecciona logo empresa</label>
                                    <input type="file" name="logoImagen" id="logo-imagen"/>
                            </div>
                                <input type="submit" value="Guardar" id="submmit-proveedor" style="display: none;"/>
                                <form:hidden path="pathLogo" id="hidden-path-logo"/>
                        </form:form>    
                        <div class="form-action">
                            <input type="submit" value="Guardar" id="valida-proveedor" />
                        </div> 

                </div>
            </div>
        </div>
    </div>
    <!-- my-account-area end -->
    <!-- footer start -->
    <jsp:include page="/WEB-INF/jsp/template-e-comerce/footer.jsp">
        <jsp:param name="footerTopAreaShow" value="no"/>
        <jsp:param name="footerBottomAreaCopyrightShow" value="si"/>
        <jsp:param name="footerBottomAreaPaymentShow" value="no"/>
    </jsp:include>
    <!-- footer end -->
    <!-- Color Variations -->
    <jsp:include page="/WEB-INF/jsp/template-e-comerce/colorSchemeSelect.jsp"/>
       
    <!-- all js here -->
    <!-- jquery latest version -->
    <jsp:include page="/WEB-INF/jsp/template-e-comerce/jsTemplate.jsp"/>
    <!--Js Login (dejar versión *.min.js ofuscada-->
    <script type="text/javascript" src="<c:url value="/resources/js/proveedor/proveedor.js"/>?v=<%=Calendar.getInstance().getTimeInMillis()%>"></script>
    
    <!--Modal -->
    <jsp:include page="/WEB-INF/jsp/utils/modal.jsp">     
        <jsp:param name="btnAceptar" value="Aceptar"/>
        <jsp:param name="btnCancelar" value="Cancelar"/>
    </jsp:include>
    <!--Modal-->    
    <!-- Loading -->
    <jsp:include page="/WEB-INF/jsp/utils/loading.jsp"/>
    <!-- Loading -->
</body>
</html>
