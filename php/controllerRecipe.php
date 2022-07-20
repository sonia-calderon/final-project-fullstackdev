<?php

    include "classConexion.php";
    include "classRecipe.php";

    $conex = new Conexion();
    $recipe = new Recipe();
    // ejecutar método para extraer la información de las recetas
    $recipe->selectRecipe($conex);
    $listado = $recipe->selectRecipe($conex);
    echo json_encode($listado);

?>