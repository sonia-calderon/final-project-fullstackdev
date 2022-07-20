<?php

    include "classConexion.php";
    include "classProduct.php";

    $conex = new Conexion();
    $product = new Product();
    // ejecutar método para extraer la información de los productos
    $listado = $product->selectProduct($conex);
    echo json_encode($listado);

?>