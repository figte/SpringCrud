 <!-- Modal -->
            <div class="modal fade" id="ModalNuevo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                          
                            <h1 class="text-center mb-2" class="modal-title" id="myModalLabel"><span class="fas fa-file-alt"></span> Nuevo Registro</h1>
                           
                        </div>
                        <div class="modal-body">
                                <div class="form-group ">
                                    <label class=" text-rigth" for="nombre">Nombre:</label>
                                    <input  id="nombre" class="form-control " type="text" name="nombre" placeholder="Digite su nombre...">     
                                </div>
                                <div class="form-group ">
                                    <label class=" text-rigth" for="precio">Precio:</label>
                                    <input  id="precio" class="form-control " type="number" name="precio" placeholder="Digite el precio...">     
                                </div>
                                <div class="form-group ">
                                    <label class=" text-rigth" for="existencias">Existencias:</label>
                                    <input  id="existencias" class="form-control " type="number" name="existencias" placeholder="Digite la cantidad de productos disponibles...">     
                                </div>
                               

                        </div>
                        <div class="modal-footer">
                            <button id="btnGuardar"   class="btn btn-success  col-2"  data-dismiss="modal"><span class="fas fa-save"></span> Guardar</button>
                            <a class="btn btn-danger col-2 ml-2" data-dismiss="modal"><span class="fas fa-ban"></span> Cancelar</a>

                        </div>
                    </div>
                </div>
            </div>
            

