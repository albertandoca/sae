SELECT * FROM ignug.HorasClaseDia;
insert into HorasClaseDia (idDocenteAsignatura, idDiaSemana, idTipoAula, numeroHoras) values
(1,1,1,2), (2,1,2,2), (3,2,2,1), (5,2,1,3), (4,3,2,2), (3,3,1,1), (1,4,2,2), (2,4,2,3), (4,5,1,1), (5,5,2,3);

Select *From ignug.DiaSemana;
insert into DiaSemana (detalle) values ('Lunes'), ('Martes'), ('Miercoles'), ('Jueves'), ('Viernes');
insert into HorasClase (idAsignatura, idParalelo, fecha, horas) values (1, 1, "2018-01-21", 8);
insert into HorasClase (idAsignatura, idParalelo, fecha, horas) values (2, 2, "2018-01-22", 5);
insert into HorasClase (idAsignatura, idParalelo, fecha, horas) values (1, 1, "2018-01-23", 6);
insert into HorasClase (idAsignatura, idParalelo, fecha, horas) values (3, 3, "2018-01-21", 4);
insert into HorasClase (idAsignatura, idParalelo, fecha, horas) values (1, 2, "2018-01-24", 8);
insert into HorasClase (idAsignatura, idParalelo, fecha, horas) values (4, 3, "2018-01-27", 5);
insert into HorasClase (idAsignatura, idParalelo, fecha, horas) values (2, 2, "2018-01-28", 7);
insert into HorasClase (idAsignatura, idParalelo, fecha, horas) values (1, 1, "2018-01-28", 4);
insert into HorasClase (idAsignatura, idParalelo, fecha, horas) values (4, 3, "2018-01-29", 6);

Select *From  ignug.AsignaturaPrerrequisito;
insert into AsignaturaPrerrequisito (idAsignatura, idAsignaturaPrerrequisito) values (37,1);
insert into AsignaturaPrerrequisito (idAsignatura, idAsignaturaPrerrequisito) values (40,32);
insert into AsignaturaPrerrequisito (idAsignatura, idAsignaturaPrerrequisito) values (43,37);
insert into AsignaturaPrerrequisito (idAsignatura, idAsignaturaPrerrequisito) values (49,43);
insert into AsignaturaPrerrequisito (idAsignatura, idAsignaturaPrerrequisito) values (39,35);
insert into AsignaturaPrerrequisito (idAsignatura, idAsignaturaPrerrequisito) values (46,39);
insert into AsignaturaPrerrequisito (idAsignatura, idAsignaturaPrerrequisito) values (52,46);
insert into AsignaturaPrerrequisito (idAsignatura, idAsignaturaPrerrequisito) values (55,51);
insert into AsignaturaPrerrequisito (idAsignatura, idAsignaturaPrerrequisito) values (9,51);

Select *From ignug.AsignaturaCorrequisito;
insert into AsignaturaCorrequisito (idAsignatura, idAsignaturaCorrequisito) values (38,39);
insert into AsignaturaCorrequisito (idAsignatura, idAsignaturaCorrequisito) values (40,38);
insert into AsignaturaCorrequisito (idAsignatura, idAsignaturaCorrequisito) values (47,46);
insert into AsignaturaCorrequisito (idAsignatura, idAsignaturaCorrequisito) values (39,42);

Select *From ignug.SilaboResultados;
insert into SilaboResultados (idSilaboElementos, verbo, objeto ,condicion, finalidad, codigo) values
(1, 'Aplicar', 'los conocimientos de conjuntos', 'siguiendo los parametros necesarios', 'probando que los conocimientos adquiridos fueron optimos', '1.1.1');
insert into SilaboResultados (idSilaboElementos, verbo, objeto ,condicion, finalidad, codigo) values
(2, 'construir', 'mediante los conocimientos ', 'sobre programacion orientada a objetos', 'una pagina web estatica', '1.1.1');
insert into SilaboResultados (idSilaboElementos, verbo, objeto ,condicion, finalidad, codigo) values
(3, 'Modificar', 'un codigo con errores', 'obteniendo un codigo funcional', 'aplicando lo aprendido', '1.1.1');

Select *From ignug.SilaboEvidenciasRa;
insert into SilaboEvidenciasRa (idSilaboResultados, descripcion, codigo) values
(1, 'Presentacion de una pagina web estatica', 1);
insert into SilaboEvidenciasRa (idSilaboResultados, descripcion, codigo) values
(2, 'Presentacion de una pagina web estatica', 1);
insert into SilaboEvidenciasRa (idSilaboResultados, descripcion, codigo) values
(3, 'Presentacion de una pagina web estatica', 1);

Select *From ignug.Paralelo;
insert into Paralelo (descripcion) values ('A'),('B'),('C');

Select *From ignug.Requisito;
insert into Requisito(idAsignaturaDependiente,idAsignaturaIndependiente,idTipoRequisito) 
values( 1,1,1);
insert into Requisito(idAsignaturaDependiente,idAsignaturaIndependiente,idTipoRequisito) 
values( 1,2,1);
insert into Requisito(idAsignaturaDependiente,idAsignaturaIndependiente,idTipoRequisito) 
values( 1,3,1);
insert into Requisito(idAsignaturaDependiente,idAsignaturaIndependiente,idTipoRequisito) 
values( 1,4,1);
insert into Requisito(idAsignaturaDependiente,idAsignaturaIndependiente,idTipoRequisito) 
values( 1,5,1);

Select *From ignug.ContenidosDocente;
insert into ContenidosDocente (idContenidoElementos, idSilaboResultados, horasClase) values (1,1,8);
insert into ContenidosDocente (idContenidoElementos, idSilaboResultados, horasClase) values (2,2,8);
insert into ContenidosDocente (idContenidoElementos, idSilaboResultados, horasClase) values (3,3,8);
insert into ContenidosDocente (idContenidoElementos, idSilaboResultados, horasClase) values (4,2,8);
insert into ContenidosDocente (idContenidoElementos, idSilaboResultados, horasClase) values (5,1,8);
insert into ContenidosDocente (idContenidoElementos, idSilaboResultados, horasClase) values (6,2,8);
insert into ContenidosDocente (idContenidoElementos, idSilaboResultados, horasClase) values (7,3,8);
insert into ContenidosDocente (idContenidoElementos, idSilaboResultados, horasClase) values (8,1,8);
insert into ContenidosDocente (idContenidoElementos, idSilaboResultados, horasClase) values (9,2,8);
insert into ContenidosDocente (idContenidoElementos, idSilaboResultados, horasClase) values (10,1,8);

Select *From ignug.SilaboBiliografia;
insert into SilaboBiliografia (detalle, tipo) values ('Cabezas,L. (2012). PHP 6 Segunda edición. Madrid: Anaya Multimedia', 'Completa' );
insert into SilaboBiliografia (detalle, tipo) values ('Cabezas,L. González, F. (2015). Desarrollo Web con PHP y MySQL. Madrid: Anaya Multimedia .', 'Básica' );
insert into SilaboBiliografia (detalle, tipo) values ('Oracle. (2017). MYSQL Tutorial. EEUU: Oracle.', 'Básica' );

Select *From ignug.SilaboMetodologia;
insert into SilaboMetodologia (idSilabo, idMetodologia) values (1,1);
insert into SilaboMetodologia (idSilabo, idMetodologia) values (2,1);
insert into SilaboMetodologia (idSilabo, idMetodologia) values (3,1);

Select *From ignug.Titulo;
insert into Titulo (idPersona, idInstitucion, codigoRegistro, idNivelTitulo) values (1,1,'2dfg4',3),(2,1,'356fd',3),(3,1,'4fd58',3),(4,1,'68hfh',3),(5,1,'5778b',3),(6,1,'6hr6g',3),(7,1,'57gcs',3),(8,1,'77ghg',3),(9,1,'yuhv5',3),(10,1,'5467hg',3);insert into Titulo (idPersona, idInstitucion, codigoRegistro, idNivelTitulo) values (1,1,'2dfg4',3),(2,1,'356fd',3),(3,1,'4fd58',3),(4,1,'68hfh',3),(5,1,'5778b',3),(6,1,'6hr6g',3),(7,1,'57gcs',3),(8,1,'77ghg',3),(9,1,'yuhv5',3),(10,1,'5467hg',3);

SELECT * FROM ignug.RolSecundario;
insert into RolSecundario (idPersona, idRol) values (1,2),(2,1),(3,5),(4,7),(5,9),(6,8),(7,2),(8,4),(9,7),(10,3);