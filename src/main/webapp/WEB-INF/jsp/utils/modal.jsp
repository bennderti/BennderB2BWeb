<%@page import="java.util.Calendar"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- responsive css -->
<link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/modal/bennder-modal.css"/>?v=<%=Calendar.getInstance().getTimeInMillis()%>">
<!--Modal Incio-->
<!-- Button trigger modal
<button id= "btn-modal" type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal" style="display:none;">
  Launch demo modal
</button>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Bennder</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        Modal Bennder
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
        <button type="button" class="btn btn-primary">Ok</button>
      </div>
    </div>
  </div>
</div>
-->

<!-- Modal -->
  <div class="modal fade modal-bennder" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close"  aria-hidden="true" onclick="ModalBennder.close()">&times;</button>
          <h4 class="modal-title" id="myModalLabel"></h4>
        </div>
        <div class="modal-body">
          <p class = "modal-text"></p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default btn-cancelar-bennder" onclick="ModalBennder.close()"><c:out value="${param.btnCancelar}"/></button>
          <button type="button" class="btn btn-primary btn-aceptar-bennder" onclick="ModalBennder.close()"><c:out value="${param.btnAceptar}"/></button>
        </div>
      </div>
      <!-- /.modal-content -->
    </div>
  </div>
  <!-- /.modal -->
  <script type="text/javascript" src="<c:url value="/resources/js/modal/bennder-modal.js"/>?v=<%=Calendar.getInstance().getTimeInMillis()%>"></script>


