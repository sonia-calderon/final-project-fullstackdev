<?php

    // conexión con la BD herendando de la clase PDO
    class Conexion extends PDO{
        private $host = "localhost";
        private $db = "realfoodmarket";
        private $user = "root";
        private $pass = "";
        private $type = "mysql";

        public function __construct(){
            try{
                parent:: __construct("$this->type:dbname=$this->db;host=$this->host",$this->user, $this->pass);
            }
            catch(PDOExeption $e){
                echo "no se ha conectado". $e->getMessage();
            }
        }
    }

?>