<%
    HttpSession s=session;
    try {         
      //VALIDADNDO LA SESION.
    Boolean estado=(Boolean)s.getAttribute("estado");
    if (estado) {
 %>  
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 <html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Administrar Ventas</title>

       <%@include file="../componentes/asset.jspf" %>
    </head>
    <body>

        <%@include file="../componentes/nabvar.jsp" %>
        <div class="container" style="margin-top:3%">
         <h1 class="text-center mt-2"><span class="fas fa-table"></span> Lista  de Ventas</h1>
         <hr/>

            <a href="#"  class="btn btn-primary mt-2"><span class="fas fa-plus"></span> Nuevo</a> <br><br>
            <br><br>
            <table id="tdatos"  class="table table-striped table-bordered table-hover" style="width:100%">
                <thead>
                    <tr>
                        <th> ID</th>
                        <th> CLIENTE</th>
                        <th> FECHA</th>
                        <th>DETALLES</th>
                        
                        <th>ACCIONES</th>
                    </tr> 
                </thead>
                
                <tbody>
                    <c:forEach var="item" items="${list}">
                        <tr>
                            <td><c:out value="${item.id}"/></td>
                            <td><c:out value="${item.idcliente.nombre}"/></td>
                            <td><c:out value="${item.fecha}"/></td>
                            <td></td>
                            <td>
                                <a class="btn btn-warning mt-1" href="/SpringCrud/Venta/modificar/<c:out value="${item.id}" />"><span class="fas fa-pen"></span></a>
                                <a class="btn btn-danger mt-1" href="/SpringCrud/Venta/eliminar/<c:out value="${item.id}"/>"><span class="fas fa-minus"></span></a>
                            </td>				
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

        <script>
            $(document).ready(function () {
                $('#tdatos').DataTable();
            });
        </script>
    </body>
</html>
<% 
  }else{
       response.sendRedirect("/SpringCrud/");
  }
 } catch (Exception e) {
       response.sendRedirect("/SpringCrud/");  
}
%>