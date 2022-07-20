<?php

class Recipe{
    // método para extraer todos los campos de la tabla receta
    public function selectRecipe($conex){
        $select = $conex->prepare("SELECT * FROM receta");
        $select->execute();
        $listado = $select->fetchAll();
        return $listado;
    }

    // método para extraer las etiquetas asociadas a las recetas
    public function selectRecipeLabel($conex){
        $select = $conex->prepare("SELECT fkReceta, etiqueta FROM recetaetiqueta LEFT JOIN etiqueta ON recetaetiqueta.fkEtiqueta = etiqueta.idEtiqueta");
        $select->execute();
        $listado = $select->fetchAll();
        return $listado;
    }
}

?>