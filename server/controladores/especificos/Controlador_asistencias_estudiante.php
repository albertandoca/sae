<?php
include_once('../controladores/Controlador_Base.php');
include_once('../entidades/CRUD/Asistencia.php');
date_default_timezone_set("America/Lima");
class Controlador_asistencias_estudiante extends Controlador_Base
{
   function leer($args)
   {        
        $idAsignatura = $args["idAsignatura"];
        $idPeriodoLectivo = $args["idPeriodoLectivo"];
        $idParalelo = $args["idParalelo"];
        $fecha = $args["fecha"];
        $horas = $args["horas"];    

        $sql = "SELECT Persona.id AS idPersona, SUM(Asistencia.horas) AS totalHoras FROM Asistencia
                INNER JOIN MatriculaAsignatura ON MatriculaAsignatura.id = Asistencia.idMatriculaAsignatura
                INNER JOIN Matricula ON Matricula.id = MatriculaAsignatura.idMatricula
                INNER JOIN Persona ON Persona.id = Matricula.idPersona
                WHERE MatriculaAsignatura.idAsignatura = ? AND  MatriculaAsignatura.idParalelo = ? AND Matricula.idPeriodoLectivo = ?
                GROUP BY Persona.id
                ORDER BY apellido1, Persona.Apellido2, Persona.Nombre1, Persona.nombre2;";
        $parametros = array($idAsignatura, $idParalelo, $idPeriodoLectivo);
        $respuesta1 = $this->conexion->ejecutarConsulta($sql, $parametros);
        
        if ($respuesta1[0] == 0) {
            $sql = "SELECT Persona.id AS idPersona, 0 AS totalHoras, Persona.correoElectronicoInstitucional AS mailEstudiante, 0 AS idAsistencia,
                    MatriculaAsignatura.id AS idMatriculaAsignatura, MatriculaAsignatura.idAsignatura, MatriculaAsignatura.idParalelo,
                    CONCAT(Persona.apellido1, \" \", Persona.apellido2, \" \", Persona.nombre1, \" \", Persona.nombre2) AS nombre,
                    ? AS fecha, ? AS horas FROM MatriculaAsignatura
                    INNER JOIN (Matricula INNER JOIN Persona ON Matricula.idPersona = Persona.id) ON Matricula.id = MatriculaAsignatura.idMatricula
                    WHERE MatriculaAsignatura.idAsignatura = ? AND  MatriculaAsignatura.idParalelo = ? AND Matricula.idPeriodoLectivo = ?
                    ORDER BY nombre;";
            $parametros = array($fecha, $horas, $idAsignatura, $idParalelo, $idPeriodoLectivo);
            $respuesta = $this->conexion->ejecutarConsulta($sql, $parametros);
            
        } else {
            $sql = "SELECT Persona.id AS idPersona, Persona.correoElectronicoInstitucional AS mailEstudiante, Asistencia.id AS idAsistencia,
                        Asistencia.idMatriculaAsignatura, MatriculaAsignatura.idAsignatura, MatriculaAsignatura.idParalelo,
                        CONCAT(Persona.apellido1, \" \", Persona.apellido2, \" \", Persona.nombre1, \" \", Persona.nombre2) AS nombre,
                        Asistencia.fecha, Asistencia.horas AS horas FROM Asistencia
                        INNER JOIN (MatriculaAsignatura INNER JOIN (Matricula INNER JOIN Persona ON Matricula.idPersona = Persona.id)
                        ON Matricula.id = MatriculaAsignatura.idMatricula ) 
                        ON MatriculaAsignatura.id = Asistencia.idMatriculaAsignatura
                        WHERE MatriculaAsignatura.idAsignatura = ? AND  MatriculaAsignatura.idParalelo = ? AND Matricula.idPeriodoLectivo = ? AND Asistencia.fecha = ?
                        ORDER BY nombre;";
            $parametros = array($idAsignatura, $idParalelo, $idPeriodoLectivo, $fecha);
            $respuesta2 = $this->conexion->ejecutarConsulta($sql, $parametros);
            
            if ($respuesta2[0] == 0) {
                $sql = "SELECT Persona.id AS idPersona, Persona.correoElectronicoInstitucional AS mailEstudiante, 0 AS idAsistencia, 
                    MatriculaAsignatura.id AS idMatriculaAsignatura, MatriculaAsignatura.idAsignatura, MatriculaAsignatura.idParalelo,
                    CONCAT(Persona.apellido1, \" \", Persona.apellido2, \" \", Persona.nombre1, \" \", Persona.nombre2) AS nombre,
                    ? AS fecha, ? AS horas FROM MatriculaAsignatura
                    INNER JOIN (Matricula INNER JOIN Persona ON Matricula.idPersona = Persona.id) ON Matricula.id = MatriculaAsignatura.idMatricula
                    WHERE MatriculaAsignatura.idAsignatura = ? AND  MatriculaAsignatura.idParalelo = ? AND Matricula.idPeriodoLectivo = ?
                    ORDER BY nombre;";
                $parametros = array($fecha, $horas, $idAsignatura, $idParalelo, $idPeriodoLectivo);
                $respuesta2 = $this->conexion->ejecutarConsulta($sql, $parametros);
            }
            $i = 0;
            $respuesta = [];
            foreach ($respuesta2 as $row) {
                $respuesta[] = array_merge($respuesta1[$i],$row);
                $i++;
            }
        }   
        return $respuesta;
   }
   
   function leer_horas_dia($args)
   {
        $idDocenteAsignatura = $args["idDocenteAsignatura"];    
        $fecha = $args["fecha"];
        $dia = date('l', strtotime($fecha));
        switch($dia){
            case "Monday":
                $dia = 1;
                break;
            case "Tuesday":
                $dia = 2;
                break;
            case "Wednesday":
                $dia = 3;
                break;
            case "Thursday":
                $dia = 4;
                break;
            case "Friday":
                $dia = 5;
                break;
            case "Saturday":
                $dia = 6;
                break;
            case "Sunday":
                $dia = 7;
                break;            
        }

        $sql = "SELECT SUM(numeroHoras) AS horas FROM HorasClaseDia
            WHERE idDocenteAsignatura = ? AND idDiaSemana = ?;";
        $parametros = array($idDocenteAsignatura, $dia);
        $respuesta = $this->conexion->ejecutarConsulta($sql, $parametros);
        if(is_null($respuesta[0])){
            $respuesta[0] = 0;
        } 
        return $respuesta;
   } 

   function leer_fecha_hoy($args) 
   {
        $fecha = date("Y-m-d H:i:s");
        return $fecha;
   }

   /*function crear($args)
   {
        $idMatriculaAsignatura = $args["idMatriculaAsignatura"];
        $fecha = $args["fecha"];
        $horas = $args["horas"];
        $sql = "INSERT INTO Asistencia (idMatriculaAsignatura, fecha, horas) VALUES (?, ?, ?);";
        $parametros = array($idMatriculaAsignatura, $fecha, $horas);
        $respuesta = $this->conexion->ejecutarConsulta($sql,$parametros);
        if(is_null($respuesta[0])){
            return true;
        } else {
            return false;
        }
   }*/

   function crear($args)
   {
        //$asistenciaDia = new Asistencia();

        $asistenciaDia = $args;
                   
        $sql = "INSERT INTO Asistencia (idMatriculaAsignatura, fecha, horas) VALUES ";
        $parametros = [];
        for ($i = 0; $i < (count($asistenciaDia)-1); $i++) {
            $sql = $sql . "(?, ?, ?), ";
            $parametros[] = $asistenciaDia[$i]["idMatriculaAsignatura"];
            $parametros[] = $asistenciaDia[$i]["fecha"];
            $parametros[] = $asistenciaDia[$i]["horas"];           
        }
        $sql = $sql . "(?, ?, ?);";
        $parametros[] = $array[count($array)-1]["idMatriculaAsignatura"];
        $parametros[] = $array[count($array)-1]["fecha"];
        $parametros[] = $array[count($array)-1]["horas"];         
        $respuesta = $this->conexion->ejecutarConsulta($sql,$parametros);
        
        if(is_null($respuesta[0])){
            return true;
        } else {
            return false;
        }
   }

   function actualizar($args)
   {
        $asistenciaDia = $args["asistenciaDia"];
        $array = json_decode($asistenciaDia);
        $sql = "UPDATE Asistencia SET horas = ? WHERE id = ? ";
        $parametros = [];
        for ($i = 0; $i < count($array); $i++) {
            $parametros[] = $array[$i]->id;
            $parametros[] = $array[$i]->horas;     
            $respuesta = $this->conexion->ejecutarConsulta($sql,$parametros);      
        }        
        if(is_null($respuesta[0])){
            return true;
        } else {
            return false;
        }
   }
}