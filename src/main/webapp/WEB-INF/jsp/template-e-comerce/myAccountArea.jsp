<%@page import="java.util.Calendar"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
<link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/login/login.css"/>?v=<%=Calendar.getInstance().getTimeInMillis()%>">

     <!-- my-account-area start -->
    <div class="my-account-area">
        <div class="container">
            <div class="row center-login">
                <!--<div class="col-md-6 col-sm-6">-->
                <div class="">
                <form:form method="POST" action="login.html" id="form-login" commandName="loginForm">
                    <div class="form-fields">
                        <h2>
                            Iniciar sesión</h2>
                        <p>
                            <label>
                                Usuario <span class="required">*</span></label>
                                <form:input path="user" autocomplete="off" id="user-login" maxlength="50"/>
                        </p>
                        <p>
                            <label>
                                Password <span class="required">*</span></label>
                                <form:password path="password" maxlength="15" id="password"/>
                        </p>
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />                        
                    </div>              
                    </form:form>    
                    <div class="form-action">
                        <p class="lost_password">
                            <a href="#" data-target="#pwdModal" data-toggle="modal" class="">¿Olvidó contraseña?</a></p>
                        <input type="submit" value="Ingresar" id="input-login" />
                        <!--<label>
                            <input type="checkbox" />
                            Remember me
                        </label>-->
                    </div>
                </div>
                <!--<div class="col-md-6 col-sm-6">
                    <form action="#">
                    <div class="form-fields">
                        <h2>
                            Registrar</h2>
                        <p>
                            <label>
                                Usuario <span class="required">*</span></label>
                            <input type="text" />
                        </p>
                        <p>
                            <label>
                                Password <span class="required">*</span></label>
                            <input type="password" />
                        </p>
                    </div>
                    <div class="form-action">
                        <input type="submit" value="Registrar" id="inicio" />
                    </div>
                    </form>
                </div>
                -->
            </div>
        </div>
    </div>
     
    <!--Recuperación contraseña - Modal - Inicio-->
    <div id="pwdModal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true" style="display: none;">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                 <h3 class="text-center">Recuperación Contraseña</h3>

            </div>
            <div class="modal-body">
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <div class="text-center">
                                <p class="">
                                    </p><div><span style="line-height: 1.42857;">¿Olividó Contraseña?</span>
                                        <br>
                                    </div>
                                    <div>
                                        <br>
                                    </div>
                                    <div>
                                        Escriba su nombre de usuario y pulse el botón solicitar contraseña y un correo electrónico
                                        será enviado con su contraseña correspondiente.
                                    </div>
                                <p></p>
                                <div class="panel-body">
                                    <fieldset>
                                        <div class="form-group">
                                            <input class="form-control input-lg" placeholder="Ingrese usuario" name="username-bennder" type="text" id="username-bennder">
                                        </div>
                                        <a class="btn btn-lg btn-primary btn-block" onclick="LoginBennder.recuperacionPassword();">Solicitar contraseña</a>
                                    </fieldset>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <div class="col-md-12">
                    <button class="btn" data-dismiss="modal" aria-hidden="true">Cancelar</button>
                </div>
            </div>
        </div>
    </div>
</div>
    <!--Recuperación contraseña - Modal - Fin--> 
     
     