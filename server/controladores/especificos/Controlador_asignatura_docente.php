<?php
include_once('../controladores/Controlador_Base.php');
//include_once('../entidades/especificos/AsignaturaDocente.php');
class Controlador_asignatura_docente extends Controlador_Base
{
   function leer($args)
   { 
       $idPersona = $args["idPersona"];
       $idPeriodoLectivo = $args["idPeriodoLectivo"];
        $sql = "SELECT DocenteAsignatura.id AS idDocenteAsignatura, Asignatura.id AS idAsignatura, DocenteAsignatura.idParalelo, 
                CONCAT(Asignatura.nombre, \"    Paralelo: \", Paralelo.descripcion) as nombre 
                FROM DocenteAsignatura 
                INNER JOIN (Docente INNER JOIN Persona ON Persona.id = Docente.idPersona) ON Docente.id = DocenteAsignatura.idDocente
                INNER JOIN (Asignatura INNER JOIN Malla ON Malla.id = Asignatura.idMalla) ON Asignatura.id = DocenteAsignatura.idAsignatura
                INNER JOIN Paralelo ON Paralelo.id = DocenteAsignatura.idParalelo
                WHERE Persona.id = ? AND DocenteAsignatura.idPeriodoLectivo = ?
                ORDER BY Asignatura.nombre, Paralelo.descripcion;";
        $parametros = array($idPersona, $idPeriodoLectivo);
        $respuesta = $this->conexion->ejecutarConsulta($sql, $parametros);
        return $respuesta;
   }

   function carreras($args) 
   {
        $idPersona = $args["idPersona"];
        $idPeriodoLectivo = $args["idPeriodoLectivo"];

        $sql = "SELECT Carrera.id, Carrera.resolucion, Carrera.nombre, Carrera.descripcion,
                Modalidad.descripcion AS modalidad, Instituto.descripcion AS instituto, Carrera.siglas FROM Carrera
                INNER JOIN Malla ON Malla.idCarrera = Carrera.id
                INNER JOIN Asignatura ON Asignatura.idMalla = Malla.id
                INNER JOIN DocenteAsignatura ON  DocenteAsignatura.idAsignatura = Asignatura.id
                INNER JOIN Docente ON Docente.id = DocenteAsignatura.idDocente
                INNER JOIN Persona ON Persona.id = Docente.idPersona
                INNER JOIN Modalidad ON Modalidad.id = Carrera.idModalidad
                INNER JOIN Instituto ON Instituto.id = Carrera.idInstituto
                WHERE Persona.id = ? AND DocenteAsignatura.idPeriodoLectivo = ?
                GROUP BY Carrera.id
                ORDER BY Carrera.Nombre;";
        $parametros = array($idPersona, $idPeriodoLectivo);
        $respuesta = $this->conexion->ejecutarConsulta($sql, $parametros);
        return $respuesta;
   }

   function asignaturas($args) 
   {
        $idPersona = $args["idPersona"];
        $idPeriodoLectivo = $args["idPeriodoLectivo"];
        $idCarrera = $args["idCarrera"];

        $sql = "SELECT Asignatura.id, YEAR(Malla.fechaMallaInicio) AS malla, Asignatura.codigo, Asignatura.nombre,
                PeriodoAcademico.descripcion  AS periodoAcademicoDescripcion, Asignatura.horasPractica, Asignatura.horasDocente,
                Asignatura.horasAutonomas, Asignatura.credito, UnidadOrganizacion.descripcion AS unidadOrganizacion, CampoFormacion.descripcion AS campoFormacion
                FROM Asignatura
                INNER JOIN Malla ON Malla.id = Asignatura.idMalla
                INNER JOIN Carrera ON Carrera.id = Malla.idCarrera
                INNER JOIN DocenteAsignatura ON  DocenteAsignatura.idAsignatura = Asignatura.id
                INNER JOIN Docente ON Docente.id = DocenteAsignatura.idDocente
                INNER JOIN Persona ON Persona.id = Docente.idPersona
                INNER JOIN UnidadOrganizacion ON UnidadOrganizacion.id = Asignatura.idUnidadOrganizacion
                INNER JOIN CampoFormacion ON CampoFormacion.id = Asignatura.idCampoFormacion
                INNER JOIN PeriodoAcademico ON PeriodoAcademico.id = Asignatura.idPeriodoAcademico
                WHERE Persona.id = ? AND DocenteAsignatura.idPeriodoLectivo = ? AND Carrera.id = ?
                GROUP BY Asignatura.id
                ORDER BY Asignatura.nombre;";
        $parametros = array($idPersona, $idPeriodoLectivo, $idCarrera);
        $respuesta = $this->conexion->ejecutarConsulta($sql, $parametros);
        return $respuesta;
   }
}

