<?php
class TipoSangre
{
   public $id;
   public $descripcion;

   function __construct(int $id,string $descripcion){
      $this->id = $id;
      $this->descripcion = $descripcion;
   }
}
?>