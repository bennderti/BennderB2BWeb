<%@page import="java.util.Calendar"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- CSS -->
<link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/modal/bennder-loading.css"/>?v=<%=Calendar.getInstance().getTimeInMillis()%>">
<!-- CSS -->

<div class="modal-bg-bennder" style="display: none;">
</div>
<div id="loading" class = "bg-bennder-loading" style="display: none;">
    <ul class="bokeh">
            <li></li>
            <li></li>
            <li></li>
            <li></li>
    </ul>
</div>

 <script type="text/javascript" src="<c:url value="/resources/js/modal/bennder-loading.js"/>?v=<%=Calendar.getInstance().getTimeInMillis()%>"></script>
