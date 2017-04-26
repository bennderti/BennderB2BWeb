<%@page import="java.util.Calendar"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="context" value="${pageContext.request.contextPath}" scope="request" />
<script>
    var context = '${context}';
</script>
<!-- all js here -->
<!-- jquery latest version -->
<script type="text/javascript" src="<c:url value="/resources/js/vendor/jquery-1.12.0.min.js"/>?v=<%=Calendar.getInstance().getTimeInMillis()%>"></script>
<!-- bootstrap js -->
<script type="text/javascript" src="<c:url value="/resources/js/bootstrap.min.js"/>?v=<%=Calendar.getInstance().getTimeInMillis()%>"></script>
<!-- owl.carousel js -->
<script type="text/javascript" src="<c:url value="/resources/js/owl.carousel.min.js"/>?v=<%=Calendar.getInstance().getTimeInMillis()%>"></script>
<!-- jquery-ui js -->
<script type="text/javascript" src="<c:url value="/resources/js/jquery-ui.min.js"/>?v=<%=Calendar.getInstance().getTimeInMillis()%>"></script>
<!-- RS-Plugin JS -->
<script type="text/javascript" src="<c:url value="/resources/lib/rs-plugin/js/jquery.themepunch.tools.min.js"/>?v=<%=Calendar.getInstance().getTimeInMillis()%>"></script>
<script type="text/javascript" src="<c:url value="/resources/lib/rs-plugin/js/jquery.themepunch.revolution.min.js"/>?v=<%=Calendar.getInstance().getTimeInMillis()%>"></script>
<script type="text/javascript" src="<c:url value="/resources/lib/rs-plugin/rs.home.js"/>?v=<%=Calendar.getInstance().getTimeInMillis()%>"></script>
<!-- meanmenu js -->
<script type="text/javascript" src="<c:url value="/resources/js/jquery.meanmenu.js"/>?v=<%=Calendar.getInstance().getTimeInMillis()%>"></script>
<!-- wow js -->
<script type="text/javascript" src="<c:url value="/resources/js/wow.min.js"/>?v=<%=Calendar.getInstance().getTimeInMillis()%>"></script>
<!-- plugins js -->
<script type="text/javascript" src="<c:url value="/resources/js/plugins.js"/>?v=<%=Calendar.getInstance().getTimeInMillis()%>"></script>
<!-- main js -->
<script type="text/javascript" src="<c:url value="/resources/js/main.js"/>?v=<%=Calendar.getInstance().getTimeInMillis()%>"></script>
<!-- Cookie js -->
<script type="text/javascript" src="<c:url value="/resources/js/jquery.cookie.js"/>?v=<%=Calendar.getInstance().getTimeInMillis()%>"></script>
<!-- Validaciones de numéricos -->
<!--url:http://girescom.com/include/jquery/plugins/alphanumeric/ -->
<script type="text/javascript" src="<c:url value="/resources/js/validaciones/jquery.alphanumeric.pack.js"/>?v=<%=Calendar.getInstance().getTimeInMillis()%>"></script>
