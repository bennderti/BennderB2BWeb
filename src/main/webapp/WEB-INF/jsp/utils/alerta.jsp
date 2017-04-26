<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div>
 <c:if test="${not empty validacion}">
     <c:choose>
         <c:when test="${validacion.codigo eq '0'}">
             <c:choose>
                 <c:when test="${validacion.codigoNegocio eq '0'}">
                     <div class="alert alert-success">
                        <strong>Validación:</strong><c:out value="${validacion.mensaje}"/>
                      </div>
                 </c:when>                 
                 <c:otherwise>
                     <div class="alert alert-warning">
                        <strong>Adventencia:</strong> <c:out value="${validacion.mensaje}"/>
                      </div>
                 </c:otherwise>
             </c:choose>
         
         </c:when>
         <c:when test="${validacion.codigo eq '1'}">
            <div class="alert alert-danger">
                <strong>Error:</strong> <c:out value="${validacion.mensaje}"/>
            </div>
         </c:when>        
     </c:choose>
</c:if>   
    
</div>
