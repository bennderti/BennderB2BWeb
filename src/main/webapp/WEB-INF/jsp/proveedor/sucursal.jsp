<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include.jsp" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
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
        <jsp:include page="/WEB-INF/jsp/proveedor/navbar.jsp">
            <jsp:param name="logout" value="../logout.html"/>
        </jsp:include>
        <!-- HEADER FINAL -->

        <!-- CONTENIDO INICIO-->
        <div class="container">
            <div class="page-header">
                <!-- LOGO BENNDER -->
                <div class="text-center">
                    <img src="<c:url value="/resources/beneficio/img/logo-bennder-300.png"/>" alt = "Bennder">
                </div>
                <!-- LOGO BENNDER -->
                <h1>Nueva Sucursal</h1>
            </div>
            <p class="lead">Crea, edita sucursales para vuestro comercio.</p>
        </div>
        <!-- CONTENIDO FINAL-->

        <!-- TABLA MANTENEDOR --> 
        
        <div class="container formulario_mantenedor">   
            <form:form  method="POST" 
                            action="../beneficio/guardar.html" 
                            id="form-sucursal" 
                            modelAttribute="sucursalForm"
                            accept-charset="iso-8859-1"
                            cssClass="form-horizontal">
                <form:hidden path="idSucursal"/> 
                 <div class="form-group">
                    <label class="control-label col-sm-2" for="ipt-nombre">Nombre Sucursal:</label>
                    <div class="col-md-4">          
                        <form:input path="nombre" id="ipt-nombre" cssClass="form-control" placeholder="Ingrese nombre de sucursal" maxlength="50"/>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="control-label col-sm-2" for="ipt-hora-atencion">Horario Atención:</label>
                    <div class="col-md-4">          
                      <form:input path="horarioAtencion" id="ipt-hora-atencion" cssClass="form-control" placeholder="Ingrese horario de atención" maxlength="100"/>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="control-label col-sm-2" for="ipt-oficina">Oficina:</label>
                    <div class="col-md-4">          
                      <form:input path="oficina" id="ipt-oficina" cssClass="form-control" placeholder="Ingrese oficina" maxlength="100"/>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="control-label col-sm-2" for="ipt-pwd-pos">Contraseña Caje POS:</label>
                    <div class="col-md-4">          
                      <form:input path="passwordPOS" id="ipt-pwd-pos" cssClass="form-control" placeholder="Ingrese password de canje beneficio en POS" maxlength="50"/>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="control-label col-sm-2" for="select-region">Región:</label>
                    <div class="col-md-4">
                        <form:select path="direccion.comuna.region.idRegion" 
                                     id = "select-region" 
                                     cssClass="form-control" 
                                     onchange="Sucursal.onChangeRegion();">
                            <form:option value="-1" label="--Seleccione Región--"/>
                            <form:options items="${regiones}" itemValue="idRegion" itemLabel="nombre"/>                           
                        </form:select>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="control-label col-sm-2" for="select-comunas">Comuna:</label>
                    <div class="col-md-4">
                        <c:choose>
                            <c:when test="${not empty comunasRegion}">
                                <form:select path="direccion.comuna.idComuna" 
                                     id = "select-comunas" 
                                     cssClass="form-control">
                                    <form:option value="-1" label="--Seleccione Comuna--"/>
                                    <form:options items="${comunasRegion}" itemValue="idComuna" itemLabel="nombre"/>                           
                                </form:select>                                    
                            </c:when>
                            <c:otherwise>
                                <select id = "select-comunas" class="form-control">
                                    <option value="-1">--Seleccione Comuna--</option>                                
                                </select>                                    
                            </c:otherwise>                                                    
                        </c:choose>  
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="control-label col-sm-2" for="ipt-calle">Calle:</label>
                    <div class="col-md-4">          
                      <form:input path="direccion.calle" id="ipt-calle" cssClass="form-control" placeholder="Ingrese Calle" maxlength="20"/>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="control-label col-sm-2" for="ipt-nro">Nro:</label>
                    <div class="col-md-4">          
                      <form:input path="direccion.numero" id="ipt-nro" cssClass="form-control" placeholder="Ingrese Número" maxlength="10"/>
                    </div>
                  </div>               
            </form:form>
            <div class="form-group"> 
                <div class="col-sm-offset-2 col-sm-10">
                    <button type="submit" class="btn btn-primary btn-guardar-beneficio" onclick="Sucursal.onValidaGuardaSucursal();">Guardar Sucursal</button>
                    <button type="button" class="btn btn-default" onclick="onCancelar();">Cancelar</button>
                </div>
            </div>
        </div>
        
        <!-- FOOTER MANTENEDOR -->
        <footer class="footer">
            <div class="container">
                <p class="text-muted">Copyright ©2017 Bennder. Todos los derechos reservados. | ¿Tienes alguna duda? <a href="mailto:soporte@bennder.cl?subject=Contacto por soporte proveedor">soporte@bennder.cl</a></p>
            </div>
        </footer>
        <!-- FOOTER MANTENEDOR -->

        <!-- Bootstrap core JavaScript
        ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="<c:url value="/resources/beneficio/js/jquery.1.12.4.min.js"/>?v=<%=Calendar.getInstance().getTimeInMillis()%>"></script>
        <script src="<c:url value="/resources/beneficio/js/bootstrap.min.js"/>?v=<%=Calendar.getInstance().getTimeInMillis()%>"></script>
        <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
        <script src="<c:url value="/resources/beneficio/js/ie10-viewport-bug-workaround.js"/>?v=<%=Calendar.getInstance().getTimeInMillis()%>"></script>
        <!-- AGREGA ELIMINA -->
        <script type="text/javascript" src="<c:url value="/resources/beneficio/js/sucursal/sucursal.js"/>?v=<%=Calendar.getInstance().getTimeInMillis()%>"></script>
        <script type="text/javascript">
            function onCancelar(){
                ModalBennder.mostrar({titulo:"Sucursal",mensaje:"¿Está seguro que desea salir?",eventoAceptar:function(){
                     window.location.href = "../home.html";   
                }});
            }
        </script>
        <!-- AGREGA ELIMINA -->
        
         <!--Modal -->
        <jsp:include page="/WEB-INF/jsp/utils/modal.jsp">     
            <jsp:param name="btnAceptar" value="Aceptar"/>
            <jsp:param name="btnCancelar" value="Cancelar"/>
        </jsp:include>
        <!--Modal-->    
        <!-- Loading -->
        <jsp:include page="/WEB-INF/jsp/utils/loading.jsp"/>
        </body>
        
</html>