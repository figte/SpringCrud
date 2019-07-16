<%
    HttpSession s=session;
    
    try {
            
          //VALIDADNDO LA SESION.
    Boolean estado=(Boolean)s.getAttribute("estado");
    if (estado) {
 %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nueva Persona</title>
        <%@include file="../componentes/asset.jspf" %>
    </head>
    <body>
        <%@include file="../componentes/nabvar.jsp" %>
        <div class="container ">
            <h1 class="text-center mb-2"><span class="fas fa-file-alt"></span> Editar Registro</h1>
            <hr>
            <form action="/SpringCrud/Persona/modificar" method="Post">
                 <div class="form-group ">
                    <label class=" text-rigth" for="id">ID:</label>
                    <input  id="id" class="form-control " type="text" value="${item.getId()}" name="id" readonly="readonly">     
                </div>
                <div class="form-group ">
                    <label class=" text-rigth" for="nombre">Nombre:</label>
                    <input  id="nombre" class="form-control " type="text" value="${item.getNombre()}" name="nombre" placeholder="Digite sus nombres...">     
                </div>
                <div class="form-group ">
                    <label class=" text-rigth" for="apellidos">Apellidos:</label>
                    <input  id="apellidos" class="form-control " value="${item.getApellidos()}" type="text" name="apellidos" placeholder="Digite sus apellidos...">     
                </div>
                <div class="form-group ">
                    <label class=" text-rigth" for="edad">Edad:</label>
                    <input  id="edad" class="form-control " value="${item.getEdad()}" type="number" name="edad" placeholder="Digite su edad...">     
                </div>
                <div class="form-group ">
                    <label class=" text-rigth" for="direccion">Direccion:</label>
                    <textarea name="direccion" id="direccion"  class="form-control" placeholder="Digite su direccion..." rows="5">${item.getDireccion()}</textarea>
                </div>
                <div class="row mb-2">
                    <button class="btn btn-info  col-2 ml-2 " type="submit"><span class="fas fa-edit"></span> Modificar</button>
                   <a class="btn btn-danger col-2 ml-2" href="/SpringCrud/Persona/index"><span class="fas fa-ban"></span> Cancelar</a>
                </div>
            </form>
        </div>
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