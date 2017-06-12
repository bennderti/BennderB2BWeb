<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
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
                                            <a href="index.html"><img src="<c:url value="/resources/beneficio/img/logo-bennder-300.png"/>"></a>
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
    <jsp:include page="/WEB-INF/jsp/template-e-comerce/headingBanner.jsp"/>
    <!-- heading-banner end -->
    <!-- form change password -->
 <div class="my-account-area">
        <div class="container">
            <div class="row center-login">
                <!--<div class="col-md-6 col-sm-6">-->
                <div class="">
                <form:form method="POST" action="changepassword.html" id="form-login" commandName="cambioPassword">
                    <div class="form-fields">
                        <h2>
                            Cambio de clave temporal</h2>
                        <p>
                            <label>
                                Password <span class="required">*</span></label>
                                <form:input path="newPassword" autocomplete="off" id="new-password" maxlength="50"/>
                        </p>
                        <p>
                            <label>
                                Repetir Password <span class="required">*</span></label>
                                <form:password path="repeatPassword" maxlength="15" id="repeat-password"/>
                                
                        </p>
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />                        
                    </div>              
                    </form:form>    
                    <div class="form-action">
                        <input type="submit" value="Ingresar" id="input-update-password" />
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
    <script type="text/javascript" src="<c:url value="/resources/js/login/login.js"/>?v=<%=Calendar.getInstance().getTimeInMillis()%>"></script>
    
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
