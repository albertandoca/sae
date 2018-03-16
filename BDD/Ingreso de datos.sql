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

insert into DocenteAsignatura (idDocente, idPeriodoLectivo, idAsignatura, idParalelo) values
(1, 2,3,1),
(2, 2,3,2),
(3, 2,3,3),
(4, 1,4,2),
(5, 1,4,1),
(6, 1,4,3),
(7, 2,2,1),
(8, 2,2,2),
(9, 2,2,3),
(10,1,5,1);

insert into Silabo (idPeriodoLectivo, idAsignatura, descripcion, objetivo1, objetivo2, objetivo3, objetivo4, codigo, estado) values 
(1,1,'Las matemáticas discretas son un área de las matemáticas encargadas del estudio de los conjuntos discretos: finitos o infinitos numerables.', 'Enseñar', 'las técnicas y métodos del área de matemáticas discretas', ' más importantes,', ' y será capaz de aplicarlos en la solución de problemas específicos.','DS_MD_1' , '1'),
(1,2,'Una metodología nos ordena, nos contiene, nos permite definir límites. Construir software complejo requiere un gran esfuerzo: tecnología, dinero y sobre todo: personas. Personas que interactúan entre sí, con diferentes grados de conocimiento, con diferentes roles, con diferentes intereses. ', 'Preparar', 'a los estudiantes para el desarrollo de software', 'mediante temas poco complicados', 'para  adquisición por parte del estudiante de una formación avanzada, de carácter especializado y multidisciplinar, orientada a la especialización académica o profesional','DS_IDS_1', '1'),
(1,3, 'Fundamentos de Programación es una asignatura básica que permite crear programas que exhiban un comportamiento deseado. El proceso de escribir código requiere frecuentemente conocimientos en varias áreas distintas, además del dominio del lenguaje a utilizar, algoritmos especializados y lógica formal.','Preparar','a los estudiantes para que  sean capaces de resolver de manera eficaz',' distintos problemas de carácter general, con independencia del lenguaje de programación utilizado','y asi  adquieran el conocimiento teórico y práctico sobre las técnicas básicas de programación estructurada','DS_DP_1', '1');

insert into SilaboUnidades (idSilabo, descripcion, codigo) values 
(1, 'Conjuntos', 001),
(1, 'Relaciones, aplicaciones y funciones', 002),
(1, 'Combinatoria', 003),
(1, 'Inducción', 004),
(1, 'Aritmética modular', 005),
(2, 'Introducción a la programación', 001),
(2, 'La programación estructurada', 002),
(2, 'Programación avanzada en C. Desarrollo eficiente de aplicaciones ', 003),
(2, 'Programación orientada a objetos en C++ ', 004),
(3, 'Contextualización ', 001),
(3, 'Competencias ', 002),
(3, 'Prerrequisitos ', 003),
(3, 'Bloques y temas de contenidos ', 004);

insert into SilaboElementos(idSilaboUnidades, IdVerboBloom, objeto ,condicion, finalidad, codigo) values
(1, 1, 1,'programacion', 'Tener conciomientos basicos', '101'),
(7, 1, 1, 'Técnicas(herencia, abstracción, acoplamiento)','Obtener buenos pprogramadores', '201');

insert into Aula (capacidad,descripcion,idTipoAula) values 
(50,'Cuenca',1),
(35,'Catamarca',1),
(40,'Cueva de las Manos',1),
(38,'Xian',2),
(25,'Yasuni',1),
(27,'Maracaibo',1),
(23,'Touluse',2),
(20,'Gori',2),
(25,'Montecristi',1), 
(25,'Galapagos',1);

insert into Paralelo (descripcion) values 
('A'),
('B'),
('C'),
('D');

insert into AulasAsignaturas (idAula, idDocenteAsignatura) values 
(1,2),
(2,3),
(1,1),
(1,5),
(2,1),
(2,6),
(1,8),
(2,2),
(1,3),
(2,1);

insert into CategoriaNota (descripcion) values 
('47-50 Excelente'), 
('41-46 Muy Bueno'), 
('35-40 Bueno'), 
('29-34 Regular'), 
('0-28 Deficiente');

insert into HorasClaseDia (idDocenteAsignatura, idDiaSemana, idTipoAula, numeroHoras) values
(1,1,1,2), 
(2,1,2,2), 
(3,2,2,1), 
(5,2,1,3), 
(4,3,2,2), 
(3,3,1,1), 
(1,4,2,2), 
(2,4,2,3), 
(4,5,1,1), 
(5,5,2,3);

insert into DiaSemana (detalle) values 
('Lunes'), 
('Martes'), 
('Miercoles'), 
('Jueves'), 
('Viernes');

insert into HorasClase (idAsignatura, idParalelo, fecha, horas) values 
(1, 1, "2018-01-21", 8),
(2, 2, "2018-01-22", 5),
(1, 1, "2018-01-23", 6),
(3, 3, "2018-01-21", 4),
(1, 2, "2018-01-24", 8),
(4, 3, "2018-01-27", 5),
(2, 2, "2018-01-28", 7),
(1, 1, "2018-01-28", 4),
(4, 3, "2018-01-29", 6);

insert into AsignaturaPrerrequisito (idAsignatura, idAsignaturaPrerequisito) values 
(37,1),
(40,32),
(43,37),
(49,43),
(39,35),
(46,39),
(52,46),
(55,51),
(9,51);

insert into AsignaturaCorrequisito (idAsignatura, idAsignaturaCorrequisito) values 
(38,39),
(40,38),
(47,46),
(39,42);

insert into Asistencia (idMatriculaAsignatura, fecha, horas) values 
(1 ,"2018-03-14", 10),
(2 ,"2018-03-14", 10),
(3 ,"2018-03-14", 10),
(4 ,"2018-03-14", 10),
(5 ,"2018-03-14", 10),
(6 ,"2018-03-14", 10),
(7 ,"2018-03-14", 10),
(8 ,"2018-03-14", 10),
(9 ,"2018-03-14", 10),
(10 ,"2018-03-14", 10);

Insert Into CampoFormacion (id, nombre) values 
(1, null),
(2, null),
(3, null),
(4, null),
(5, null),
(6, null),
(7, null),
(8, null),
(9, null),
(10, null);

Insert Into Contacto (id, idpersona, descripcion, contacto ) values
(1,1,Null,'0998569102'),
(2,2,Null,'0998569103'),
(3,3,Null,'0998569104'),
(4,4,Null,'0998569105'),
(5,5,Null,'0998569106'),
(6,6,Null,'0998569107'),
(7,7,Null,'0998569108'),
(8,8,Null,'0998569109'),
(9,9,Null,'0998569110'),
(10,10,Null,'0998569102');

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

insert into ContenidosUnidad (idSilaboUnidades, codigo) values 
(1, 'A1'),
(2, 'B2'),
(3, 'C3'),
(2, 'D4'),
(5, 'E5');

insert into Discapacidad (idPersona, idTipoDiscapacidad, porcentaje) values 
(1,2,25.00),
(2,3,15.00),
(3,1,05.50);

insert into Docente (idPersona, fechaInicio, idEstado) values 
(1,"2014-08-12",1),
(2,"2017-01-12",1),
(3,"2015-10-02",1),
(4,"2018-03-28",1),
(5,"2015-08-31",1),
(6,"2014-05-15",1),
(7,"2016-09-09",1),
(8,"2017-11-08",1),
(9,"2014-06-05",1),
(10,"2015-02-20",1);

insert into Documento (documento, descripcion) values 
('A001', 'Solicitud'), 
('B001', 'Formulario'), 
('C001', 'Atencion'), 
('D001', 'Permiso');

insert into EducacionContinua (descripcion, horas, fechaInicio, fechaFin, idTipoEducacionContinua, lugar) values
('Ingles A', 40, "2017-11-11","2017-12-11",2,'ESPE'),
('Ingles A1', 40, "2017-12-13","2018-01-13",2,'ESPE'),
('Base de Datos', 40, "2018-01-11","2018-02-11",2,'Yavirac'),
('Ingles B', 40, "2018-05-11","2018-06-11",1,'YAVIRAC');

insert into Enfermedad (descripcion, observaciones, tratamiento) values 
('Gripe','Dolor Corporal','Paracetamol'),
('Alergia','Alergia al Polvo','Alergin'),
('Tos','Tos Seca','Jarabe');

insert into Requisito(idAsignaturaDependiente,idAsignaturaIndependiente,idTipoRequisito) values
( 1,1,1),
( 1,2,1),
( 1,3,1),
( 1,4,1),
( 1,5,1);

insert into SilaboBiliografia (detalle, tipo) values 
('Cabezas,L. (2012). PHP 6 Segunda edición. Madrid: Anaya Multimedia', 'Completa' ),
('Cabezas,L. González, F. (2015). Desarrollo Web con PHP y MySQL. Madrid: Anaya Multimedia .', 'Básica' ),
('Oracle. (2017). MYSQL Tutorial. EEUU: Oracle.', 'Básica' );

Insert Into PerfilEgreso (idmalla,detalle) Values 
(1,'Aprobado'),
(1,'Aprobado'),
(2,'Aprobado'),
(3,'Aprobado'),
(4,'Aprobado'),
(5,'Aprobado'),
(6,'Aprobado');

insert into ContenidosDocente (idContenidoElementos, idSilaboResultados, horasClase) values 
(1,1,8),
(2,2,8),
(3,3,8),
(4,2,8),
(5,1,8),
(6,2,8),
(7,3,8),
(8,1,8),
(9,2,8),
(10,1,8);

insert into SilaboMetodologia (idSilabo, idMetodologia) values 
(1,1),
(2,1),
(3,1);

Insert Into Notas (idparcial, idMatriculaAsignatura) Values 
(35,1),
(22,1),
(20,2),
(25,3),
(18,1),
(17,2);

insert into Metodologia(id, estrategia,finalidad) Values
( 1,'Curso Angular','Tene bases para desarollar programas'),
( 2,'Null','Null'),
( 3,'Null','Null'),
( 4,'Null','Null'),
( 5,'Null','Null');

Insert Into ContenidosElementos (id, idContenidoUnidad, semana, idSilaboElementos,observaciones ) Values
(1,1,1,1, 'Regular'),
(2,2,2,2, 'Completar tema 2'),
(3,3,3,3, 'Tema a tratar'),
(4,4,4,4, 'Sin novedad'),
(5,5,5,5, 'Temas a trabajar'),
(6,6,6,6, 'No se cumple con el Contenido'),
(7,7,7,7, 'Regular'),
(8,8,8,8, 'Pendiente'),
(9,9,9,9, 'Regular'),
(10,10,10,10, 'Completar el Contenido');

Insert Into ContenidosActividades ( id, idContenidoElementos, idSilaboEvidenciasRa, tipo, horasClase) Values 
(1,1,1,'Null',10),
(2,2,2,'Null',11),
(3,3,3,'Null',12),
(4,4,4,'Null',13),
(5,5,5,'Null',14),
(6,6,6,'Null',15),
(7,7,7,'Null',16),
(8,8,8,'Null',17),
(9,9,9,'Null',18),
(10,10,10,'Null',19);

insert into SilaboResultados (idSilaboElementos,IdVerboBloom, objeto ,condicion, finalidad, codigo) values
(1,1, 'los conocimientos de conjuntos', 'siguiendo los parametros necesarios', 'probando que los conocimientos adquiridos fueron optimos', '1.1.1'),
(2,1, 'mediante los conocimientos ', 'sobre programacion orientada a objetos', 'una pagina web estatica', '1.1.1'),
(3,1, 'un codigo con errores', 'obteniendo un codigo funcional', 'aplicando lo aprendido', '1.1.1');

insert into SilaboEvidenciasRa (idSilaboResultados, descripcion, codigo) values
(1, 'Presentacion de una pagina web estatica', 1),
(2, 'Presentacion de una pagina web estatica', 1),
(3, 'Presentacion de una pagina web estatica', 1);

insert into SilaboRecursoDidactico(idsilabo,idRecursoDidactico) values 
(1,1),
(2,3),
(3,2),
(4,5),
(5,2);

Insert Into UnidadOrganizacion (nombre) values 
('Formacion Tecnica Profecional'),
('Formacion Tecnica Dual'),
('Formacion Tecnica Presencial');

insert into Cargo (detalle) values
('Administrativo'),
('Docencia'),
('Aseo'),
('Seguridad'),
('Recursos Humanos'),
('Psicologia');

insert into CargoInstituto (idCarrera, idPersona, idCargo, fechaInicio, fechaFin, estado) values
(1,1,6, '2017-05-12', '2017-09-03', true),
(1,2,6, '2016-05-16', '2017-01-13', true),
(1,3,6, '2015-05-16', '2015-07-11', true),
(1,4,6, '2017-05-15', '2017-06-05', true),
(1,5,6, '2018-01-14', '2018-03-15', true),
(1,6,6, '2017-01-11', '2017-04-09', true),
(1,7,6, '2016-05-12', '2017-10-03', true),
(1,8,6, '2018-02-12', '2019-02-20', true),
(1,9,6, '2015-05-12', '2017-09-03', true),
(1,10,6, '2017-05-12', '2017-09-03', true);

insert into DatosEstudiante (idEstudiante, descripcion, dato) values
(1,'Estudiante Benito Juarez', '1725615593'),
(2,'Estudiante 24 de Mayo', '1725615593'),
(3,'Estudiante Benito Juarez', '1225615593'),
(4,'Estudiante Benito Juarez', '17251215593'),
(5,'Estudiante Gran Colombia', '1625615593'),
(6,'Estudiante Benito Juarez', '17253425593'),
(7,'Estudiante 24 de Mayo', '1225315593'),
(8,'Estudiante Benito Juarez', '1223615593'),
(9,'Estudiante Benito Juarez', '1725615593'),
(10,'Estudiante Gran Colombia', '1525615593');

insert into EjeTransversal (detalle) values
('Recoleción de información'),
('Base de datos'),
('Capacitación'),
('Nivelación'),
('Administración');

insert into Hobbies (idPersona, descripcion) values
(1,'pintura'),
(2,'caminar'),
(3,'futboll'),
(4,'patinaje'),
(5,'pasear'),
(6,'video juegos'),
(7,'ver televición'),
(8,'arte'),
(9,'tecnologia'),
(10,'idiomas');

insert into Institucion (nombre, idUbicacion, tipo) values
(1,1,'Privada'),
(2,2,'Publica'),
(3,3,'Privada'),
(4,4,'Publica'),
(5,5,'Privada'),
(6,6,'Privada'),
(7,7,'Publica'),
(8,8,'Publica'),
(9,9,'Privada'),
(10,10,'Publica');

insert into PlanSemana (semana, idPeriodoLectivo, idAsignatura, estado, codigo, objetivo) values
(1,1,1,true,'DS_MD_1','Introducción'),
(2,1,1,true,'DS_MD_1','Desarrollo'),
(3,1,1,true,'DS_MD_1','Realización de preguntas'),
(4,1,1,true,'DS_MD_1','Practica'),
(5,1,1,true,'DS_MD_1','Finalización');

insert into PlanSemanaActividades (detalle, idPlanSemana) values
('Introducción',1),
('Desarrollo',2),
('Realización de preguntas',3),
('Practica',4),
('Finalización',5);

insert into PlanSemanaAplicacion (idSilaboResultados, idPlanSemana) values
(1,1),
(2,2),
(3,3),
(4,4),
(5,5);

insert into PlanSemanaDesarrolloClase (detalle, tiempo, idPlanSemana) values 
('Recordar temas ya vistos',2,1),
('Desarrollar los temas',2,2),
('Responder preguntas planteadas',2,3),
('Aplicación de conocimientos',2,4),
('Finalizacion de los temas',2,5);

insert into PlanSemanaEjeTransversal (detalle, idPlanSemana) values
('Teoria de conjuntos',1),
('Ecuaciones de segundo grado',2),
('Programación basica',3),
('JavaScript',4),
('Html-MySQL',5);

insert into PlanSemanaMetodologia (idSilaboMetodologia, idPlanSemana) values
(1,1),
(3,2),
(2,3),
(3,4),
(1,5);

insert into PlanSemanaObjetivo (objetivo1, objetivo2, objetivo3, objetivo4, idPlanSemana) values
('Impartir conocimiento','Desarrollar abilidades','Generar curiosidad','Aclarar dudas',1),
('Impartir conocimiento','Desarrollar abilidades','Generar curiosidad','Aclarar dudas',2),
('Impartir conocimiento','Desarrollar abilidades','Generar curiosidad','Aclarar dudas',3),
('Impartir conocimiento','Desarrollar abilidades','Generar curiosidad','Aclarar dudas',4),
('Impartir conocimiento','Desarrollar abilidades','Generar curiosidad','Aclarar dudas',5);

insert into PlanSemanaPrerrequisitos (detalle, idPlanSemana) values
('Matematica basica',1),
('Algebra',2),
('Informatica basica',3),
('Programación basica',4),
('Lenguaje de programación',5);

insert into PlanSemanaRecursoDidactico (idSilaboRecursoDidactico, idPlanSemana) values
(5,1),
(1,2),
(4,3),
(2,4),
(3,5);

insert into PlanSemanaSubTema (detalle, idPlanSemana) values
('Uniones e interserciones',1),
('Problemas matematicos',2),
('For,unshift,shift',3),
('Swich, while, recursividad',4),
('Formato HTML5',5);

insert into PlanSemanaTecnicaEvaluacion (idTecnicasEvaluacion, idPlanSemana) values
(2,1),
(5,2),
(2,3),
(3,4),
(1,5);

insert into PlanSemanaTema (detalle, idPlanSemana) values
('Conjuntos',1),
('Ecuaciones',2),
('Programación',3),
('Lenguaje de programación',4),
('MySQL',5);

insert into RecursosDidacticos (tipoMaterial, material) values
('Dicactico','libros, carteles, etc.'),
('Tecnologico','infocus, computadoes, etc.'),
('Entretenimiento','Celulares, actividades grupales, etc');

insert into RelacionPerfilResultado (idSilaboResultados, idPerfilEgreso, contribucion) values
(1,1,'Donaciones'),
(3,2,'Colaboraciones'),
(1,3,'Donaciones'),
(2,4,'Colaboraciones'),
(1,5,'Donaciones');

insert Into TecnicaEvaluacion(id,detalle) values
(1,'Trabajos en clase'),
(2,'Lecciones Escritas'),
(3,'Leccion oral'),
(4,'Trabajos en grupo'),
(5,'Horas Autonomas');

insert into VerboBloom (detalle, idPadre) values
('Cambiar','Comprención'),
('Confirmar','Comprención'),
('Ilustrar','Comprención'),
('Parear','Comprención'),
('Reestablecer','Comprención'),
('Expresar','Comprención'),
('Identificar','Comprención'),
('Transformar','Comprención'),
('Parafrasear','Comprención'),
('Extender','Comprención'),
('Relacionar','Comprención'),
('Inferir','Comprención'),
('Generalizar','Comprención'),
('Defender','Comprención'),
('Distingir','Comprención'),
('Comparar','Comprención'),
('Resumir','Comprención'),
('Predecir','Comprención'),
('Explicar','Comprención'),
('Aplicar','Aplicación'),
('Interpretar','Aplicación'),
('Cambiar','Aplicación'),
('Construir','Aplicación'),
('Escoger','Aplicación'),
('Modificar','Aplicación'),
('Clasificar','Aplicación'),
('Pintar','Aplicación'),
('Descubir','Aplicación'),
('Preparar','Aplicación'),
('Dramatizar','Aplicación'),
('Reportar','Aplicación'),
('Dibujar','Aplicación'),
('Enseñar','Aplicación'),
('Analizar','Análisis'),
('Categorizar','Análisis'),
('Clasificar','Análisis'),
('Identificar','Análisis'),
('Comparar','Análisis'),
('Construir','Análisis'),
('Distingir','Análisis'),
('Examinar','Análisis'),
('Simplificar','Análisis'),
('Inferir','Análisis'),
('Investigar','Análisis'),
('Separar','Análisis'),
('Dividir','Análisis'),
('Relacionar','Análisis'),
('Desarrolar','Síntesis'),
('Crear','Síntesis'),
('Originar','Síntesis'),
('Planificar','Síntesis'),
('Producir','Síntesis'),
('Diseñar','Síntesis'),
('Hipotetizar','Síntesis'),
('Combinar','Síntesis'),
('Inventar','Síntesis'),
('Organizar','Síntesis'),
('Evaluar','Evaluación'),
('Juzgar','Evaluación'),
('Informar','Evaluación'),
('Criticar','Evaluación'),
('Comparar','Evaluación'),
('Recomendar','Evaluación'),
('Relacionar','Evaluación'),
('Ponderar','Evaluación'),
('Considerar','Evaluación'),
('Evaluar','Evaluación'),
('Establecer','Evaluación'),
('Definir','Conocimiento'),
('Escribir','Conocimiento'),
('Dibujar','Conocimiento'),
('Identificar','Conocimiento'),
('Clasificar','Conocimiento'),
('Memorizar','Conocimiento'),
('Nombrar','Conocimiento'),
('Recitar','Conocimiento'),
('Reconocer','Conocimiento'),
('Decir','Conocimiento'),
('Selcionar','Conocimiento'),
('Escribir','Conocimiento'),
('Nombrar','Conocimiento');