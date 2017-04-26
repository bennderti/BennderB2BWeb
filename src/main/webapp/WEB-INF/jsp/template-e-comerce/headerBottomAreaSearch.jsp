<%@page import="java.util.Calendar"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- header-bottom-area start -->            
<div class="header-bottom-area">
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                <div class="logo">
                    <a href="home.html"><img src="<c:url value="/resources/img/bennder/logo.png"/>"></a>
                </div>
            </div>
            <div class="col-lg-6 col-md-5 col-sm-5 col-xs-6 hidden-xs">
                <div class="header-search">
                    <select id="select-categorias" class="select-categorias">
                        <option value="-1">Seleccione...</option>
                        <c:if test="${not empty categorias}">
                            <c:forEach items="${categorias}" var="c">
                                <option value="${c.idCategoria}">${c.nombre}</option>
                            </c:forEach>
                        </c:if>
                    </select>
                    <input type="text" placeholder="buscar beneficio..." />
                    <button id="btn-busca-beneficio"><i class="fa fa-search"></i></button>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12 account-wrap">
                <!-- Header shopping cart -->
                <div class="my-account-holder">                
                    <div class="my-account-title">
                        <div class="user-icon float-left">
                            <i class="fa fa-exchange" aria-hidden="true"></i>
                        </div>                                   
                        <div class="clearfix"></div>                     
                    </div>
                </div>
                <!-- Header shopping cart -->
                <div class="my-account-holder">                
                    <div class="my-account-title">
                        <div class="user-icon float-left">
                            <i class="fa fa-heart" aria-hidden="true"></i>
                        </div>                                   
                        <div class="clearfix"></div>                     
                    </div>
                </div>                             
                <div class="my-account-holder">                
                    <div class="total-cart my-account-title" data-toggle="my-cart">
                        <div class="user-icon float-left">
                            <i class="fa fa-shopping-cart" aria-hidden="true"></i>
                        </div>
                        <div class="float-left cart-link">
                            <a href="#">2 Item(s)</a>
                        </div>
                        <div class="clearfix"></div>  
                        <ul>
                            <li>
                                <div class="cart-img">
                                    <a href="#"><img alt="" src='<c:url value="/resources/img/cart/total-cart.jpg"/>'></a>

                                </div>
                                <div class="cart-info">
                                    <h4><a href="#">Vestibulum suscipit</a></h4>
                                    <span>�165.00 <span>x 1</span></span>
                                </div>
                                <div class="del-icon">
                                    <i class="fa fa-times-circle"></i>
                                </div>
                            </li>
                            <li>
                                <div class="cart-img">
                                    <a href="#"><img alt="" src='<c:url value="/resources/img/cart/total-cart.jpg"/>'></a>											    
                                </div>
                                <div class="cart-info">
                                    <h4><a href="#">Vestibulum suscipit</a></h4>
                                    <span>�165.00 <span>x 1</span></span>
                                </div>
                                <div class="del-icon">
                                    <i class="fa fa-times-circle"></i>
                                </div>
                            </li>
                            <li>
                                <div class="subtotal-text">Subtotal: </div>
                                <div class="subtotal-price">�300.00</div>
                            </li>
                            <li>
                                <a href="#" class="button float-right">Checkout</a>										    
                            </li>
                        </ul>                   
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>