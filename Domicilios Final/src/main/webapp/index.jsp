<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="styles.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
        <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>  
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bienvenido a Domicilios para todo</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous"/>
        <script src = "http://ajax.googleapis.com/ajax/libs/angularjs/1.2.15/angular.min.js"></script>
    </head>
    <body>
        <div class="container-fluid" ng-app="domicilios" ng-controller="controladorProductos">
            <div class="container">
                <div class="row">
                    <h2 class="text-center" id="title">¡Hola, "El sazón de la abuela"!<a href="index.html" data-toggle="tooltip" title="Cerrar sesión" data-placement="left">
                            <i id="salir" class="bi bi-door-open"></i></a></h2>
                </div>
                <div class="row">
                    <nav>
                        <div class="nav nav-tabs" id="nav-tab" role="tablist">
                            <li class="nav-link" id="nav-profile-tab" data-bs-toggle="tab" data-bs-target="#nav-profile" type="button" role="tab" aria-controls="nav-profile" aria-selected="false">Perfil</li>
                            <li class="nav-link" id="nav-inv-tab" data-bs-toggle="tab" data-bs-target="#nav-inv" type="button" role="tab" aria-controls="nav-inv" aria-selected="true">Inventario</li>
                            <li class="nav-link active" id="nav-domi-tab" data-bs-toggle="tab" data-bs-target="#nav-domi" type="button" role="tab" aria-controls="nav-domi" aria-selected="false">Domicilios</li>
                            <li class="nav-link" id="nav-calif-tab" data-bs-toggle="tab" data-bs-target="#nav-calif" type="button" role="tab" aria-controls="nav-calif" aria-selected="false">Calificaciones</li>
                        </div>
                    </nav>
                    <div class="tab-content" id="nav-tabContent">
                        <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
                            <div class="container">
                                <div class="row">
                                    <div class="col-md-7">
                                        <form role="form" method="post" action="">
                                            <fieldset>              
                                                <p class="text-uppercase pull-center"><b>Información general</b></p> 
                                                <div class="mb-3">
                                                    <label for="restaurante" class="form-label">Nombre comercial:</label>
                                                    <input type="text" name="restaurante" id="restaurante" class="form-control input-lg" value="El sazón de la abuela">
                                                </div>
                                                <div class="mb-3">
                                                    <label for="nit" class="form-label">NIT o Cédula del representante legal:</label>
                                                    <input type="text" name="nit" id="nit" class="form-control input-lg" value="987-456-678">
                                                </div>
                                                <div class="mb-3">
                                                    <label for="correo" class="form-label">Correo electrónico:</label>
                                                    <input type="email" name="correo" id="correo" class="form-control input-lg" value="elsazondelaabuela@correo.com">
                                                </div>
                                                <div class="mb-3">
                                                    <label for="usuario" class="form-label">Usuario</label>
                                                    <input type="text" name="usuario" id="usuario" class="form-control input-lg" value="sazonabuela">
                                                </div>
                                                <div class="mb-3">
                                                    <label for="contrasenna" class="form-label">Contraseña</label>
                                                    <input type="password" name="contrasenna" id="contrasenna" class="form-control input-lg" value="1234567890">
                                                </div>
                                                <div>
                                                    <input type="submit" class="btn btn-primary"  value="Actualizar">
                                                </div>
                                            </fieldset>
                                        </form>
                                    </div>
                                    <div class="col-md-1"></div>
                                    <div class="col-md-4"><img src="img/domicilio.png" class="rounded mx-auto d-block mt-5" alt="..."></div>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="nav-inv" role="tabpanel" aria-labelledby="nav-inv-tab">
                            <h5 class="text-center mt-3"><strong>Inventario de productos</strong></h5>
                            <div class="d-grid gap-2 d-md-flex justify-content-md-end"> 
                                <button class="btn btn-primary me-md-2 mb-2" type="button" data-bs-toggle="modal" data-bs-target="#modalAddProducto">
                                    <i class="bi bi-plus-circle-fill"></i>   Añadir producto</button>
                                <button class="btn btn-primary me-md-2 mb-2" type="button" data-bs-toggle="modal" ng-click="listarProducto()">
                                    <i class="bi bi-plus-circle-fill"></i>   Listar Producto</button>
                            </div>
                            <table class="table table-striped table-hover mt-2 text-center">
                                <thead class="table-primary">
                                    <tr>
                                        <th scope="col">ID</th>
                                        <th scope="col">Nombre producto</th>
                                        <th scope="col">Precio de Venta</th>
                                        <th scope="col">Precio de Compra</th>
                                        <th scope="col">Stock disponible</th>
                                        <th scope="col">Descuento</th>
                                        <th scope="col">¿Eliminar?</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr ng-repeat="producto in productos">
                                        <td> {{producto.idProducto}}</td>
                                        <td ng-click="abrirModalActualizar(producto.idProducto)"><a type="button" href="#" data-bs-toggle="modal" data-bs-target="#modalProducto" ng-click="mostrarFormActualizar(producto)">{{producto.nombre}}</a></td>
                                        <td>{{producto.precioDeVenta}}</td>
                                        <td>{{producto.precioDeCompra}}</td>
                                        <td>{{producto.stock}}</td>
                                        <td>{{producto.descuento}}</td>
                                        <td ng-click="abrirModalEliminar(producto.idProducto)"><button class="btn-delete" type="button"><i class="bi bi-trash"></i></a></td>
                                    </tr>
                                </tbody>
                            </table>
                            <nav aria-label="Page navigation example">
                                <ul class="pagination justify-content-center">
                                    <li class="page-item">
                                        <a class="page-link" href="#" aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                        </a>
                                    </li>
                                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                                    <li class="page-item">
                                        <a class="page-link" href="#" aria-label="Next">
                                            <span aria-hidden="true">&raquo;</span>
                                        </a>
                                    </li>
                                </ul>
                            </nav>
                        </div>
                        <div class="tab-pane fade show active" id="nav-domi" role="tabpanel" aria-labelledby="nav-domi-tab">
                            <h5 class="text-center mt-3"><strong>Historial de domicilios</strong></h5>
                            <div class="row mt-3">
                                <div class="col-md-2">
                                    <label class="p-2">Filtrar por estado:</label>
                                </div>
                                <div class="col-md-3">
                                    <select id="filtro-estado" class="form-select">
                                        <option selected>Selecciona una opción</option>
                                        <option value="1">Por responder</option>
                                        <option value="2">Despachado</option>
                                        <option value="3">Aceptado</option>
                                        <option value="4">En preparación</option>
                                    </select>
                                </div>
                            </div>
                            <table class="table table-striped table-hover mt-2 text-center">
                                <thead class="table-primary">
                                    <tr>
                                        <th scope="col">#</th>
                                        <th scope="col">Cliente</th>
                                        <th scope="col">Dirección</th>
                                        <th scope="col">Fecha de entrega</th>
                                        <th scope="col">Estado</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>1</td>
                                        <td><a type="button" href="#" data-bs-toggle="modal" data-bs-target="#exampleModal">Pepito Pérez</a></td>
                                        <td>Calle false 123</td>
                                        <td>27 de noviembre de 2021</td>
                                        <td>Por responder</td>
                                    </tr>
                                    <tr>
                                        <td>2</td>
                                        <td><a type="button" href="#">Pepito Pérez</a></td>
                                        <td>Calle false 123</td>
                                        <td>27 de noviembre de 2021</td>
                                        <td>Aceptado</td>
                                    </tr>
                                    <tr>
                                        <td>3</td>
                                        <td><a type="button" href="#">Pepito Pérez</a></td>
                                        <td>Calle false 123</td>
                                        <td>27 de noviembre de 2021</td>
                                        <td>En preparación</td>
                                    </tr>
                                    <tr>
                                        <td>4</td>
                                        <td><a type="button" href="#">Pepito Pérez</a></td>
                                        <td>Calle false 123</td>
                                        <td>27 de noviembre de 2021</td>
                                        <td>Despachado</td>
                                    </tr>
                                    <tr>
                                        <td>5</td>
                                        <td><a type="button" href="#">Pepito Pérez</a></td>
                                        <td>Calle false 123</td>
                                        <td>27 de noviembre de 2021</td>
                                        <td>Por responder</td>
                                    </tr>
                                    <tr>
                                        <td>6</td>
                                        <td><a type="button" href="#">Pepito Pérez</a></td>
                                        <td>Calle false 123</td>
                                        <td>27 de noviembre de 2021</td>
                                        <td>Aceptado</td>
                                    </tr>
                                    <tr>
                                        <td>7</td>
                                        <td><a type="button" href="#">Pepito Pérez</a></td>
                                        <td>Calle false 123</td>
                                        <td>27 de noviembre de 2021</td>
                                        <td>En preparación</td>
                                    </tr>
                                    <tr>
                                        <td>8</td>
                                        <td><a type="button" href="#">Pepito Pérez</a></td>
                                        <td>Calle false 123</td>
                                        <td>27 de noviembre de 2021</td>
                                        <td>Despachado</td>
                                    </tr>
                                </tbody>
                            </table>
                            <nav aria-label="Page navigation example">
                                <ul class="pagination justify-content-center">
                                    <li class="page-item">
                                        <a class="page-link" href="#" aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                        </a>
                                    </li>
                                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                                    <li class="page-item">
                                        <a class="page-link" href="#" aria-label="Next">
                                            <span aria-hidden="true">&raquo;</span>
                                        </a>
                                    </li>
                                </ul>
                            </nav>
                        </div>
                        <div class="tab-pane fade" id="nav-calif" role="tabpanel" aria-labelledby="nav-calif-tab">
                            <h5 class="text-center mt-3"><strong>Mis calificaciones</strong></h5>
                            <div class="container pb-2">
                                <div class="row">
                                    <div class="col-md-7">
                                        <p><strong>María Martínez     </strong><span class="badge rounded-pill bg-warning">5.0</span></p> 
                                        <small>Me ha encantado la atención de este lugar. La comida es deliciosa</small>
                                        <hr>
                                        <p><strong>María Martínez     </strong><span class="badge rounded-pill bg-warning">5.0</span></p>
                                        <small>Me ha encantado la atención de este lugar. La comida es deliciosa</small>
                                        <hr>
                                        <p><strong>María Martínez     </strong><span class="badge rounded-pill bg-warning">5.0</span></p>
                                        <small>Me ha encantado la atención de este lugar. La comida es deliciosa</small>
                                        <hr>
                                        <p><strong>María Martínez     </strong><span class="badge rounded-pill bg-warning">5.0</span></p>
                                        <small>Me ha encantado la atención de este lugar. La comida es deliciosa</small>
                                        <hr>
                                        <p><strong>María Martínez     </strong><span class="badge rounded-pill bg-warning">5.0</span></p>
                                        <small>Me ha encantado la atención de este lugar. La comida es deliciosa</small>
                                        <hr>
                                        <nav aria-label="Page navigation example">
                                            <ul class="pagination justify-content-center">
                                                <li class="page-item">
                                                    <a class="page-link" href="#" aria-label="Previous">
                                                        <span aria-hidden="true">&laquo;</span>
                                                    </a>
                                                </li>
                                                <li class="page-item"><a class="page-link" href="#">1</a></li>
                                                <li class="page-item"><a class="page-link" href="#">2</a></li>
                                                <li class="page-item"><a class="page-link" href="#">3</a></li>
                                                <li class="page-item">
                                                    <a class="page-link" href="#" aria-label="Next">
                                                        <span aria-hidden="true">&raquo;</span>
                                                    </a>
                                                </li>
                                            </ul>
                                        </nav>
                                    </div>
                                    <div class="col-md-1"></div>
                                    <div class="col-md-4 text-center mt-5">
                                        <p>Tu calificación promedio es:</p>
                                        <h1>5.0</h1>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Modal eliminar producto -->
            <div class="modal fade" id="modalEliminarProducto" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">Eliminar Producto</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <p>¿Está seguro de eliminar el registro? Si lo hace, este producto ya <strong>no aparecerá en el menú para los clientes</strong></p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                            <button type="button" class="btn btn-danger" data-bs-dismiss="modal" ng-click="borrarProducto()">Eliminar</button>
                        </div>
                    </div>
                </div>
            </div> 

            <!-- Modal de detalle domicilio -->
            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">#1 - Pepito Pérez</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <div class="container-pedido">
                                <p><strong>Cliente: </strong>Pepito Pérez</p>
                                <strong>Descripción del pedido:</strong>
                                <table class="table">
                                    <thead class="table-secondary">
                                        <tr>
                                            <th scope="col">Ítem</th>
                                            <th scope="col">Cantidad</th>
                                            <th scope="col">Subtotal</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <th scope="row">Sopa mondongo</th>
                                            <td>1</td>
                                            <td>$5.000</td>
                                        </tr>
                                        <tr>
                                            <th scope="row">Arroz con pollo</th>
                                            <td>2</td>
                                            <td>$16.000</td>
                                        </tr>
                                        <tr>
                                            <th scope="row">Limonada</th>
                                            <td>2</td>
                                            <td>$7.000</td>
                                        </tr>
                                    </tbody>
                                </table>
                                <p><strong>Total:</strong> $28.000</p>
                                <label for="estado"><strong>Estado:</strong></label>
                                <select id="estado" class="form-select">
                                    <option selected>Indica el estado del domicilio</option>
                                    <option value="1">Por responder</option>
                                    <option value="2">Despachado</option>
                                    <option value="3">Aceptado</option>
                                    <option value="4">En preparación</option>
                                </select>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                            <button type="button" class="btn btn-primary">Actualizar estado</button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Modal de añadir producto -->
            <div class="modal fade" id="modalAddProducto" tabindex="-1" aria-labelledby="modalAddProductoLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="modalAddProductoLabel">Añadir nuevo producto</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <div class="container-pedido">
                                <div class="row">
                                    <div class="col-md-3 justify-content-center text-center" style="margin-left: 20px;">
                                        <img src="img/default.jpg" class="img-thumbnail mt-5" alt="...">
                                        <small><strong>Carga una imagen de tu producto</strong></small>
                                        <label class="custom-file-upload">
                                            <input type="file"/>
                                            Subir archivo
                                        </label>
                                    </div>
                                    <div class="col-md-1"></div>
                                    <div class="col-md-7">
                                        <form role="form" method="post" action="">
                                            <fieldset>              
                                                <div class="mb-3">
                                                    <label for="producto" class="form-label">idProducto:</label>
                                                    <input type="number" name="producto" id="idProducto" class="form-control input-lg" ng-model ="idProducto">
                                                </div>
                                                <div class="mb-3">
                                                    <label for="descripcion" class="form-label">Nombre:</label>
                                                    <input type="text" name="producto" id="idProducto" class="form-control input-lg" ng-model ="nombre">
                                                </div>
                                                <div class="mb-3">
                                                    <label for="costo" class="form-label">Precio de Venta ($):</label>
                                                    <input type="number" name="costo" id="venta" class="form-control input-lg" ng-model ="precioDeVenta">
                                                </div>
                                                <div class="mb-3">
                                                    <label for="venta" class="form-label">Precio de Costo ($):</label>
                                                    <input type="number" name="venta" id="costo" class="form-control input-lg" ng-model ="precioDeCompra">
                                                </div>
                                                <div class="mb-3">
                                                    <label for="stock" class="form-label">Stock disponible:</label>
                                                    <input type="number" name="stock" id="stock" class="form-control input-lg"ng-model ="stock">
                                                </div>
                                                <div class="mb-3">
                                                    <label for="descuento" class="form-label">Porcentaje de descuento (%):</label>
                                                    <input type="number" name="descuento" id="descuento" class="form-control input-lg" ng-model ="descuento">
                                                </div>
                                            </fieldset>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                            <button type="button" class="btn btn-primary" data-bs-dismiss="modal" ng-click="guardarProducto()">Guardar</button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Modal de actualizar producto -->
            <div class="modal fade" id="modalActualizarProducto" tabindex="-1" aria-labelledby="modalProductoLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="modalProductoLabel">Actualizar Producto</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <div class="container-pedido">
                                <div class="row">
                                    <div class="col-md-1"></div>
                                    <div class="col-md-7-actualizar">
                                        <form role="form" method="post" action="">
                                            <fieldset>              
                                                <div class="mb-3">
                                                    <label for="producto" class="form-label">idProducto:</label>
                                                    <input type="number" name="producto" id="idProducto" class="form-control input-lg" ng-model ="idProducto" ng-disabled="actualizar">
                                                </div>
                                                <div class="mb-3">
                                                    <label for="descripcion" class="form-label">Nombre:</label>
                                                    <input type="text" name="producto" id="idProducto" class="form-control input-lg" ng-model ="nombre">
                                                </div>
                                                <div class="mb-3">
                                                    <label for="costo" class="form-label">Precio de Venta ($):</label>
                                                    <input type="number" name="costo" id="venta" class="form-control input-lg" ng-model ="precioDeVenta">
                                                </div>
                                                <div class="mb-3">
                                                    <label for="venta" class="form-label">Precio de Costo ($):</label>
                                                    <input type="number" name="venta" id="costo" class="form-control input-lg" ng-model ="precioDeCompra">
                                                </div>
                                                <div class="mb-3">
                                                    <label for="stock" class="form-label">Stock disponible:</label>
                                                    <input type="number" name="stock" id="stock" class="form-control input-lg"ng-model ="stock">
                                                </div>
                                                <div class="mb-3">
                                                    <label for="descuento" class="form-label">Porcentaje de descuento (%):</label>
                                                    <input type="number" name="descuento" id="descuento" class="form-control input-lg" ng-model ="descuento">
                                                </div>
                                            </fieldset>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                            <button type="button" class="btn btn-primary" data-bs-dismiss="modal" ng-click="actualizarProducto()" ng-show="actualizar">Actualizar</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>



        <footer>
            <p class="text-center">
                <small> Desarrollado por Grupo 1 - Misión TIC Copyright © 2021 </small>
            </p>
        </footer>
    </body>
</body>
<script src="ctrllo-Productos.js"></script>
</html>
