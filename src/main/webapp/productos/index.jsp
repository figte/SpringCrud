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

        <script>
            //SE ASEGURA LA CARGA DEL DOCUMENTO PARA INICIAR CON LAS ACCIONES.
            $(document).ready(function () {
                $('#tdatos').DataTable();
                cargarDatos(); //CARGA LOS REGISTROS EL LA TABLA 
                $("#btnGuardar").click(guardar); //EVENTO CLICK PARA BOTON DE NUEVO
                $("#btnEliminar").click(eliminar);
                $("#btnModificar").click(modificar);
            });
            
            
            function reset(){
                $("#id").val("");
                $("#nombre").val("");
                $("#precio").val("");
                $("#existencias").val("");
                
                $("#idE").val("");
                $("#nombreE").val("");
                $("#precioE").val("");
                $("#existenciasE").val("");
                
                $("#idM").val("");
                $("#nombreM").val("");
                $("#precioM").val("");
                $("#existenciasM").val("");
                
            }

            /*
             * 
             * @returns {undefined}
             * Metodo para cargar registros en la tabla obtenidos en una peticion AJAX
             */
            function cargarDatos() {
                reset();
                $.ajax({
                    method: "Get",
                    url: "http://localhost:8080/SpringCrud/productos/listar",
                    success: function (data, textStatus, jqXHR) {
                        //alert("alert: "+data);
                        let tdatos = $("#data");
                        tdatos.html("");

                        data.forEach(function (element) {

                            tdatos.append("<tr>" +
                                    "<td>" + element.id + "</td>" +
                                    "<td>" + element.nombre + "</td>" +
                                    "<td>" + element.precio + "</td>" +
                                    "<td>" + element.existencias + "</td>" +
                                    "<td>  <button onclick='cargarRegistro(" + element.id + ",\"M\")' type='button' class='btn btn-warning mt-2' data-toggle='modal' data-target='#ModalModificar'><span class='fas fa-pen'></span></button>" +
                                    "<button onclick='cargarRegistro(" + element.id + ",\"E\")' style='margin-left:2%' type='button' class='btn btn-danger mt-2' data-toggle='modal' data-target='#ModalEliminar'><span class='fas fa-minus'></span></button>" +
                                    "</td></tr>");

                        });
                        //console.log(d);
                        //$('#tdatos').DataTable({data:d});
                    },
                    error: function (data) {
                        alert("error: " + data);
                    }

                });
            }

            /*
             * 
             * @returns {undefined}
             * Metodo para guardar un registro , obeteniendo los datos y enviandolos en una peticion AJAX
             */
            function guardar() {
                let nombre = $("#nombre").val();
                let precio = parseFloat($("#precio").val());
                let existencias = parseInt($("#existencias").val());

                $.ajax({
                    method: "Post",
                    url: "http://localhost:8080/SpringCrud/productos/guardar",
                    data: {
                        nombre: nombre,
                        precio: precio,
                        existencias: existencias
                    },
                    success: function (data) {
                        alert(data);
                        cargarDatos();
                    },
                    error: function (data) {
                        alert("Error: " + data);
                    }
                });
            }

            function  cargarRegistro(id, action) {
                $.ajax({
                    method: "Get",
                    url: "http://localhost:8080/SpringCrud/productos/obtener/" + id,
                    success: function (data) {
                        $("#id" + action).val(data.id);
                        $("#nombre" + action).val(data.nombre);
                        $("#precio" + action).val(data.precio);
                        $("#existencias" + action).val(data.existencias);
                    },
                    error: function (data) {
                        alert("Error: " + data);
                    }

                });
            }

            function modificar() {
                let id = parseInt($("#idM").val());
                let nombre = $("#nombreM").val();
                let precio = parseFloat($("#precioM").val());
                let existencias = parseInt($("#existenciasM").val());

                $.ajax({
                    method: "Post",
                    url: "http://localhost:8080/SpringCrud/productos/modificar/"+id,
                    data: {
                        id: id,
                        nombre: nombre,
                        precio: precio,
                        existencias: existencias
                    },
                    success: function (data) {
                        alert(data);
                        cargarDatos();
                    },
                    error: function (data) {
                        alert("Error: " + data);
                    }
                });
            }

            function eliminar() {
                let id = parseInt($("#idE").val());
               
                $.ajax({
                    method: "delete",
                    url: "http://localhost:8080/SpringCrud/productos/eliminar/"+id,
                    
                    success: function (data) {
                        alert(data);
                        cargarDatos();
                    },
                    error: function (data) {
                        alert("Error: " + data);
                    }
                });
            }

        </script>
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