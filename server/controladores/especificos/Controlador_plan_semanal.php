<?php
include_once('../controladores/Controlador_Base.php');
date_default_timezone_set("America/Lima");

class Controlador_plan_semanal extends Controlador_Base
{
   function getTemas($args)
   {        
        $idAsignatura = $args["idAsignatura"];
        $idPeriodoLectivo = $args["idPeriodoLectivo"];
        $sql = "SELECT SilaboElementos.objeto FROM SilaboElementos
                INNER JOIN SilaboUnidades ON SilaboUnidades.id = SilaboElementos.idSilaboUnidades
                INNER JOIN Silabo ON Silabo.id = SilaboUnidades.idSilabo
                WHERE Silabo.idAsignatura = ? AND Silabo.idPeriodoLectivo = ?;";
        $parametros = array($idAsignatura, $idPeriodoLectivo);
        $respuesta = $this->conexion->ejecutarConsulta($sql, $parametros);
        if(is_null($respuesta[0])){
            $respuesta[0] = 0;
        } 
        return $respuesta;
   }
   
   function getMetodologia($args)
   {        
        $sql = "SELECT Metodologia.estrategia, RecursosDidacticos.material, RecursosDidacticos.tipoMaterial from Silabo
                INNER JOIN SilaboMetodologia ON SilaboMetodologia.idSilabo = Silabo.id
                INNER JOIN SilaboRecursoDidactico ON SilaboRecursoDidactico.idSilabo = Silabo.id
                INNER JOIN Metodologia ON Metodologia.id = SilaboMetodologia.idMetodologia
                INNER JOIN RecursosDidacticos ON RecursosDidacticos.id = SilaboRecursoDidactico.idRecursoDidactico";
        $respuesta = $this->conexion->ejecutarConsulta($sql, $parametros);
        return $respuesta;
   } 

   function get_objetivos($args)
   {        
        $idPeriodoLectivo = $args["idPeriodoLectivo"];
        $idAsignatura = $args["idAsignatura"];
        $sql = "SELECT Silabo.objetivoParte1, Silabo.objetivoParte2, Silabo.objetivoParte3, Silabo.objetivoParte4 From Silabo
        WHERE Silabo.idPeriodoLectivo = ? AND Silabo.idAsignatura = ?;";
        $parametros = array($idPeriodoLectivo, $idAsignatura);
        $respuesta = $this->conexion->ejecutarConsulta($sql, $parametros);
        return $respuesta; 
   } 

   function getPeriodos($args)
   {        
        $idAsignatura = $args["idAsignatura"];
        $sql = "SELECT PeriodoAcademico.descripcion AS PeriodoAcademico, PeriodoLectivo.descripcion AS PeriodoLectivo FROM PeriodoLectivo
                INNER JOIN Silabo ON Silabo.idPeriodoLectivo = PeriodoLectivo.id
                INNER JOIN Asignatura ON Asignatura.id = Silabo.idAsignatura
                INNER JOIN PeriodoAcademico ON PeriodoAcademico.id = Asignatura.idPeriodoAcademico
                WHERE Asignatura.id = ?;";
        $parametros = array($idAsignatura);
        $respuesta = $this->conexion->ejecutarConsulta($sql, $parametros);
        return $respuesta; 
   }
}