<?php
include_once('../controladores/Controlador_Base.php');
date_default_timezone_set("America/Lima");

class Controlador_silabo_pd extends Controlador_Base
{
   function periodos($args)
   {        
        $idAsignatura = $args["idAsignatura"];
        $idComponentePd = $args["idComponentePd"];
        $idPersona = $args["idPersona"];
        $sql = "SELECT PortafolioDocenteResumen.id AS idPortafolioDocenteResumen, PeriodoLectivo.id AS idPeriodoLectivo,
                PeriodoLectivo.descripcion, EstadoComponentePd.estadoComponente, EstadoComponentePd.id AS idEstadoComponentePd,
                PortafolioDocenteResumen.idPersona
                FROM PortafolioDocenteResumen
                INNER JOIN PeriodoLectivo ON PeriodoLectivo.id = PortafolioDocenteResumen.idPeriodoLectivo
                INNER JOIN EstadoComponentePd ON EstadoComponentePd.id = PortafolioDocenteResumen.idEstadoComponentePd
                WHERE PortafolioDocenteResumen.idAsignatura = ? AND PortafolioDocenteResumen.idComponentePd = ? AND PortafolioDocenteResumen.idPersona = ?
                ORDER BY PeriodoLectivo.id DESC;";
        $parametros = array($idAsignatura, $idComponentePd, $idPersona);
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

   function crear_portafolio_docente_resumen($args)
   {
       $resumen = $args;
       $sql = "INSERT INTO PortafolioDocenteResumen (idComponentePd, idAsignatura, idEstadoComponentePd, idPeriodoLectivo, idPersona) VALUES (?,?,?,?,?);";
       $parametros = array($resumen["idComponentePd"], $resumen["idAsignatura"], $resumen["idEstadoComponentePd"], $resumen["idPeriodoLectivo"], $resumen["idPersona"]);
       $respuesta = $this->conexion->ejecutarConsulta($sql, $parametros);
   }

   function get_id_portafolio_docente_resumen($args)
   {
       $idAsignatura = $args["idAsignatura"];
       $idPeriodoLectivo =$args["idPeriodoLectivo"];
       $idPersona =$args["idPersona"];
       $sql = "SELECT id FROM PortafolioDocenteResumen WHERE idAsignatura = ? AND idPeriodoLectivo = ? AND idPersona = ?;";
       $parametros = array($idAsignatura, $idPeriodoLectivo, $idPersona);
       $respuesta = $this->conexion->ejecutarConsulta($sql, $parametros);
       $respuesta = $respuesta[0]["id"];
       return $respuesta;

   }

   function crear_silabo($args)
   {
       $silabo = $args;
       $sql = "INSERT INTO Silabo (idAsignatura, idPeriodoLectivo, descripcion, objetivoparte1,
       objetivoparte2, objetivoparte3, objetivoparte4, codigo, idPortafolioDocenteResumen)
       VALUES (?,?,?,?,?,?,?,?,?);";
       $parametros = array($silabo["idAsignatura"], $silabo["idPeriodoLectivo"], $silabo["descripcion"], 
       $silabo["objetivoParte1"], $silabo["objetivoParte2"], $silabo["objetivoParte3"], 
       $silabo["objetivoParte4"], $silabo["codigo"], $silabo["idPortafolioDocenteResumen"]);
       $respuesta = $this->conexion->ejecutarConsulta($sql, $parametros);
    }


    function get_silabo($args)
   {
       $idPortafolioDocenteResumen= $args["idPortafolioDocenteResumen"];
       $sql = "SELECT * FROM Silabo WHERE idPortafolioDocenteResumen = ?;";
       $parametros = array($idPortafolioDocenteResumen);
       $respuesta = $this->conexion->ejecutarConsulta($sql, $parametros);
       return $respuesta;

   }

   function get_silabo_unidades($args)
   {
       $idSilabo= $args["idSilabo"];
       $sql = "SELECT SilaboUnidades.id, SilaboUnidades.idSilabo, SilaboUnidades.descripcion, 
                SilaboUnidades.codigo FROM SilaboUnidades INNER JOIN Silabo ON Silabo.id = SilaboUnidades.idSilabo
                WHERE SilaboUnidades.idSilabo = ?
                ORDER BY SilaboUnidades.idSilabo, SilaboUnidades.codigo;";
       $parametros = array($idSilabo);
       $respuesta = $this->conexion->ejecutarConsulta($sql, $parametros);
       return $respuesta;

   }

      
   function get_silabo_elementos($args)
   {
       $idSilabo= $args["idSilabo"];
       $sql = "SELECT SilaboElementos.id, SilaboElementos.idSilaboUnidades, SilaboElementos.verbo, SilaboElementos.objeto, SilaboElementos.condicion, SilaboElementos.finalidad, SilaboElementos.codigo FROM SilaboElementos
       INNER JOIN SilaboUnidades ON SilaboUnidades.id = SilaboElementos.idSilaboUnidades
       INNER JOIN Silabo ON Silabo.id = SilaboUnidades.idSilabo
       WHERE SilaboUnidades.idSilabo = ?
       ORDER BY SilaboElementos.idSilaboUnidades, SilaboElementos.codigo;";
       $parametros = array($idSilabo);
       $respuesta = $this->conexion->ejecutarConsulta($sql, $parametros);
       return $respuesta;

   }

   function get_silabo_resultados($args)
   {
       $idSilabo= $args["idSilabo"];
       $sql = "SELECT SilaboResultados.id, SilaboResultados.idSilaboElementos, SilaboResultados.verbo, SilaboResultados.objeto, SilaboResultados.condicion, SilaboResultados.finalidad, SilaboResultados.codigo FROM SilaboResultados
       INNER JOIN SilaboElementos ON SilaboElementos.id = SilaboResultados.idSilaboElementos
       INNER JOIN SilaboUnidades ON SilaboUnidades.id = SilaboElementos.idSilaboUnidades
       INNER JOIN Silabo ON Silabo.id = SilaboUnidades.idSilabo
       WHERE SilaboUnidades.idSilabo = ?
       ORDER BY SilaboResultados.idSilaboElementos, SilaboResultados.codigo;";
       $parametros = array($idSilabo);
       $respuesta = $this->conexion->ejecutarConsulta($sql, $parametros);
       return $respuesta;

   }

   function get_silabo_evidencias($args)
   {
       $idSilabo= $args["idSilabo"];
       $sql = "SELECT SilaboEvidenciasRa.id, SilaboEvidenciasRa.idSilaboResultados, SilaboEvidenciasRa.descripcion, SilaboEvidenciasRa.codigo FROM SilaboEvidenciasRa
       INNER JOIN SilaboResultados ON SilaboResultados.id = SilaboEvidenciasRa.idSilaboResultados
       INNER JOIN SilaboElementos ON SilaboElementos.id = SilaboResultados.idSilaboElementos
       INNER JOIN SilaboUnidades ON SilaboUnidades.id = SilaboElementos.idSilaboUnidades
       INNER JOIN Silabo ON Silabo.id = SilaboUnidades.idSilabo
       WHERE SilaboUnidades.idSilabo = ?
       ORDER BY SilaboEvidenciasRa.idSilaboResultados, SilaboEvidenciasRa.codigo;";
       $parametros = array($idSilabo);
       $respuesta = $this->conexion->ejecutarConsulta($sql, $parametros);
       return $respuesta;

   }

   function get_metodologia($args)
   {
       $idSilabo= $args["idSilabo"];
       $sql = "SELECT * FROM SilaboMetodologia WHERE idSilabo = ?;";
       $parametros = array($idSilabo);
       $respuesta = $this->conexion->ejecutarConsulta($sql, $parametros);
       return $respuesta;

   }

   function get_recurso_didactico($args)
   {
       $idSilabo= $args["idSilabo"];
       $sql = "SELECT * FROM SilaboRecursoDidactico WHERE idSilabo = ?;";
       $parametros = array($idSilabo);
       $respuesta = $this->conexion->ejecutarConsulta($sql, $parametros);
       return $respuesta;

   }

   function get_bibliografia($args)
   {
       $idSilabo= $args["idSilabo"];
       $sql = "SELECT * FROM SilaboBibliografia WHERE idSilabo = ?;";
       $parametros = array($idSilabo);
       $respuesta = $this->conexion->ejecutarConsulta($sql, $parametros);
       return $respuesta;

   }

   function crear_unidad($args)
   {
       $idSilabo= $args["idSilabo"];
       $descripcion= $args["descripcion"];
       $codigo= $args["codigo"];
       $sql = "INSERT INTO SilaboUnidades (idSilabo, descripcion, codigo) VALUES(?,?,?);";
       $parametros = array($idSilabo, $descripcion, $codigo);
       $respuesta = $this->conexion->ejecutarConsulta($sql, $parametros);
       return $respuesta;
   }

   function modificar_unidad($args)
   {
       $idSilaboUnidades= $args["idSilaboUnidades"];
       $descripcion= $args["descripcion"];
       $sql = "UPDATE SilaboUnidades SET descripcion = ? WHERE id = ?;";
       $parametros = array($descripcion, $idSilaboUnidades);
       $respuesta = $this->conexion->ejecutarConsulta($sql, $parametros);
       return $respuesta;
   }

   function eliminar_unidad($args)
   {
       $idSilaboUnidades= $args["idSilaboUnidades"];
       $sql = "DELETE FROM SilaboUnidades WHERE id = ?;";
       $parametros = array($idSilaboUnidades);
       $respuesta = $this->conexion->ejecutarConsulta($sql, $parametros);
       return $respuesta;
   }

   function modificar_unidad_codigo($args)
   {
       $idSilaboUnidades= $args["idSilaboUnidades"];
       $codigo= $args["codigo"];
       $sql = "UPDATE SilaboUnidades SET codigo = ? WHERE id = ?;";
       $parametros = array($codigo, $idSilaboUnidades);
       $respuesta = $this->conexion->ejecutarConsulta($sql, $parametros);
       return $respuesta;
   }

   function crear_elemento($args)
   {
        $idSilaboUnidades= $args["idSilaboUnidades"];
        $verbo= $args["verbo"];
        $objeto= $args["objeto"];
        $condicion= $args["condicion"];
        $finalidad= $args["finalidad"];
        $codigo= $args["codigo"];
       $sql = "INSERT INTO SilaboElementos (idSilaboUnidades, verbo, objeto, condicion, finalidad, codigo) VALUES (?,?,?,?,?,?);";
       $parametros = array($idSilaboUnidades, $verbo, $objeto, $condicion, $finalidad, $codigo);
       $respuesta = $this->conexion->ejecutarConsulta($sql, $parametros);
       return $respuesta;
   }

   function modificar_elemento($args)
   {
       $idSilaboElementos= $args["idSilaboElementos"];
       $verbo= $args["verbo"];
       $objeto= $args["objeto"];
       $condicion= $args["condicion"];
       $finalidad= $args["finalidad"];
       $codigo= $args["codigo"];
       $sql = "UPDATE SilaboElementos SET verbo = ?, objeto = ?, condicion = ?, finalidad = ? WHERE id = ?;";
       $parametros = array($verbo, $objeto, $condicion, $finalidad, $idSilaboElementos);
       $respuesta = $this->conexion->ejecutarConsulta($sql, $parametros);
       return $respuesta;
   }

   function eliminar_elemento($args)
   {
       $idSilabo= $args["idSilaboElementos"];
       $sql = "DELETE FROM SilaboElementos WHERE id = ?;";
       $parametros = array($idSilabo);
       $respuesta = $this->conexion->ejecutarConsulta($sql, $parametros);
       return $respuesta;
   }

   function crear_resultado($args)
   {
        $idSilaboElementos= $args["idSilaboElementos"];
        $verbo= $args["verbo"];
        $objeto= $args["objeto"];
        $condicion= $args["condicion"];
        $finalidad= $args["finalidad"];
        $codigo= $args["codigo"];
       $sql = "INSERT INTO SilaboResultados (idSilaboElementos, verbo, objeto, condicion, finalidad, codigo) VALUES (?,?,?,?,?,?);";
       $parametros = array($idSilaboElementos, $verbo, $objeto, $condicion, $finalidad, $codigo);
       $respuesta = $this->conexion->ejecutarConsulta($sql, $parametros);
       return $respuesta;
   }

   function modificar_resultado($args)
   {
       $idSilaboResultados= $args["idSilaboResultados"];
       $verbo= $args["verbo"];
       $objeto= $args["objeto"];
       $condicion= $args["condicion"];
       $finalidad= $args["finalidad"];
       $codigo= $args["codigo"];
       $sql = "UPDATE SilaboResultados SET verbo = ?, objeto = ?, condicion = ?, finalidad = ? WHERE id = ?;";
       $parametros = array($verbo, $objeto, $condicion, $finalidad, $idSilaboResultados);
       $respuesta = $this->conexion->ejecutarConsulta($sql, $parametros);
       return $respuesta;
   }

   function eliminar_resultado($args)
   {
       $idSilabo= $args["idSilaboResultados"];
       $sql = "DELETE FROM SilaboResultados WHERE id = ?;";
       $parametros = array($idSilabo);
       $respuesta = $this->conexion->ejecutarConsulta($sql, $parametros);
       return $respuesta;
   }
   
   
}
