

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
                        swal("error: " + data,"dar click para continuar","danger");
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
                       swal(data,"dar clic para continuar","success");
                       cargarDatos();
                    },
                    error: function (data) {
                        swal("Error: " + data,"dar click para continuar","danger");
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
                        swal("Error: " + data,"dar click para continuar","danger");
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
                        swal(data,"dar clic para continuar","success");
                        cargarDatos();
                    },
                    error: function (data) {
                        swal("Error: " + data,"dar click para continuar","danger");
                    }
                });
            }

            function eliminar() {
                let id = parseInt($("#idE").val());
               
                $.ajax({
                    method: "delete",
                    url: "http://localhost:8080/SpringCrud/productos/eliminar/"+id,
                    
                    success: function (data) {
                        swal(data,"dar clic para continuar","success");
                        cargarDatos();
                    },
                    error: function (data) {
                        swal("Error: " + data,"dar click para continuar","danger");
                    }
                });
            }


