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
		.error-template {padding: 40px 15px;text-align: center;}
		.error-actions {margin-top:15px;margin-bottom:15px;}
		.error-actions .btn { margin-right:10px; }
	</style>
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
                <!-- header-bottom-area start -->            
                <jsp:include page="/WEB-INF/jsp/template-e-comerce/headerBottomAreaSearch.jsp"/>
                <!-- header-bottom-area end -->
                <!-- main-menu-area start -->      
                <!-- main-menu-area end -->
                <!-- mobile-menu-area start -->
                <!-- mobile-menu-area end -->			
            </header>
        </div>
        <!-- HOME SLIDER -->
        <!-- heading-banner start -->
        <!-- heading-banner end -->
        <!-- my-account-area start -->
        <div class="my-account-area">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="error-template">
                            <h1>
                                Oops!</h1>
                            <h2>
                                Página no encontrada</h2>
                            <div class="error-details">
                                Disculpa, recurso no encontrado para página solicitada
                            </div>
                            <div class="error-actions">
                                <a href="index.html" class="btn btn-primary btn-lg">
                                    <span class="glyphicon glyphicon-home"></span>
                                    Ir a login </a>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <!-- my-account-area end -->
        <!-- footer start -->
        <jsp:include page="/WEB-INF/jsp/template-e-comerce/footer.jsp"/>
        <!-- footer end -->
        <!-- Color Variations -->
        <jsp:include page="/WEB-INF/jsp/template-e-comerce/colorSchemeSelect.jsp"/>

        <!-- all js here -->
        <!-- jquery latest version -->
        <jsp:include page="/WEB-INF/jsp/template-e-comerce/jsTemplate.jsp"/>
        <!--Js Login (dejar versión *.min.js ofuscada-->
        <script type="text/javascript" src="<c:url value="/resources/js/login/login.js"/>?v=<%=Calendar.getInstance().getTimeInMillis()%>"></script>

        <!--Modal -->
        <jsp:include page="/WEB-INF/jsp/utils/modal.jsp">     
            <jsp:param name="btnAceptar" value="Aceptar"/>
            <jsp:param name="btnCancelar" value="Cancelar"/>
        </jsp:include>
        <!--Modal-->
    </body>
</html>
