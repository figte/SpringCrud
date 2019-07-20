<!-- Modal -->
<div class="modal fade" id="ModalEliminar" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h1 class="text-center mb-2 modal-title" id="myModalLabel"><span class="fas fa-file-alt"></span> Eliminar Registro</h1>
            </div>
            <div class="modal-body">
                <div class="form-group ">
                    <label class=" text-rigth" for="id">Id:</label>
                    <input readonly="readonly" id="idE" class="form-control " type="text"  name="id" >     
                </div>
                <div class="form-group ">
                    <label class=" text-rigth" for="nombre">Nombre:</label>
                    <input readonly="readonly" id="nombreE" class="form-control " type="text" name="nombre" placeholder="Digite sus nombres...">     
                </div>
                <div class="form-group ">
                    <label class=" text-rigth" for="precio">Precio:</label>
                    <input readonly="readonly" id="precioE" class="form-control " type="number" name="precio" placeholder="Digite el precio...">     
                </div>
                <div class="form-group ">
                    <label class=" text-rigth" for="existencias">Existencias:</label>
                    <input readonly="readonly" id="existenciasE" class="form-control " type="number" name="existencias" placeholder="Digite la cantidad de productos existentes...">     
                </div>


            </div>
            <div class="modal-footer">
                <button id="btnEliminar" class="btn btn-warning  col-2 ml-2 " type="button" data-dismiss="modal"><span class="fas fa-trash"></span> Eliminar</button>
                <a class="btn btn-danger col-2 ml-2" data-dismiss="modal"><span class="fas fa-ban"></span> Cancelar</a>

            </div>
        </div>
    </div>
</div>