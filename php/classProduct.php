<?php

class Product{
    // método para extraer todos los campos de la tabla producto
    public function selectProduct($conex){
        $select = $conex->prepare("SELECT * FROM producto");
        $select->execute();
        $listado = $select->fetchAll();
        return $listado;
    }
}

?>