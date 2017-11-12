<?php

include_once("../persistencia/AdministradorBaseDatos.php");
include_once("../config/Configuracion.php");

class ControladorBase
{
    public $conexion;
    
    function __construct(){
       $this->conexion = new AdministradorBaseDatos(NOMBRE_CONEXION);
    }

}