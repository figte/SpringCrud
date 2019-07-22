<%
    HttpSession s = session;

    try {

        //VALIDADNDO LA SESION.   
        Boolean estado = (Boolean) s.getAttribute("estado");
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
        <title>Administrar Productos</title>
        <%@include file="../componentes/asset.jspf" %>
    </head>
    <body>

        <%@include file="../componentes/nabvar.jsp" %>
        <div class="container" style="margin-top:3%">

            <h1 class="text-center mt-2"><span class="fas fa-table"></span> Lista  de Productos</h1> 
            <hr>    

            <!-- Vista para gregar un nuevo registro con un modal-->
            <button  type="button" class="btn btn-primary mt-2" data-toggle="modal" data-target="#ModalNuevo"><span class="fas fa-plus"></span> Nuevo</button>
            <%@include file="../productos/nuevo.jsp" %>  <!--Se agrega el modal para la vista de nuevo -->

            <br/><br/>
            <!--Tabla con registros -->
            <table id="tdatos"  class="table table-striped table-bordered table-hover" style="width:100%">
                <thead>
                    <tr>
                        <th> ID</th>
                        <th> NOMBRE</th>
                        <th> PRECIO</th>
                        <th>EXISTENCIAS</th>
                        <th>ACCIONES</th>
                    </tr> 
                </thead>

                <tbody id="data">
                </tbody>
            </table>
        </div>

        <!--Agregando los Modals para eliminar y modificar -->
        <%@include file="../productos/eliminar.jsp" %>
        <%@include file="../productos/modificar.jsp" %>

       <!-- Script de acciones y peticiones-->
        <script src="productos.js"></script>
        
    </body>
</html>
<%
        } else {
            response.sendRedirect("/SpringCrud/");
        }
    } catch (Exception e) {
        response.sendRedirect("/SpringCrud/");
    }
%>