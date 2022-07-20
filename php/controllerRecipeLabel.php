<?php

    include "classConexion.php";
    include "classRecipe.php";

    $conex = new Conexion();
    $recipe = new Recipe();
    // ejecutar método para extraer la información de las etiquetas de las recetas
    $recipe->selectRecipeLabel($conex);
    $list = $recipe->selectRecipeLabel($conex);
    echo json_encode($list);

?>