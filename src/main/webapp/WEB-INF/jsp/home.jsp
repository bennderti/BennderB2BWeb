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
        <link href="<c:url value="/resources/beneficio/css/dataTables.bootstrap.min.css"/>?v=<%=Calendar.getInstance().getTimeInMillis()%>"  rel="stylesheet">
        
        <link href="<c:url value="/resources/beneficio/css/style.css"/>?v=<%=Calendar.getInstance().getTimeInMillis()%>" rel="stylesheet">

        <title>Bennder App - Mantenedor</title>

        <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
        <link href="<c:url value="/resources/beneficio/css/ie10-viewport-bug-workaround.css"/>?v=<%=Calendar.getInstance().getTimeInMillis()%>"  rel="stylesheet">
        <!-- Custom styles for this template -->
        <link href="<c:url value="/resources/beneficio/css/sticky-footer.css"/>?v=<%=Calendar.getInstance().getTimeInMillis()%>" rel="stylesheet">
        <link href="<c:url value="/resources/beneficio/css/beneficio.css"/>?v=<%=Calendar.getInstance().getTimeInMillis()%>" rel="stylesheet">
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
                <h1>Mantenedor de Beneficios</h1>
            </div>
            <p class="lead">Crea, edita y publica un nuevo beneficio en Bennder.</p>
        </div>
        <!-- CONTENIDO FINAL-->

        <!-- TABLA MANTENEDOR --> 
        <!-- example : https://datatables.net/examples/styling/bootstrap.html -->
        <div class="container formulario_mantenedor">   
            <div class="form-group">
                <button type="button" class="btn btn-primary crea-beneficio" onclick="location.href = 'beneficio/crear.html';"><i class="fa fa-plus-circle" aria-hidden="true"></i><span> Nuevo Beneficio</span></button>
            </div>
<!--            <div class="table-responsive table-hover"> 
            <table cellpadding="0" cellspacing="0" border="0" class="display" id="beneficios_mantenedor" width="100%">
                <thead>
                        <tr>
                                <th>Nombre Promoci&oacute;n</th>
                                <th>Categoria</th>
                                <th>Fecha Inicio</th>
                                <th>Fecha Expiraci&oacute;n</th>
                                <th>Estado de Publicaci&oacute;n</th>
                        </tr>
                </thead>
            </table>
            </div>-->
            <table id="example" class="table table-striped table-bordered" cellspacing="0" width="100%">
                <thead>
                    <tr>
                        <th>Nombre Promoci&oacute;n</th>
                        <th>Categoria</th>
                        <th>Fecha Inicio</th>
                        <th>Fecha Expiraci&oacute;n</th>
                        <th>Estado de Publicaci&oacute;n</th>
                        <th>Editar</th>
                    </tr>
                </thead>
<!--                 <tfoot>
                    <tr>
                        <th>Nombre Promoci&oacute;n</th>
                        <th>Categoria</th>
                        <th>Fecha Inicio</th>
                        <th>Fecha Expiraci&oacute;n</th>
                        <th>Estado de Publicaci&oacute;n</th>
                    </tr>
                </tfoot>-->
                <tbody>
                    <c:choose>
                        <c:when test="${not empty beneficios}"> 
                            <c:forEach items="${beneficios}" var="beneficio">
                                <tr>
                                    <td>${beneficio.titulo}</td>
                                    <td>${beneficio.nombreCategoria}</td>
                                    <td><fmt:formatDate value="${beneficio.fechaInicial}" pattern="dd/MM/yyyy" /></td>
                                    <td><fmt:formatDate value="${beneficio.fechaExpiracion}" pattern="dd/MM/yyyy" /></td>
                                    <td>
                                        <input type="checkbox" id="${beneficio.idBeneficio}" <c:if test="${beneficio.habilitado}"> checked </c:if> 
                                               onclick="publicar(${beneficio.idBeneficio}, $(this).prop('checked'))">                                        
                                    </td>
                                    <td>
                                        <button type="button" class="btn btn-default btn-sm" onclick="onEditarB(${beneficio.idBeneficio})">
                                            <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                                        </button>
                                    </td>
                                </tr>
                            </c:forEach>  
                        </c:when>
                        <c:otherwise>
                            <tr>
                                <td>Proveedor Sin Beneficios</td>                                
                            </tr>
                        </c:otherwise>
                    </c:choose>
                </tbody>
            </table>
        </div>
        <!-- BOTÓN PROCESAR FORMULARIO --> 
        <!-- TABLA MANTENEDOR -->    
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
        <script src="<c:url value="/resources/beneficio/js/jquery.dataTables.min.js"/>?v=<%=Calendar.getInstance().getTimeInMillis()%>"></script>
        <script src="<c:url value="/resources/beneficio/js/dataTables.bootstrap.min.js"/>?v=<%=Calendar.getInstance().getTimeInMillis()%>"></script>
        
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
            var listaBeneficiosPublicados = [];
            
            function onEditarB(id){
                ModalLoading.mostrar();
                window.location.href = "beneficio/editar.html?id="+id;
            }
            $(document).ready(function() {
                $('#example').DataTable( {
                    "language": {
                      "paginate": {
                        "next": "siguiente",
                        "previous": "Anterior"
                      }
                    }
                  } );
            } );
            
            function publicar(idBeneficio, habilitado){
                var agregar = true;
                
//                alert(idBeneficio);
//                
//                alert(habilitado);
//                            
                for(i=0;i<listaBeneficiosPublicados.length;i++)
                {
                    if(listaBeneficiosPublicados[i].idBeneficio == idBeneficio)
                    {
                        agregar = false;
                        break;
                    }
                }
                
                if(agregar)
                {
                    var beneficio = new Object();
                    beneficio.idBeneficio = idBeneficio;
                    beneficio.habilitado = habilitado;
                    
                    listaBeneficiosPublicados.push(beneficio);
                }             
            }
        </script> 
        </body>
</html>
