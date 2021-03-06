<%@page import="java.util.Calendar"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- footer start -->
<footer>
    <!-- footer-top-area start -->
    
    <c:if test="${not empty param.footerTopAreaShow && param.footerTopAreaShow == 'si'}">
    <div class="footer-top-area">
        <div class="container">
            <div class="row">
                <!-- footer-widget start -->
                <div class="col-lg-3 col-md-3 col-sm-4">
                    <div class="footer-widget">
                        <div class="footer-logo"><a href="#"><span>e</span> Online Shop</a></div>								
                        <p>Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. .</p>
                        <address class="box-address">
                            <span class="fa fa-home"></span>123 Pall Mall, London England<br>
                            <span class="fa fa-phone"></span> <b class="color-dark">+12345 67890 </b><br>										
                            <span class="fa fa-envelope"></span> <a class="color" href="mailto:admin@yourdomain.com">admin@yourdomain.com</a>
                        </address>                                
                    </div>
                </div>
                <!-- footer-widget end -->
                <!-- footer-widget start -->
                <div class="col-lg-3 col-md-3 hidden-sm">
                    <div class="footer-widget">
                        <h3>Information</h3>
                        <ul class="footer-menu">
                            <li><a href="#">About Us</a></li>
                            <li><a href="#">Customer Service</a></li>
                            <li><a href="#">Privacy Policy</a></li>
                            <li><a href="#">Site Map</a></li>
                            <li><a href="#">Contact</a></li>
                        </ul>
                    </div>
                </div>
                <!-- footer-widget end -->
                <!-- footer-widget start -->
                <div class="col-lg-3 col-md-3 col-sm-4">
                    <div class="footer-widget">
                        <h3>Our services</h3>
                        <ul class="footer-menu">
                            <li><a href="#">Shipping & Returns</a></li>
                            <li><a href="#">Secure Shopping</a></li>
                            <li><a href="#">International Shipping</a></li>
                            <li><a href="#">Affiliates</a></li>
                            <li><a href="#">Help</a></li>
                        </ul>
                    </div>
                </div>
                <!-- footer-widget end -->
                <!-- footer-widget start -->
                <div class="col-lg-3 col-md-3 col-sm-4">
                    <div class="footer-widget">		
                        <h3>NEWSLETTER SIGNUP</h3>
                        <div class="subscribe-title">                               
                            <form action="#">
                                <div class="subscribe-form">
                                    <input type="text" placeholder="Your Email.........">
                                    <button>
                                        subscribe</button>
                                </div>
                            </form>
                        </div>						
                        <div class="widget-icon">
                            <a href="#"><i class="fa fa-facebook"></i></a>
                            <a href="#"><i class="fa fa-twitter"></i></a>
                            <a href="#"><i class="fa fa-linkedin"></i></a>
                            <a href="#"><i class="fa fa-google-plus"></i></a>
                            <a href="#"><i class="fa fa-instagram"></i></a>
                            <a href="#"><i class="fa fa-youtube-square"></i></a>
                        </div>
                    </div>
                </div>
                <!-- footer-widget end -->
            </div>
        </div>
    </div>        
    </c:if>

    <!-- footer-top-area end -->
    <!-- footer-bottom-area start -->
    <div class="footer-bottom-area">
        <div class="container">
            <div class="row">
                <c:if test="${not empty param.footerBottomAreaCopyrightShow && param.footerBottomAreaCopyrightShow == 'si'}">
                    <div class="col-lg-6 col-md-6 col-sm-6">
                       <div class="copyright">
                           <p>Copyright � <a href="#" target="_blank">Bennder</a>. Todos los derechos reservados</p>
                       </div>
                   </div>                   
                </c:if>

                <c:if test="${not empty param.footerBottomAreaPaymentShow && param.footerBottomAreaPaymentShow == 'si'}">
                    <div class="col-lg-6 col-md-6 col-sm-6">
                        <div class="payment-img">
                            <img src='<c:url value="/resources/img/payment.png"/>'  alt="" />
                        </div>
                    </div>                    
                </c:if>
            </div>
        </div>
    </div>
    <!-- footer-bottom-area end -->
</footer>
