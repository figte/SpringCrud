<%-- 
    Document   : nuevo
    Created on : 06-13-2019, 01:40:16 PM
    Author     : FIGTE
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nueva Persona</title>
        <%@include file="../componentes/asset.jspf" %>
    </head>
    <body>
        <div class="container ">
            <h1 class="text-center mb-2"><span class="fas fa-file-alt"></span> Nuevo Registro</h1>
            <hr>
            <form action="/SpringCrud/Persona/guardar" method="Post">
                <div class="form-group ">
                    <label class=" text-rigth" for="nombre">Nombre:</label>
                    <input  id="nombre" class="form-control " type="text" name="nombre" placeholder="Digite sus nombres...">     
                </div>
                <div class="form-group ">
                    <label class=" text-rigth" for="apellidos">Apellidos:</label>
                    <input  id="apellidos" class="form-control " type="text" name="apellidos" placeholder="Digite sus apellidos...">     
                </div>
                <div class="form-group ">
                    <label class=" text-rigth" for="edad">Edad:</label>
                    <input  id="edad" class="form-control " type="number" name="edad" placeholder="Digite su edad...">     
                </div>
                <div class="form-group ">
                    <label class=" text-rigth" for="direccion">Direccion:</label>
                    <textarea name="direccion" id="direccion" class="form-control" placeholder="DIgite su direccion..." rows="5"></textarea>
                </div>
                <div class="row">
                    <button class="btn btn-success  col-2 ml-2 " type="submit"><span class="fas fa-save"></span> Guardar</button>
                    <a class="btn btn-danger col-2 ml-2" href="/SpringCrud/Persona/index"><span class="fas fa-ban"></span> Cancelar</a>
                </div>
            </form>
        </div>
    </body>
</html>
