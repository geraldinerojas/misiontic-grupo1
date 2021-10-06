var app = angular.module('domicilios', []);

app.controller('controladorProductos', function ($scope, $http) {

    var alertPlaceholder = document.getElementById('alertaEliminar');
    alertPlaceholder = document.getElementById('alertaActualizar');
    alertPlaceholder = document.getElementById('alertaGuardar');
    alertPlaceholder = document.getElementById('alertaNoEliminar');
    alertPlaceholder = document.getElementById('alertaNoActualizar');
    alertPlaceholder = document.getElementById('alertaNoGuardar');
    alertPlaceholder = document.getElementById('alertaNoListar');

    function alertaDelete(message, type) {
        var wrapper = document.createElement('div');
        wrapper.innerHTML = '<div class="alert alert-' + type + ' alert-dismissible" role="alert">' + message + '<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>';

        alertPlaceholder.append(wrapper);
    }

    function alertaUpdate(message, type) {
        var wrapper = document.createElement('div');
        wrapper.innerHTML = '<div class="alert alert-' + type + ' alert-dismissible" role="alert">' + message + '<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>';

        alertPlaceholder.append(wrapper);
    }

    function alertaSave(message, type) {
        var wrapper = document.createElement('div');
        wrapper.innerHTML = '<div class="alert alert-' + type + ' alert-dismissible" role="alert">' + message + '<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>';

        alertPlaceholder.append(wrapper);
    }
    
     function alertaNoDelete(message, type) {
        var wrapper = document.createElement('div');
        wrapper.innerHTML = '<div class="alert alert-' + type + ' alert-dismissible" role="alert">' + message + '<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>';

        alertPlaceholder.append(wrapper);
    }

    function alertaNoUpdate(message, type) {
        var wrapper = document.createElement('div');
        wrapper.innerHTML = '<div class="alert alert-' + type + ' alert-dismissible" role="alert">' + message + '<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>';

        alertPlaceholder.append(wrapper);
    }

    function alertaNoSave(message, type) {
        var wrapper = document.createElement('div');
        wrapper.innerHTML = '<div class="alert alert-' + type + ' alert-dismissible" role="alert">' + message + '<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>';

        alertPlaceholder.append(wrapper);
    }

    function alertaNoShow(message, type) {
        var wrapper = document.createElement('div');
        wrapper.innerHTML = '<div class="alert alert-' + type + ' alert-dismissible" role="alert">' + message + '<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>';

        alertPlaceholder.append(wrapper);
    }

    $scope.guardarProducto = function () {

        if ($scope.idProducto === undefined || $scope.nombre === undefined) {
            alert('Todos los campos son obligatorios');
        } else {
            console.log('Entra a guardarProducto');
            let producto = {
                proceso: 'guardarProducto',
                idProducto: $scope.idProducto,
                nombre: $scope.nombre,
                precioDeVenta: $scope.precioDeVenta,
                precioDeCompra: $scope.precioDeCompra,
                stock: $scope.stock,
                descuento: $scope.descuento
            };

            $http({
                method: 'POST',
                url: 'peticionesProducto.jsp',
                params: producto
            }).then(function (respuesta) {
                console.log(respuesta);
                if (respuesta.data.guardarProducto) {
                    alertaSave('Producto guardado exitosamente!', 'success');
                    $scope.listarProducto();
                } else {
                    alertaNoSave('Los productos no se pueden guardar!', 'danger');
                }
            });
        }
    };

    $scope.listarProducto = function () {
        let params = {
            proceso: 'listarProducto'
        };

        $http({
            method: 'GET',
            url: 'peticionesProducto.jsp',
            params: params
        }).then(function (respuesta) {
            if(respuesta.data.listarProducto){
                $scope.productos = respuesta.data.Productos;
            } else {
                alertaNoShow('Los productos no se pueden mostrar!', 'danger');
            }
        });
    };

    $scope.borrarProducto = function () {
        console.log($scope.idProductoEliminar);
        let params = {
            proceso: 'borrarProducto',
            idProducto: $scope.idProductoEliminar
        };
        $http({
            method: 'GET',
            url: 'peticionesProducto.jsp',
            params: params
        }).then(function (respuesta) {
            if (respuesta.data.borrarProducto) {
                alertaDelete('Producto eliminado exitosamente!', 'success');
                $scope.listarProducto();
            } else {
                alertaNoDelete('Los productos no se pueden borrar!', 'danger');
            }

        });

    };

    $scope.actualizarProducto = function () {
        console.log($scope.idProductoActualizar);
        let params = {
            proceso: 'actualizarProducto',
            idProducto: $scope.idProductoActualizar,
            nombre: $scope.nombre,
            precioDeVenta: $scope.precioDeVenta,
            precioDeCompra: $scope.precioDeCompra,
            stock: $scope.stock,
            descuento: $scope.descuento
        };

        $http({
            method: 'GET',
            url: 'peticionesProducto.jsp',
            params: params
        }).then(function (respuesta) {
            if (respuesta.data.actualizarProducto) {
                alertaUpdate('Producto actualizado exitosamente!', 'success');
                $scope.listarProducto();
            } else {
                alertaNoUpdate('Los productos no se pueden actualizar!', 'danger');
            }
            console.log(respuesta);
        });
    };

    $scope.mostrarFormActualizar = function (producto) {
        $scope.mostrarListaProductos = false;
        $scope.actualizar = true;
        $scope.idProducto = producto.idProducto;
        $scope.nombre = producto.nombre;
        $scope.precioDeVenta = producto.precioDeVenta;
        $scope.precioDeCompra = producto.precioDeCompra;
        $scope.stock = producto.stock;
        $scope.descuento = producto.descuento;
    };



    $scope.abrirModalEliminar = function (idProducto) {

        console.log("Entro al metodo!");
        $scope.idProductoEliminar = idProducto;
        var myModalEliminar = new bootstrap.Modal(document.getElementById('modalEliminarProducto'), {
            keyboard: false
        });
        myModalEliminar.show();
    };

    $scope.abrirModalActualizar = function (idProducto) {

        console.log("Entro al metodo!");
        $scope.idProductoActualizar = idProducto;
        var myModalActualizar = new bootstrap.Modal(document.getElementById('modalActualizarProducto'), {
            keyboard: false
        });
        myModalActualizar.show();
    };
});
