INSERT INTO `ignug`.`Docente` (`idPersona`, `fechaInicio`, `idEstado`) VALUES ('43', '2015-10-01', '1');
INSERT INTO `ignug`.`Docente` (`idPersona`, `fechaInicio`, `idEstado`) VALUES ('73', '2017-07-01', '1');

INSERT INTO `ignug`.`DocenteAsignatura` (`idDocente`, `idPeriodoLectivo`, `idAsignatura`, `idParalelo`) VALUES ('1', '2', '1', '1');
INSERT INTO `ignug`.`DocenteAsignatura` (`idDocente`, `idPeriodoLectivo`, `idAsignatura`, `idParalelo`) VALUES ('1', '2', '5', '2');
INSERT INTO `ignug`.`DocenteAsignatura` (`idDocente`, `idPeriodoLectivo`, `idAsignatura`, `idParalelo`) VALUES ('1', '2', '5', '1');
INSERT INTO `ignug`.`DocenteAsignatura` (`idDocente`, `idPeriodoLectivo`, `idAsignatura`, `idParalelo`) VALUES ('1', '2', '33', '1');

INSERT INTO `ignug`.`Paralelo` (`descripcion`) VALUES ('A');
INSERT INTO `ignug`.`Paralelo` (`descripcion`) VALUES ('B');
INSERT INTO `ignug`.`Paralelo` (`descripcion`) VALUES ('C');
INSERT INTO `ignug`.`Paralelo` (`descripcion`) VALUES ('D');

INSERT INTO `ignug`.`DiaSemana` (`descripcion`) VALUES ('LUNES');
INSERT INTO `ignug`.`DiaSemana` (`descripcion`) VALUES ('MARTES');
INSERT INTO `ignug`.`DiaSemana` (`descripcion`) VALUES ('MIÉRCOLES');
INSERT INTO `ignug`.`DiaSemana` (`descripcion`) VALUES ('JUEVES');
INSERT INTO `ignug`.`DiaSemana` (`descripcion`) VALUES ('VIERNES');
INSERT INTO `ignug`.`DiaSemana` (`descripcion`) VALUES ('SÁBADO');
INSERT INTO `ignug`.`DiaSemana` (`descripcion`) VALUES ('DOMINGO');

INSERT INTO `ignug`.`HorasClaseDia` (`idDocenteAsignatura`, `idDiaSemana`, `idTipoAula`, `numeroHoras`) VALUES ('1', '1', '1', '2');
INSERT INTO `ignug`.`HorasClaseDia` (`idDocenteAsignatura`, `idDiaSemana`, `idTipoAula`, `numeroHoras`) VALUES ('1', '2', '2', '3');
INSERT INTO `ignug`.`HorasClaseDia` (`idDocenteAsignatura`, `idDiaSemana`, `idTipoAula`, `numeroHoras`) VALUES ('1', '3', '1', '1');
INSERT INTO `ignug`.`HorasClaseDia` (`idDocenteAsignatura`, `idDiaSemana`, `idTipoAula`, `numeroHoras`) VALUES ('1', '4', '2', '2');
INSERT INTO `ignug`.`HorasClaseDia` (`idDocenteAsignatura`, `idDiaSemana`, `idTipoAula`, `numeroHoras`) VALUES ('1', '5', '1', '1');
INSERT INTO `ignug`.`HorasClaseDia` (`idDocenteAsignatura`, `idDiaSemana`, `idTipoAula`, `numeroHoras`) VALUES ('2', '2', '2', '2');
INSERT INTO `ignug`.`HorasClaseDia` (`idDocenteAsignatura`, `idDiaSemana`, `idTipoAula`, `numeroHoras`) VALUES ('3', '2', '2', '2');
INSERT INTO `ignug`.`HorasClaseDia` (`idDocenteAsignatura`, `idDiaSemana`, `idTipoAula`, `numeroHoras`) VALUES ('4', '2', '2', '2');

INSERT INTO `ignug`.`ComponentePd` (`componente`, `estado`) VALUES ('Carátula', '1');
INSERT INTO `ignug`.`ComponentePd` (`componente`, `estado`) VALUES ('Horario', '1');
INSERT INTO `ignug`.`ComponentePd` (`componente`, `estado`) VALUES ('Calendario', '1');
INSERT INTO `ignug`.`ComponentePd` (`componente`, `estado`) VALUES ('Sílabo', '1');
INSERT INTO `ignug`.`ComponentePd` (`componente`, `estado`) VALUES ('Plan de clase', '1');
INSERT INTO `ignug`.`ComponentePd` (`componente`, `estado`) VALUES ('Temas tratados', '1');
INSERT INTO `ignug`.`ComponentePd` (`componente`, `estado`) VALUES ('Atención a estudiantes', '1');
INSERT INTO `ignug`.`ComponentePd` (`componente`, `estado`) VALUES ('Plan de refuerzo académico', '1');
INSERT INTO `ignug`.`ComponentePd` (`componente`, `estado`) VALUES ('Informe de refuerzo académico', '1');
INSERT INTO `ignug`.`ComponentePd` (`componente`, `estado`) VALUES ('Informe rendimiento académico', '1');
INSERT INTO `ignug`.`ComponentePd` (`componente`, `estado`) VALUES ('Evaluación resultados de aprendizaje', '1');
INSERT INTO `ignug`.`ComponentePd` (`componente`, `estado`) VALUES ('Entrega portafolio docente', '1');

INSERT INTO `ignug`.`EstadoComponentePd` (`estadocomponente`) VALUES ('En proceso');
INSERT INTO `ignug`.`EstadoComponentePd` (`estadocomponente`) VALUES ('Por aprobar en coordinación');
INSERT INTO `ignug`.`EstadoComponentePd` (`estadocomponente`) VALUES ('Aprobado en coordinación');
INSERT INTO `ignug`.`EstadoComponentePd` (`estadocomponente`) VALUES ('En espera de modificaciones solicitadas por la coordinación');
INSERT INTO `ignug`.`EstadoComponentePd` (`estadocomponente`) VALUES ('Modificaciones realizadas por aprobar en coordinación');
INSERT INTO `ignug`.`EstadoComponentePd` (`estadocomponente`) VALUES ('Entregado');

INSERT INTO `ignug`.`PortafolioDocente` (`idComponentePd`, `idAsignatura`, `idEstadoComponentePd`, `idPeriodoLectivo`) VALUES ('4', '1', '6', '1');
INSERT INTO `ignug`.`PortafolioDocente` (`idComponentePd`, `idAsignatura`, `idEstadoComponentePd`, `idPeriodoLectivo`) VALUES ('4', '5', '6', '1');

