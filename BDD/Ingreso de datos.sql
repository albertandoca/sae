USE ignug;
insert into EstadoPersona (idPersona, datosCompletos, encuestaFactoresAsociados) values
(1,true,true),
(2,true,true),
(3,true,true),
(4,true,true),
(5,true,true),
(6,true,true),
(7,true,true),
(8,true,true),
(9,true,true),
(10,true,true);

insert into ExperienciaLaboral (idPersona, fechaInicio, fechaFin, descripcionCargo, nombreEmpresa, idMotivoSalida) values
(1, '2004-05-23', '2006-01-12', 'Recursos Humanos', 'Yavirac',1),
(2, '2005-03-22', '2007-02-24', 'Bodega', 'Yavirac',2),
(3, '2006-06-12', '2008-03-16', 'Administrativos', 'Yavirac',1),
(4, '2007-08-13', '2009-04-19', 'Aseo', 'Yavirac',1),
(5, '2008-12-11', '2010-05-11', 'Docencia', 'Yavirac',3),
(6, '2009-10-30', '2011-06-01', 'Seguridad', 'Yavirac',3),
(7, '2010-09-23', '2012-07-07', 'Secretaria', 'Yavirac',2),
(8, '2011-01-20', '2013-08-26', 'Psicologia', 'Yavirac',1),
(9, '2012-11-15', '2014-09-14', 'Docencia', 'Yavirac',2),
(10, '2013-09-16', '2015-10-15', 'Seguridad', 'Yavirac',1);

insert into FotoPerfil (idPersona, tipoArchivo, nombreArchivo) values
(1, 'JPG','Foto1'),
(2, 'JPG','Foto2'),
(3, 'JPG','Foto3'),
(4, 'JPG','Foto4'),
(5, 'JPG','Foto5'),
(6, 'JPG','Foto6'),
(7, 'JPG','Foto7'),
(8, 'JPG','Foto8'),
(9, 'JPG','Foto9'),
(10, 'JPG','Foto10');

insert into fechaEvaluacionesParciales (fechaParcial1, fechaEvaluacionParcial1, fechaEvaluacionParcial2, idMalla, idPeriodoLectivo) values
('2017-05-01','2014-07-10','2014-09-07',1,1),
('2017-05-01','2015-07-10','2015-09-07',1,2),
('2017-05-01','2016-07-10','2016-09-07',1,1),
('2017-05-01','2017-07-10','2017-09-07',1,2),
('2017-05-01','2017-12-10','2018-02-07',1,1);

insert into DocenteAsignatura (idDocente, idPeriodoLectivo, idAsignatura, idParalelo) values (1, 2,3,1);
insert into DocenteAsignatura (idDocente, idPeriodoLectivo, idAsignatura, idParalelo) values (2, 2,3,2);
insert into DocenteAsignatura (idDocente, idPeriodoLectivo, idAsignatura, idParalelo) values (3, 2,3,3);
insert into DocenteAsignatura (idDocente, idPeriodoLectivo, idAsignatura, idParalelo) values (4, 1,4,2);
insert into DocenteAsignatura (idDocente, idPeriodoLectivo, idAsignatura, idParalelo) values (5, 1,4,1);
insert into DocenteAsignatura (idDocente, idPeriodoLectivo, idAsignatura, idParalelo) values (6, 1,4,3);
insert into DocenteAsignatura (idDocente, idPeriodoLectivo, idAsignatura, idParalelo) values (7, 2,2,1);
insert into DocenteAsignatura (idDocente, idPeriodoLectivo, idAsignatura, idParalelo) values (8, 2,2,2);
insert into DocenteAsignatura (idDocente, idPeriodoLectivo, idAsignatura, idParalelo) values (9, 2,2,3);
insert into DocenteAsignatura (idDocente, idPeriodoLectivo, idAsignatura, idParalelo) values (10,1,5,1);

insert into Silabo (idAsignatura, descripcion, objetivo1, objetivo2, objetivo3, objetivo4, estado) values (1,'Las matemáticas discretas son un área de las matemáticas encargadas del estudio de los conjuntos discretos: finitos o infinitos numerables.', 'Al terminar el curso el alumno conocerá', 'las técnicas y métodos del área de matemáticas discretas', ' más
importantes,', ' y será capaz de aplicarlos en la solución de problemas específicos. ', '1');
update Silabo set objetivo1= 'Enseñar' where id=1;
Select * from Silabo;
insert into Silabo (idAsignatura, descripcion, objetivo1, objetivo2, objetivo3, objetivo4, estado) values 
(2,'Una metodología nos ordena, nos contiene, nos permite definir límites. Construir software complejo requiere un gran esfuerzo: tecnología, dinero y sobre todo: personas. Personas que interactúan entre sí, con diferentes grados de conocimiento, con diferentes roles, con diferentes intereses. ', 'Preparar', 'a los estudiantes para el desarrollo de software', 'mediante temas poco complicados', 'para  adquisición por parte del estudiante de una formación avanzada, de carácter especializado y multidisciplinar, orientada a la especialización académica o profesional', '1');
insert into Silabo (idAsignatura, descripcion, objetivo1, objetivo2, objetivo3, objetivo4, estado) values 
(3, 'Fundamentos de Programación es una asignatura básica que permite crear programas que exhiban un comportamiento deseado. El proceso de escribir código requiere frecuentemente conocimientos en varias áreas distintas, además del dominio del lenguaje a utilizar, algoritmos especializados y lógica formal.',
'Preparar','a los estudiantes para que  sean capaces de resolver de manera eficaz',
' distintos problemas de carácter general, con independencia del lenguaje de programación utilizado',
'y asi  adquieran el conocimiento teórico y práctico sobre las técnicas básicas de programación estructurada', '1');
select * from Silabo;
insert into SilaboUnidades (idSilabo, descripcion, codigo) values (1, 'Conjuntos', 001);
insert into SilaboUnidades (idSilabo, descripcion, codigo) values (1, 'Relaciones, aplicaciones y funciones', 002);
insert into SilaboUnidades (idSilabo, descripcion, codigo) values (1, 'Combinatoria', 003);
insert into SilaboUnidades (idSilabo, descripcion, codigo) values (1, ' Inducción', 004);
insert into SilaboUnidades (idSilabo, descripcion, codigo) values (1, ' Aritmética modular', 005);
insert into SilaboUnidades (idSilabo, descripcion, codigo) values (2, ' Introducción a la programación', 001);
insert into SilaboUnidades (idSilabo, descripcion, codigo) values (2, 'La programación estructurada', 002);
insert into SilaboUnidades (idSilabo, descripcion, codigo) values (2, 'Programación avanzada en C. Desarrollo
eficiente de aplicaciones ', 003);
insert into SilaboUnidades (idSilabo, descripcion, codigo) values (2, 'Programación orientada a objetos en C++ ', 004);
insert into SilaboUnidades (idSilabo, descripcion, codigo) values (3, 'Contextualización ', 001);
insert into SilaboUnidades (idSilabo, descripcion, codigo) values (3, 'Competencias ', 002);
insert into SilaboUnidades (idSilabo, descripcion, codigo) values (3, ' Prerrequisitos ', 003);
insert into SilaboUnidades (idSilabo, descripcion, codigo) values (3, ' .Bloques y temas de contenidos ', 004);

insert into SilaboElementos(idSilaboUnidades, verbo, objeto ,condicion, finalidad, codigo) values
(1, 'Conocer', 'los conjuntos', 'de una manera correcta','para aplicar en la programacion', 1.1);
insert into SilaboElementos(idSilaboUnidades, verbo, objeto ,condicion, finalidad, codigo) values
(7, 'Aplicar', 'la programacion orientada a objetos', 'basada en varias técnicas, incluyendo herencia, cohesión, abstracción, polimorfismo, acoplamiento y encapsulamiento.','con la finalidad de obtener buenos pprogramadores ', 1.1);

insert into Aula (capacidad,descripcion,idTipoAula) values (50,'Cuenca',1),(35,'Catamarca',1),(40,'Cueva de las Manos',1),
(38,'Xian',2), (25,'Yasuni',1), (27,'Maracaibo',1), (23,'Touluse',2),(20,'Gori',2),(25,'Montecristi',1), (25,'Galapagos',1);

insert into Paralelo (descripcion) values 
('A'),
('B'),
('C'),
('D');

insert into AulasAsignaturas (idAula, idDocenteAsignatura) values (1,2),(2,3),(1,1),(1,5),(2,1),(2,6),(1,8),(2,2),(1,3),(2,1);

insert into CategoriaNota (descripcion) values ('47-50 Excelente'), ('41-46 Muy Bueno'), ('35-40 Bueno'), ('29-34 Regular'), ('0-28 Deficiente');

insert into HorasClaseDia (idDocenteAsignatura, idDiaSemana, idTipoAula, numeroHoras) values
(1,1,1,2), (2,1,2,2), (3,2,2,1), (5,2,1,3), (4,3,2,2), (3,3,1,1), (1,4,2,2), (2,4,2,3), (4,5,1,1), (5,5,2,3);

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

insert into AsignaturaPrerequisito (idAsignatura, idAsignaturaPrerequisito) values (37,1);
insert into AsignaturaPrerequisito (idAsignatura, idAsignaturaPrerequisito) values (40,32);
insert into AsignaturaPrerequisito (idAsignatura, idAsignaturaPrerequisito) values (43,37);
insert into AsignaturaPrerequisito (idAsignatura, idAsignaturaPrerequisito) values (49,43);
insert into AsignaturaPrerequisito (idAsignatura, idAsignaturaPrerequisito) values (39,35);
insert into AsignaturaPrerequisito (idAsignatura, idAsignaturaPrerequisito) values (46,39);
insert into AsignaturaPrerequisito (idAsignatura, idAsignaturaPrerequisito) values (52,46);
insert into AsignaturaPrerequisito (idAsignatura, idAsignaturaPrerequisito) values (55,51);
insert into AsignaturaPrerequisito (idAsignatura, idAsignaturaPrerequisito) values (9,51);

insert into AsignaturaCorrequisito (idAsignatura, idAsignaturaCorrequisito) values (38,39);
insert into AsignaturaCorrequisito (idAsignatura, idAsignaturaCorrequisito) values (40,38);
insert into AsignaturaCorrequisito (idAsignatura, idAsignaturaCorrequisito) values (47,46);
insert into AsignaturaCorrequisito (idAsignatura, idAsignaturaCorrequisito) values (39,42);

insert into Asistencia (idMatriculaAsignatura, fecha, horas) values (1 ,"2018-03-14", 10);
insert into Asistencia (idMatriculaAsignatura, fecha, horas) values (2 ,"2018-03-14", 10);
insert into Asistencia (idMatriculaAsignatura, fecha, horas) values (3 ,"2018-03-14", 10);
insert into Asistencia (idMatriculaAsignatura, fecha, horas) values (4 ,"2018-03-14", 10);
insert into Asistencia (idMatriculaAsignatura, fecha, horas) values (5 ,"2018-03-14", 10);
insert into Asistencia (idMatriculaAsignatura, fecha, horas) values (6 ,"2018-03-14", 10);
insert into Asistencia (idMatriculaAsignatura, fecha, horas) values (7 ,"2018-03-14", 10);
insert into Asistencia (idMatriculaAsignatura, fecha, horas) values (8 ,"2018-03-14", 10);
insert into Asistencia (idMatriculaAsignatura, fecha, horas) values (9 ,"2018-03-14", 10);
insert into Asistencia (idMatriculaAsignatura, fecha, horas) values (10 ,"2018-03-14", 10);

Insert Into CampoFormacion (id, nombre) values (1, null);
Insert Into CampoFormacion (id, nombre) values (2, null);
Insert Into CampoFormacion (id, nombre) values (3, null);
Insert Into CampoFormacion (id, nombre) values (4, null);
Insert Into CampoFormacion (id, nombre) values (5, null);
Insert Into CampoFormacion (id, nombre) values (6, null);
Insert Into CampoFormacion (id, nombre) values (7, null);
Insert Into CampoFormacion (id, nombre) values (8, null);
Insert Into CampoFormacion (id, nombre) values (9, null);
Insert Into CampoFormacion (id, nombre) values (10, null);

Insert Into CategoriaNota (id, descripcion) values (1, null);
Insert Into CategoriaNota (id, descripcion) values (2, null);
Insert Into CategoriaNota (id, descripcion) values (3, null);
Insert Into CategoriaNota (id, descripcion) values (4, null);
Insert Into CategoriaNota (id, descripcion) values (5, null);
Insert Into CategoriaNota (id, descripcion) values (6, null);
Insert Into CategoriaNota (id, descripcion) values (7, null);
Insert Into CategoriaNota (id, descripcion) values (8, null);
Insert Into CategoriaNota (id, descripcion) values (9, null);
Insert Into CategoriaNota (id, descripcion) values (10, null);

Insert Into Contacto (id, idpersona, descripcion, contacto ) values(1,1,Null,'0998569102');
Insert Into Contacto (id, idpersona, descripcion, contacto ) values(2,2,Null,'0998569103');
Insert Into Contacto (id, idpersona, descripcion, contacto ) values(3,3,Null,'0998569104');
Insert Into Contacto (id, idpersona, descripcion, contacto ) values(4,4,Null,'0998569105');
Insert Into Contacto (id, idpersona, descripcion, contacto ) values(5,5,Null,'0998569106');
Insert Into Contacto (id, idpersona, descripcion, contacto ) values(6,6,Null,'0998569107');
Insert Into Contacto (id, idpersona, descripcion, contacto ) values(7,7,Null,'0998569108');
Insert Into Contacto (id, idpersona, descripcion, contacto ) values(8,8,Null,'0998569109');
Insert Into Contacto (id, idpersona, descripcion, contacto ) values(9,9,Null,'0998569110');
Insert Into Contacto (id, idpersona, descripcion, contacto ) values(10,10,Null,'0998569102');

insert into LogMailSender (fecha, FromEmail, FromAlias, ReplyEmail, ToEmail, ToAlias, Asunto, Mensaje, EstadoEnvio) values
('2009-03-14','yavirac1@yavirac.edu.ec','yavirac', 'yavirac@yavirac.edu.ec', 'educacion@ministerio.edu.ec', 'Ministerio de educacion', NULL, 'texto', 'enviado'),
('2010-03-14','yavirac2@yavirac.edu.ec','yavirac', 'yavirac@yavirac.edu.ec', 'educacion@ministerio.edu.ec', 'Ministerio de educacion', NULL, 'texto', 'enviado'),
('2011-03-14','yavirac3@yavirac.edu.ec','yavirac', 'yavirac@yavirac.edu.ec', 'educacion@ministerio.edu.ec', 'Ministerio de educacion', NULL, 'texto', 'enviado'),
('2012-03-14','yavirac4@yavirac.edu.ec','yavirac', 'yavirac@yavirac.edu.ec', 'educacion@ministerio.edu.ec', 'Ministerio de educacion', NULL, 'texto', 'enviado'),
('2013-03-14','yavirac5@yavirac.edu.ec','yavirac', 'yavirac@yavirac.edu.ec', 'educacion@ministerio.edu.ec', 'Ministerio de educacion', NULL, 'texto', 'enviado'),
('2014-03-14','yavirac6@yavirac.edu.ec','yavirac', 'yavirac@yavirac.edu.ec', 'educacion@ministerio.edu.ec', 'Ministerio de educacion', NULL, 'texto', 'enviado'),
('2015-03-14','yavirac7@yavirac.edu.ec','yavirac', 'yavirac@yavirac.edu.ec', 'educacion@ministerio.edu.ec', 'Ministerio de educacion', NULL, 'texto', 'enviado'),
('2016-03-14','yavirac8@yavirac.edu.ec','yavirac', 'yavirac@yavirac.edu.ec', 'educacion@ministerio.edu.ec', 'Ministerio de educacion', NULL, 'texto', 'enviado'),
('2017-03-14','yavirac9@yavirac.edu.ec','yavirac', 'yavirac@yavirac.edu.ec', 'educacion@ministerio.edu.ec', 'Ministerio de educacion', NULL, 'texto', 'enviado'),
('2018-03-14','yavirac10@yavirac.edu.ec','yavirac', 'yavirac@yavirac.edu.ec', 'educacion@ministerio.edu.ec', 'Ministerio de educacion', NULL, 'texto', 'enviado');

insert into Parcial (descripcion) values 
('primer parcial'),
('segundo parcial');

insert into Ponderacion (idCategoria, idParcial, porcentaje) values 
(1, 1 , '100'),
(2, 2 , '100'),
(3, 1 , '100'),
(4, 2 , '100'),
(5, 1 , '100'),
(6, 2 , '100'),
(7, 1 , '100'),
(8, 2 , '100'),
(9, 1 , '100'),
(10, 2 , '100');

insert into RolSecundario (idPersona, idRol) values 
(1,2),
(2,1),
(3,5),
(4,7),
(5,9),
(6,8),
(7,2),
(8,4),
(9,7),
(10,3);

insert into Titulo (idPersona, idInstitucion, codigoRegistro, idNivelTitulo) values
(1,1,'2dfg4',3),
(2,1,'356fd',3),
(3,1,'4fd58',3),
(4,1,'68hfh',3),
(5,1,'5778b',3),
(6,1,'6hr6g',3),
(7,1,'57gcs',3),
(8,1,'77ghg',3),
(9,1,'yuhv5',3),
(10,1,'5467hg',3);

insert into ContenidosUnidad (idSilaboUnidades, codigo) values (1, 'A1'),(2, 'B2'),(3, 'C3'),(2, 'D4'),(5, 'E5');
insert into Discapacidad (idPersona, idTipoDiscapacidad, porcentaje) values (1,2,25.00),(2,3,15.00),(3,1,05.50);
insert into Docente (idPersona, fechaInicio, idEstado) values (11,"2017-08-12",1),(11,"2017-01-12",1),(11,"2017-10-02",1),(11,"2018-01-22",1);
insert into Documento (documento, descripcion) values ('A001', 'Solicitud'), ('B001', 'Formulario'), ('C001', 'Atencion'), ('D001', 'Permiso');
insert into EducacionContinua (descripcion, horas, fechaInicio, fechaFin, idTipoEducacionContinua, lugar) values
('Ingles A', 40, "2017-11-11","2017-12-11",2,'ESPE'),('Ingles A1', 40, "2017-12-13","2018-01-13",2,'ESPE'),('Base de Datos', 40, "2018-01-11","2018-02-11",2,'Yavirac'),('Ingles B', 40, "2018-05-11","2018-06-11",1,'YAVIRAC');
insert into Enfermedad (descripcion, observaciones, tratamiento) values ('Gripe','Dolor Corporal','Paracetamol'),('Alergia','Alergia al Polvo','Alergin'),('Tos','Tos Seca','Jarabe');

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

insert into SilaboBiliografia (detalle, tipo) values ('Cabezas,L. (2012). PHP 6 Segunda edición. Madrid: Anaya Multimedia', 'Completa' );
insert into SilaboBiliografia (detalle, tipo) values ('Cabezas,L. González, F. (2015). Desarrollo Web con PHP y MySQL. Madrid: Anaya Multimedia .', 'Básica' );
insert into SilaboBiliografia (detalle, tipo) values ('Oracle. (2017). MYSQL Tutorial. EEUU: Oracle.', 'Básica' );

Insert Into PerfilEgreso (idmalla,detalle) Values (1,'Aprobado');
Insert Into PerfilEgreso (idmalla,detalle) Values (1,'Aprobado');
Insert Into PerfilEgreso (idmalla,detalle) Values (2,'Aprobado');
Insert Into PerfilEgreso (idmalla,detalle) Values (3,'Aprobado');
Insert Into PerfilEgreso (idmalla,detalle) Values (4,'Aprobado');
Insert Into PerfilEgreso (idmalla,detalle) Values (5,'Aprobado');
Insert Into PerfilEgreso (idmalla,detalle) Values (6,'Aprobado');

Insert Into MetodologiaRecursos (tipoMaterial,material) Values ('Electronico', 'celular, tablets, camara');
Insert Into MetodologiaRecursos (tipoMaterial,material) Values ('Didactico', 'pintura,papel,tijeras');
Insert Into MetodologiaRecursos (tipoMaterial,material) Values ('Reciclado', 'botellas,CDs');
Insert Into MetodologiaRecursos (tipoMaterial,material) Values ('Visual', 'celular,enfocus, libros, tripticos');
Insert Into MetodologiaRecursos (tipoMaterial,material) Values ('Auditivo', 'Musica, audiolibros,');

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

insert into SilaboMetodologia (idSilabo, idMetodologia) values (1,1);
insert into SilaboMetodologia (idSilabo, idMetodologia) values (2,1);
insert into SilaboMetodologia (idSilabo, idMetodologia) values (3,1);

Insert Into Notas (idparcial, idMatriculaAsignatura) Values (35,1);
Insert Into Notas (idparcial, idMatriculaAsignatura) Values (22,1);
Insert Into Notas (idparcial, idMatriculaAsignatura) Values (20,2);
Insert Into Notas (idparcial, idMatriculaAsignatura) Values (25,3);
Insert Into Notas (idparcial, idMatriculaAsignatura) Values (18,1);
Insert Into Notas (idparcial, idMatriculaAsignatura) Values (17,2);

insert into Metodologia(id, estrategia,finalidad) Values( 1,'Curso Angular','Tene bases para desarollar programas');
insert into Metodologia(id, estrategia,finalidad) Values( 2,'Null','Null');
insert into Metodologia(id, estrategia,finalidad) Values( 3,'Null','Null');
insert into Metodologia(id, estrategia,finalidad) Values( 4,'Null','Null');
insert into Metodologia(id, estrategia,finalidad) Values( 5,'Null','Null');

Insert Into ContenidosElementos (id, idContenidoUnidad, semana, idSilaboElementos,observaciones ) Values(1,1,1,1, 'Regular');
Insert Into ContenidosElementos (id, idContenidoUnidad, semana, idSilaboElementos,observaciones ) Values(2,2,2,2, 'Completar tema 2');
Insert Into ContenidosElementos (id, idContenidoUnidad, semana, idSilaboElementos,observaciones ) Values(3,3,3,3, 'Tema a tratar');
Insert Into ContenidosElementos (id, idContenidoUnidad, semana, idSilaboElementos,observaciones ) Values(4,4,4,4, 'Sin novedad');
Insert Into ContenidosElementos (id, idContenidoUnidad, semana, idSilaboElementos,observaciones ) Values(5,5,5,5, 'Temas a trabajar');
Insert Into ContenidosElementos (id, idContenidoUnidad, semana, idSilaboElementos,observaciones ) Values(6,6,6,6, 'No se cumple con el Contenido');
Insert Into ContenidosElementos (id, idContenidoUnidad, semana, idSilaboElementos,observaciones ) Values(7,7,7,7, 'Regular');
Insert Into ContenidosElementos (id, idContenidoUnidad, semana, idSilaboElementos,observaciones ) Values(8,8,8,8, 'Pendiente');
Insert Into ContenidosElementos (id, idContenidoUnidad, semana, idSilaboElementos,observaciones ) Values(9,9,9,9, 'Regular');
Insert Into ContenidosElementos (id, idContenidoUnidad, semana, idSilaboElementos,observaciones ) Values(10,10,10,10, 'Completar el Contenido');

Insert Into ContenidosActividades ( id, idContenidoElementos, idSilaboEvidenciasRa, tipo, horasClase) Values (1,1,1,'Null',10);
Insert Into ContenidosActividades ( id, idContenidoElementos, idSilaboEvidenciasRa, tipo, horasClase) Values (2,2,2,'Null',11);
Insert Into ContenidosActividades ( id, idContenidoElementos, idSilaboEvidenciasRa, tipo, horasClase) Values (3,3,3,'Null',12);
Insert Into ContenidosActividades ( id, idContenidoElementos, idSilaboEvidenciasRa, tipo, horasClase) Values (4,4,4,'Null',13);
Insert Into ContenidosActividades ( id, idContenidoElementos, idSilaboEvidenciasRa, tipo, horasClase) Values (5,5,5,'Null',14);
Insert Into ContenidosActividades ( id, idContenidoElementos, idSilaboEvidenciasRa, tipo, horasClase) Values (6,6,6,'Null',15);
Insert Into ContenidosActividades ( id, idContenidoElementos, idSilaboEvidenciasRa, tipo, horasClase) Values (7,7,7,'Null',16);
Insert Into ContenidosActividades ( id, idContenidoElementos, idSilaboEvidenciasRa, tipo, horasClase) Values (8,8,8,'Null',17);
Insert Into ContenidosActividades ( id, idContenidoElementos, idSilaboEvidenciasRa, tipo, horasClase) Values (9,9,9,'Null',18);
Insert Into ContenidosActividades ( id, idContenidoElementos, idSilaboEvidenciasRa, tipo, horasClase) Values (10,10,10,'Null',19);

insert into SilaboResultados (idSilaboElementos, verbo, objeto ,condicion, finalidad, codigo) values
(1, 'Aplicar', 'los conocimientos de conjuntos', 'siguiendo los parametros necesarios', 'probando que los conocimientos adquiridos fueron optimos', '1.1.1');
insert into SilaboResultados (idSilaboElementos, verbo, objeto ,condicion, finalidad, codigo) values
(2, 'construir', 'mediante los conocimientos ', 'sobre programacion orientada a objetos', 'una pagina web estatica', '1.1.1');
insert into SilaboResultados (idSilaboElementos, verbo, objeto ,condicion, finalidad, codigo) values
(3, 'Modificar', 'un codigo con errores', 'obteniendo un codigo funcional', 'aplicando lo aprendido', '1.1.1');

insert into SilaboEvidenciasRa (idSilaboResultados, descripcion, codigo) values
(1, 'Presentacion de una pagina web estatica', 1);
insert into SilaboEvidenciasRa (idSilaboResultados, descripcion, codigo) values
(2, 'Presentacion de una pagina web estatica', 1);
insert into SilaboEvidenciasRa (idSilaboResultados, descripcion, codigo) values
(3, 'Presentacion de una pagina web estatica', 1);

insert into SilaboRecursoDidactico(idsilabo,idRecursoDidactico) values (1,1);
insert into SilaboRecursoDidactico(idsilabo,idRecursoDidactico) values (2,3);
insert into SilaboRecursoDidactico(idsilabo,idRecursoDidactico) values (3,2);
insert into SilaboRecursoDidactico(idsilabo,idRecursoDidactico) values (4,5);
insert into SilaboRecursoDidactico(idsilabo,idRecursoDidactico) values (5,2);

Insert Into UnidadOrganizacion (nombre) values ('Formacion Tecnica Profecional');
Insert Into UnidadOrganizacion (nombre) values ('Formacion Tecnica Dual');
Insert Into UnidadOrganizacion (nombre) values ('Formacion Tecnica Presencial');