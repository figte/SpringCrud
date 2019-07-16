<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">JAVA APP</a>
    </div>
      
    <ul class="nav navbar-nav">
     
      <li ><a href="/SpringCrud/Persona/index">Personas</a></li>
      <li><a href="/SpringCrud/Venta/index">Ventas</a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
        <li><a >Usuario: <%=session.getAttribute("usuario")%> </a></li>
      <li><a href="${contextPath}/logout"><span class=""></span> Cerrar Session</a></li>
    </ul>
  </div>
</nav>