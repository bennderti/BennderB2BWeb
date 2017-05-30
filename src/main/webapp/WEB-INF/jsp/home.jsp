<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include.jsp" %>
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
                <h1>Nuevo Beneficio</h1>
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
                    <tr>
                        <td>Cena para 2</td>
                        <td>Restaurante</td>
                        <td>16-05-2017</td>
                        <td>28-05-2017</td>
                        <td>Publicado</td>
                        <td><button type="button" class="btn btn-default btn-sm"><span class="glyphicon glyphicon-pencil" aria-hidden="true" onclick="onEditarB(22)"></span></button></td>
                    </tr>
                    <tr>
                        <td>60 Piezas Sushi</td>
                        <td>Restaurante</td>
                        <td>16-05-2017</td>
                        <td>28-05-2017</td>
                        <td>Por publicar</td>
                        <td><button type="button" class="btn btn-default btn-sm"><span class="glyphicon glyphicon-pencil" aria-hidden="true"  onclick="onEditarB(22);"></span></button></td>
                    </tr>
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
        <script type="text/javascript">            
            
            function onEditarB(id){
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
        </script> 
        
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