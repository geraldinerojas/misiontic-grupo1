var app = angular.module('domicilios', []);

app.controller('controladorProductos', function ($scope, $http) {

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
                    alert('Guardado Exitoso');
                    $scope.listarProducto();
                } else {
                    alert('Error al guardar en la BD');
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
            $scope.productos = respuesta.data.Productos;
            console.log($scope.productos);
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
                alert('Producto eliminado exitosamente');
                $scope.listarProducto();
            } else {
                alert('Error al eliminar Producto');
            }

        });

    };

    $scope.actualizarProducto= function () {
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
                alert('Actualización exitosa');
                $scope.listarProducto();
            } else {
                alert('No se pudo actualizar');
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
