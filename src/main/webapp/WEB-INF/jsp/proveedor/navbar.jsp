<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="context" value="${pageContext.request.contextPath}" scope="request" />
<script>
    var context = '${context}';
</script>
<nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container-fluid">
          <div class="navbar-header">
              <a class="navbar-brand" href="#">Bennder</a>
          </div>
          <ul class="nav navbar-nav navbar-right">
              <li><a href="#"><span class="glyphicon glyphicon-user"></span> <c:out value="${sessionScope.user}"/>  </a></li>
              <li><a href="${param.logout != null ? param.logout:'logout.html'}"><span class="glyphicon glyphicon-log-in"></span> Cerrar sesión</a></li>
          </ul>
      </div>
  </nav>