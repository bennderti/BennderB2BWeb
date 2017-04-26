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
                                            <a href="../home.html"><img src="<c:url value="/resources/img/bennder/logo.png"/>"></a>
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
                        <li><a href="#">Administración Proveedor</a></li>
                        <!--<li class="active">Login</li>-->
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- my-account-area start -->
    <div class="my-account-area">
        <div class="container">
            <div class="row center-login">
                <div class="col-md-6 col-sm-6">
                    <ul>
                        <li><a href="../proveedor/lista.html">Información General Proveedor</a></li> 
                        <li><a href="../proveedor/cargaImagenesBeneficio.html">Cargar Imagenes Beneficios</a></li>
                    </ul>
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
