<?php
include_once('../controladores/Controlador_Base.php');
date_default_timezone_set("America/Lima");

class Controlador_silabo_pd extends Controlador_Base
{
   function periodos($args)
   {        
        $idAsignatura = $args["idAsignatura"];
        $idComponentePd = $args["idComponentePd"];
        $sql = "SELECT PortafolioDocente.id AS idPortafolioDocente, PeriodoLectivo.id AS idPeridoLectivo,
                PeriodoLectivo.descripcion, EstadoComponentePd.estadoComponente, EstadoComponentePd.id AS idEstadoComponentePd
                FROM PortafolioDocente
                INNER JOIN PeriodoLectivo ON PeriodoLectivo.id = PortafolioDocente.idPeriodoLectivo
                INNER JOIN EstadoComponentePd ON EstadoComponentePd.id = PortafolioDocente.idEstadoComponentePd
                WHERE PortafolioDocente.idAsignatura = ? AND PortafolioDocente.idComponentePd = ?
                ORDER BY PeriodoLectivo.id DESC;";
        $parametros = array($idAsignatura, $idComponentePd);
        $respuesta = $this->conexion->ejecutarConsulta($sql, $parametros);
        if(is_null($respuesta[0])){
            $respuesta[0] = 0;
        } 
        return $respuesta;
   }
   
   function co_requisitos($args)
   {        
        $idAsignatura = $args["idAsignatura"];
        $sql = "SELECT Asignatura.nombre, Asignatura.codigo FROM Asignatura
        INNER JOIN AsignaturaCorequisito ON AsignaturaCorequisito.idAsignaturaCorequisito = Asignatura.id
        WHERE AsignaturaCorequisito.idAsignatura = ?;";
        $parametros = array($idAsignatura);
        $respuesta = $this->conexion->ejecutarConsulta($sql, $parametros);
        return $respuesta;
   } 

   function pre_requisitos($args)
   {        
        $idAsignatura = $args["idAsignatura"];
        $sql = "SELECT Asignatura.nombre, Asignatura.codigo FROM Asignatura
        INNER JOIN AsignaturaPrerequisito ON AsignaturaPrerequisito.idAsignaturaPrerequisito = Asignatura.id
        WHERE AsignaturaPrerequisito.idAsignatura = ?;";
        $parametros = array($idAsignatura);
        $respuesta = $this->conexion->ejecutarConsulta($sql, $parametros);
        return $respuesta; 
   } 
}
