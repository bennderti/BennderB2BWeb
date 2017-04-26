<%@page import="cl.bennder.bennderweb.session.UsuarioSession"%>
<%@page import="java.util.Calendar"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- header-top-area start -->
    <div class="header-top-area hidden-xs"> 
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6 col-sm-4">
                    <div class="welcome">
                        <i class="fa fa-tag" aria-hidden="true"></i>
                        <span class="">Bennder, un mundo de beneficios</span> 
                        <!-- <span class="phone">+569 XXXXXXXX</span>-->
                        <!--<span class="hidden-sm">/</span>
                        <span class="email hidden-sm">Email: yourname@domain.com</span>-->
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-8">
                    <div class="top-menu">
                        <c:if test="${not empty param.muestraSesion && param.muestraSesion == 'si'}">
                            <ul id="currency">
                                <li><a href="#"><i class="fa fa-user" aria-hidden="true"></i>
                                    <c:out value="${sessionScope.user}"/>    
                                    <i class="fa fa-angle-down"></i></a>
                                    <ul>
                                        <li><a href="logout.html"><i class="fa fa-sign-out" aria-hidden="true"></i>salir</a></li>
                                        <!--<li><a href="#">AUD</a></li>
                                        <li><a href="#">Rs</a></li>-->
                                    </ul>
                                </li>
                            </ul>
                        </c:if>
                        <!--<ul>
                            <li><a href="#">My Account</a></li>
                            <li><a href="#">Wishlist</a></li>
                            <li><a href="#">Shopping cart</a></li>
                            <li><a href="#">Checkout</a></li>
                        </ul>-->
                    </div>
                </div>
            </div>
        </div>
    </div>