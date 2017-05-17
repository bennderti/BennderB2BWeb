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
                <h1>Nuevo Beneficio</h1>
            </div>
            <p class="lead">Crea, edita y publica un nuevo beneficio en Bennder.</p>
        </div>
        <!-- CONTENIDO FINAL-->

        <!-- TABLA MANTENEDOR --> 
        
        <div class="container formulario_mantenedor">   
             <form:form  method="POST" 
                            action="../beneficio/guardar.html" 
                            id="form-beneficio" 
                            modelAttribute="beneficioForm" 
                            enctype="multipart/form-data"
                            accept-charset="iso-8859-1">
                <!-- PROMOCIÓN -->	
                <div class="row">
                    <form:hidden path="idBeneficio"/>  
                    <input type="hidden" name="nameImagePrincipal" id="nameImagePrincipal" value="${beneficioForm.nameImagePrincipal}"/>
                    <div class="col-md-4">
                        <label for="nombrePromo">Nombre Promoción</label>
                        <form:input path="nombre" autocomplete="off" id="ti-nombre-promocion" maxlength="150" cssClass="form-control" placeholder="Ingrese nombre de promoción"/>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label>Categoría</label>
                            <form:select path="idCategoriaSelected" 
                                         id = "select-categorias" 
                                         cssClass="form-control" 
                                         onchange="Beneficio.onChangeCategoria();">
                                <form:option value="-1" label="--Seleccione Categoria--"/>
                                <form:options items="${categorias}" itemValue="idCategoria" itemLabel="nombre"/>                           
                            </form:select>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="select-sub-categorias">Sub-Categoría</label>
                            <select id = "select-sub-categorias" class="form-control">
                                <option value="-1">--Seleccione Sub Categoria--</option>                                
                            </select>
                            <input type="hidden" name="idSubCategoriaSelected" id="input-idSubCategoriaSelected"/>
                        </div>
                    </div>
                </div>
                <!-- PROMOCIÓN -->

                <!-- DESCRIPCIÓN -->
                <div class="form-group">
                    <label for="ta-descripcion">Descripción</label>
                    <form:textarea  rows="3" path="descripcion" id="ta-descripcion" cssClass="form-control" placeholder="Escribe la descripción de la promoción, producto o servicio"/> 
                </div>
                <!-- DESCRIPCIÓN --> 
                <!-- FECHAS DE VIGENCIA STOCK -->
                <div class="row">
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="f-inicio">Fecha Inicio</label>
                            <input class="form-control" type="date" value="" id="f-inicio" name="fechaInicio"/>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="f-expiracion" >Fecha Expiración</label>
                            <input class="form-control" type="date" value="" id="f-expiracion" name="fechaExpiracion"/>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="ti-stock">Stock</label>
                            <form:input path="stock" autocomplete="off" id="ti-stock" maxlength="50" cssClass="form-control" placeholder="Ingrese stock"/>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="ti-limite-stock">Limite Stock</label>
                            <form:input path="limiteStock" autocomplete="off" id="ti-limite-stock" maxlength="50" cssClass="form-control" placeholder="Ingrese límite stock para alertar"/>
                        </div>
                    </div>
                </div>

                <!-- FECHAS DE VIGENCIA STOCK -->

                <!-- CONDICIONES COMERCIALES -->
                <label>Condiciones Comerciales</label>
                <div class="panel panel-default">
                    <div class="panel-body content-condicion-comercial">
                        <div class="input-group control-group after-add-more">
                            <input type="text" name="add-condicion" id = "add-condicion" class="form-control" placeholder="Ingresar condición comercial">
                            <div class="input-group-btn"> 
                                    <button class="btn btn-success add-more" type="button" onclick="Beneficio.agregaCodicion(this);"><i class="glyphicon glyphicon-plus"></i> Agregar</button>
                            </div>
                        </div>
                    </div>
                  </div>
                <!-- CONDICIONES COMERCIALES -->
                <!-- SUCURSALES COMERCIALES -->
                <label for="t">Sucursal / Tienda de Canje</label>
                <div class="panel panel-default">
                    <div class="panel-body"> 
                        <div class="form-group">
                            <label for="select-region">Región</label>
                            <form:select path="idRegionSelected" 
                                         id = "select-region" 
                                         cssClass="form-control" 
                                         onchange="Beneficio.onChangeRegion();">
                                <form:option value="-1" label="--Seleccione Región--"/>
                                <form:options items="${regiones}" itemValue="idRegion" itemLabel="nombre"/> 
                            </form:select>
                            
                        </div>
                        <div class="form-group">
                            <label for="select-comuna">Comuna</label>
                            <select id = "select-comuna" class="form-control" onchange="Beneficio.onChangeComuna();">
                                <option value="-1">--Seleccione Comuna--</option>                                
                            </select>
                            <input type="hidden" name="idComunaSelected" id="input-idComunaSelected"/>
                        </div>
                        <div class = "content-sucursales">                            
                        </div>
                    </div>

                </div>
                <!-- SUCURSALES COMERCIALES -->

                <!-- TIPO DE PROMOCIÓN -->
                <label for="t">Tipo de Promoción</label>
                <!--begin tabs going in wide content -->
                <ul class="nav nav-tabs" id="li-tipo-promo" role="tablist">
                    <li class="${beneficioForm.idTipoBeneficioSelected eq 1 || beneficioForm.idTipoBeneficioSelected eq -1 ? 'active':''}"><a href="#descuento" role="tab" data-toggle="tab">Descuento</a></li>
                    <li class="${beneficioForm.idTipoBeneficioSelected eq 2 ? 'active':''}"><a href="#precio" role="tab" data-toggle="tab">Precio Oferta</a></li>
                    <li class="${beneficioForm.idTipoBeneficioSelected eq 3 ? 'active':''}"><a href="#adicional" role="tab" data-toggle="tab">Producto / Servicio Adicional</a></li>
                </ul><!--/.nav-tabs.content-tabs -->
                <input type="hidden" name="idTipoBeneficioSelected" value ="${beneficioForm.idTipoBeneficioSelected}"/>
                <input type="hidden" name="tipoCargaImagen" value ="${beneficioForm.tipoCargaImagen}" id="tipoCargaImagen"/>
                <!-- CONTENIDOS TABS -->
                <div class="tab-content">
                    <!-- DESCUENTO -->
                    <div class="tab-pane fade ${beneficioForm.idTipoBeneficioSelected eq 1 || beneficioForm.idTipoBeneficioSelected eq -1 ? 'in active':''}" id="descuento">
                        <div class="row">
                            <div class="col-md-4"><br>
                                <label for="ti-descuento">% Descuento</label>
                                <form:input path="porcentajeDescuento" autocomplete="off" id="ti-descuento" maxlength="50" cssClass="form-control" placeholder = "Ingrese % de descuento"/>
                            </div>
                        </div>
                    </div>
                    <!-- DESCUENTO -->

                    <!-- PRECIO OFERTA ANTES y HOY -->
                    <div class="tab-pane fade ${beneficioForm.idTipoBeneficioSelected eq 2 ? 'in active':''}" id="precio">
                        <div class="row"><br>
                            <div class="col-md-4">
                                <label for="ti-normal">Precio Antes</label>
                                <form:input path="precioNormal" autocomplete="off" id="ti-normal" maxlength="50" cssClass="form-control" placeholder = "Ingrese precio normal"/>
                            </div>
                            <div class="col-md-4">
                                <label for="ti-oferta">Precio Hoy</label>
                                <form:input path="precioOferta" autocomplete="off" id="ti-oferta" maxlength="50" cssClass="form-control" placeholder = "Ingrese precio oferta"/>
                            </div>
                        </div>
                    </div>
                    <br>
                    <!-- PRECIO OFERTA ANTES y HOY -->

                    <!-- PRODUCTO / SERVICIO ADICIONAL-->
                    <div class="tab-pane fade ${beneficioForm.idTipoBeneficioSelected eq 3 ? 'in active':''}" id="adicional">
                    <div class="panel panel-default">
                        <div class="panel-body content-prod-servicio-adicional">
                                <div class="input-group control-group after-add-more">
                                <input type="text" name="add-adicional" id = "add-condicion" class="form-control" placeholder="Agregar producto/servicio adicional">
                                        <div class="input-group-btn"> 
                                                <button class="btn btn-success add-more" type="button" onclick="Beneficio.agregaProductoAdicional(this);"><i class="glyphicon glyphicon-plus"></i> Agregar</button>
                                        </div>
                                  </div>

                        </div>
                      </div>
                    <!-- PRODUCTO / SERVICIO ADICIONAL-->
                    </div>
                    <!-- CONTENIDOS TABS -->
                    <!-- TIPO DE PROMOCIÓN -->
                    <div class="form-group">
                        <label class="btn btn-primary  btn-file">
                            Cargar imagenes <input type="file" hidden id="f-adjuntar" multiple="multiple" name = "images">
                        </label>
                        <small id="fileHelp" class="form-text text-muted">Acá puedes cargar imagenes para tu promoción desde tu repositorio</small> 
                    </div>
                    <div class="form-group">
                        <label class="btn btn-default btn-file">
                            <button type="button" class="btn btn-primary adj-generica"  onclick="Beneficio.onLoadImagenGenerica();">Cargar imagenes Genérico</button>
                        </label>
                        <small id="fileHelp" class="form-text text-muted">Si no dispones de imagenes, utiliza ésta opción para oferecerte de nuestro repositorio asociado a categoria seleccionada</small>
                        <div class="contents-imagen-generica">
                        </div>                        
                    </div>
                    <label>Imagenes cargadas para la promoción</label>
                    <div class="container content-imagenes-add">
                        <div class="row">
                            <div class="col-md-12">
                                <div id="Carousel" class="carousel slide ">                 
                                    <ol class="carousel-indicators">
                                        <li data-target="#Carousel" data-slide-to="0" class="active"></li>
                                        <li data-target="#Carousel" data-slide-to="1"></li>
                                        <li data-target="#Carousel" data-slide-to="2"></li>
                                    </ol>                 

                                    <div class="carousel-inner">                    
                                        <div class="item active">
                                            <div class="row">
                                                <div class="col-md-3 content-img-benefio">
                                                    <span class="button-checkbox sup-izq">
                                                        <button type="button" class="btn btn-default" data-color="primary" onclick="Beneficio.onChangePrincipal(this);"><i class="state-icon glyphicon glyphicon-unchecked"></i>Pricipal</button>
                                                        <input type="checkbox" class="hidden">
                                                    </span>
                                                    <a href="#" class="thumbnail"><img src="<c:url value="/resources/beneficio/img/example.png"/>" alt="Image" style="max-width:100%;"></a>

                                                </div>
                                                <div class="col-md-3 content-img-benefio">
                                                    <span class="button-checkbox sup-izq">
                                                        <button type="button" class="btn btn-default" data-color="primary" onclick="Beneficio.onChangePrincipal(this);"><i class="state-icon glyphicon glyphicon-unchecked"></i>Pricipal</button>
                                                        <input type="checkbox" class="hidden">
                                                    </span>
                                                    <a href="#" class="thumbnail"><img src="<c:url value="/resources/beneficio/img/example.png"/>" alt="Image" style="max-width:100%;"></a>						
                                                </div>
                                                <div class="col-md-3 content-img-benefio">
                                                    <span class="button-checkbox sup-izq">
                                                        <button type="button" class="btn btn-default" data-color="primary" onclick="Beneficio.onChangePrincipal(this);"><i class="state-icon glyphicon glyphicon-unchecked"></i>Pricipal</button>
                                                        <input type="checkbox" class="hidden">
                                                    </span>
                                                    <a href="#" class="thumbnail"><img src="<c:url value="/resources/beneficio/img/example.png"/>" alt="Image" style="max-width:100%;"></a>

                                                </div>
                                                <div class="col-md-3 content-img-benefio">
                                                    <span class="button-checkbox sup-izq">
                                                        <button type="button" class="btn btn-default" data-color="primary" onclick="Beneficio.onChangePrincipal(this);"><i class="state-icon glyphicon glyphicon-unchecked"></i>Pricipal</button>
                                                        <input type="checkbox" class="hidden">
                                                    </span>
                                                    <a href="#" class="thumbnail"><img src="<c:url value="/resources/beneficio/img/example.png"/>" alt="Image" style="max-width:100%;"></a>

                                                </div>
                                            </div>
                                        </div>

                                        <div class="item">
                                            <div class="row">
                                                <div class="col-md-3 content-img-benefio">
                                                    <span class="button-checkbox sup-izq">
                                                        <button type="button" class="btn btn-default" data-color="primary" onclick="Beneficio.onChangePrincipal(this);"><i class="state-icon glyphicon glyphicon-unchecked"></i>Pricipal</button>
                                                        <input type="checkbox" class="hidden">
                                                    </span>
                                                    <a href="#" class="thumbnail"><img src="<c:url value="/resources/beneficio/img/example.png"/>" alt="Image" style="max-width:100%;"></a>

                                                </div>
                                                <div class="col-md-3 content-img-benefio">
                                                    <span class="button-checkbox sup-izq">
                                                        <button type="button" class="btn btn-default" data-color="primary" onclick="Beneficio.onChangePrincipal(this);"><i class="state-icon glyphicon glyphicon-unchecked"></i>Pricipal</button>
                                                        <input type="checkbox" class="hidden">
                                                    </span>
                                                    <a href="#" class="thumbnail"><img src="<c:url value="/resources/beneficio/img/example.png"/>" alt="Image" style="max-width:100%;"></a>						
                                                </div>
                                                <div class="col-md-3 content-img-benefio">
                                                    <span class="button-checkbox sup-izq">
                                                        <button type="button" class="btn btn-default" data-color="primary" onclick="Beneficio.onChangePrincipal(this);"><i class="state-icon glyphicon glyphicon-unchecked"></i>Pricipal</button>
                                                        <input type="checkbox" class="hidden">
                                                    </span>
                                                    <a href="#" class="thumbnail"><img src="<c:url value="/resources/beneficio/img/example.png"/>" alt="Image" style="max-width:100%;"></a>

                                                </div>
                                                <div class="col-md-3 content-img-benefio">
                                                    <span class="button-checkbox sup-izq">
                                                        <button type="button" class="btn btn-default" data-color="primary" onclick="Beneficio.onChangePrincipal(this);"><i class="state-icon glyphicon glyphicon-unchecked"></i>Pricipal</button>
                                                        <input type="checkbox" class="hidden">
                                                    </span>
                                                    <a href="#" class="thumbnail"><img src="<c:url value="/resources/beneficio/img/example.png"/>" alt="Image" style="max-width:100%;"></a>

                                                </div>
                                            </div>
                                        </div>

                                        <div class="item">
                                            <div class="row">
                                                <div class="col-md-3 content-img-benefio">
                                                    <span class="button-checkbox sup-izq">
                                                        <button type="button" class="btn btn-default" data-color="primary" onclick="Beneficio.onChangePrincipal(this);"><i class="state-icon glyphicon glyphicon-unchecked"></i>Pricipal</button>
                                                        <input type="checkbox" class="hidden">
                                                    </span>
                                                    <a href="#" class="thumbnail"><img src="<c:url value="/resources/beneficio/img/example.png"/>" alt="Image" style="max-width:100%;"></a>

                                                </div>
                                                <div class="col-md-3 content-img-benefio">
                                                    <span class="button-checkbox sup-izq">
                                                        <button type="button" class="btn btn-default" data-color="primary" onclick="Beneficio.onChangePrincipal(this);"><i class="state-icon glyphicon glyphicon-unchecked"></i>Pricipal</button>
                                                        <input type="checkbox" class="hidden">
                                                    </span>
                                                    <a href="#" class="thumbnail"><img src="<c:url value="/resources/beneficio/img/example.png"/>" alt="Image" style="max-width:100%;"></a>						
                                                </div>
                                                <div class="col-md-3 content-img-benefio">
                                                    <span class="button-checkbox sup-izq">
                                                        <button type="button" class="btn btn-default" data-color="primary" onclick="Beneficio.onChangePrincipal(this);"><i class="state-icon glyphicon glyphicon-unchecked"></i>Pricipal</button>
                                                        <input type="checkbox" class="hidden">
                                                    </span>
                                                    <a href="#" class="thumbnail"><img src="<c:url value="/resources/beneficio/img/example.png"/>" alt="Image" style="max-width:100%;"></a>

                                                </div>
                                                <div class="col-md-3 content-img-benefio">
                                                    <span class="button-checkbox sup-izq">
                                                        <button type="button" class="btn btn-default" data-color="primary" onclick="Beneficio.onChangePrincipal(this);"><i class="state-icon glyphicon glyphicon-unchecked"></i>Pricipal</button>
                                                        <input type="checkbox" class="hidden">
                                                    </span>
                                                    <a href="#" class="thumbnail"><img src="<c:url value="/resources/beneficio/img/example.png"/>" alt="Image" style="max-width:100%;"></a>

                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                    <a data-slide="prev" href="#Carousel" class="left carousel-control">‹</a>
                                    <a data-slide="next" href="#Carousel" class="right carousel-control">›</a>
                                </div>

                            </div>
                        </div>
                    </div>

                    <!-- Creates the bootstrap modal where the image will appear -->
                    <div class="modal fade" id="gallery-imagen-generica" tabindex="-1" role="dialog" aria-labelledby="gallery-imagen-generica" aria-hidden="true">
                        <div class="modal-dialog  modal-lg">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                                    <h4 class="modal-title">Imagenes Genéricas</h4>
                                </div>
                                <div class="modal-body content-body-generico">                                    
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-primary" data-dismiss="modal"  onclick="Beneficio.onCargaSeleccionImagenesGenerica();">Cargar Selección</button>
                                </div>
                            </div>
                        </div>
                        <!-- BOTÓN PROCESAR FORMULARIO --> 
                    </div>
               </div>
             <input type="hidden" value="${rutaImagenExample}" id="rutaImagenExample"/>
            </form:form>
            <div class="form-group"> 
                <div class="col-sm-offset-2 col-sm-10">
                    <button type="submit" class="btn btn-primary btn-guardar-beneficio" onclick="Beneficio.onValidaGuardaBeneficio();">Guardar Beneficio</button>
                </div>
            </div>
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
        <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
        <script src="<c:url value="/resources/beneficio/js/ie10-viewport-bug-workaround.js"/>?v=<%=Calendar.getInstance().getTimeInMillis()%>"></script>
        <!-- AGREGA ELIMINA -->
        <script type="text/javascript" src="<c:url value="/resources/beneficio/js/formulario/formulario.js"/>?v=<%=Calendar.getInstance().getTimeInMillis()%>"></script>
        <script type="text/javascript">
            $(function () {
                $("#f-inicio").val('${beneficioForm.fechaInicio}');
                $("#f-expiracion").val('${beneficioForm.fechaExpiracion}');
            });
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