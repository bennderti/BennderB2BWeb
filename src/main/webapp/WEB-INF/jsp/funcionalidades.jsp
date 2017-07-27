<%@page import="java.util.Calendar"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/include.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="shortcut icon" type="image/x-icon" href='<c:url value="/resources/beneficio/img/favicon.png"/>'>
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
        <link href="<c:url value="/resources/beneficio/css/bootstrap.min.css"/>?v=<%=Calendar.getInstance().getTimeInMillis()%>"  rel="stylesheet">
        <link href="<c:url value="/resources/beneficio/css/style.css"/>?v=<%=Calendar.getInstance().getTimeInMillis()%>" rel="stylesheet">
        <title>Bennder App - Mantenedor</title>
        <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
        <link href="<c:url value="/resources/beneficio/css/ie10-viewport-bug-workaround.css"/>?v=<%=Calendar.getInstance().getTimeInMillis()%>"  rel="stylesheet">
        <!-- Custom styles for this template -->
        <link href="<c:url value="/resources/beneficio/css/sticky-footer.css"/>?v=<%=Calendar.getInstance().getTimeInMillis()%>" rel="stylesheet">
        <script type="text/javascript" src="<c:url value="/resources/beneficio/js/ie10-viewport-bug-workaround.js"/>?v=<%=Calendar.getInstance().getTimeInMillis()%>"></script>
    </head>

    <body>

        <!-- HEADER INCICIO -->
        <jsp:include page="/WEB-INF/jsp/proveedor/navbar.jsp"/>
        <!-- HEADER FINAL -->

        <!-- CONTENIDO INICIO-->
        <div class="container">
            <div class="page-header">
                <!-- LOGO BENNDER -->
                <div class="text-center">
                    <img src="<c:url value="/resources/beneficio/img/logo-bennder-300.png"/>" alt = "Bennder">
                </div>
                <!-- LOGO BENNDER -->
                <h1>Funcionalidades Proveedor</h1>
            </div>
            <p class="lead">Administra tus beneficios y sucursales.</p>
        </div>
        <!-- CONTENIDO FINAL-->

        <!-- TABLA MANTENEDOR --> 
        <!-- example : https://datatables.net/examples/styling/bootstrap.html -->
        <div class="container formulario_mantenedor">  
        <div class="row">
            <div class="col-md-2">
              <div class="thumbnail">
                <a href="beneficios.html">
                  <img src="<c:url value="/resources/beneficio/img/funcionalidades/beneficios.png"/>" alt="Lights" style="width:100%">
                  <div class="caption">
                    <p>Crea, edita y publica promociones.</p>
                  </div>
                </a>
              </div>
            </div>
            <div class="col-md-2">
              <div class="thumbnail">
                <a href="sucursales.html">
                  <img src="<c:url value="/resources/beneficio/img/funcionalidades/sucursal.png"/>" alt="Nature" style="width:100%">
                  <div class="caption">
                    <p>Crea, edita sucursales para tus promociones.</p>
                  </div>
                </a>
              </div>
            </div>
          </div>
                  </div>  
        <!-- BOTÓN PROCESAR FORMULARIO --> 
        <!-- TABLA MANTENEDOR -->    
        <!-- FOOTER MANTENEDOR -->
        <footer class="footer">
            <div class="container">
                <p class="text-muted">Copyright ©2017 Bennder. Todos los derechos reservados. | ¿Tienes alguna duda? <a href="mailto:soporte@bennder.club?subject=Contacto por soporte proveedor">soporte@bennder.club</a></p>
            </div>
        </footer>
        <!-- FOOTER MANTENEDOR -->

        <!-- Bootstrap core JavaScript
        ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
        <jsp:include page="/WEB-INF/jsp/template-e-comerce/jsTemplate.jsp"/>
        <script src="<c:url value="/resources/beneficio/js/bootstrap.min.js"/>?v=<%=Calendar.getInstance().getTimeInMillis()%>"></script>
        
        <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
        <script src="<c:url value="/resources/beneficio/js/ie10-viewport-bug-workaround.js"/>?v=<%=Calendar.getInstance().getTimeInMillis()%>"></script>
        <!--Modal -->
        <jsp:include page="/WEB-INF/jsp/utils/modal.jsp">     
            <jsp:param name="btnAceptar" value="Aceptar"/>
            <jsp:param name="btnCancelar" value="Cancelar"/>
        </jsp:include>
        <!--Modal-->    
        <!-- Loading -->
        <jsp:include page="/WEB-INF/jsp/utils/loading.jsp"/>
        <script type="text/javascript">   
        </script> 
        </body>
</html>
