USE ignug;
INSERT INTO Asignatura ( idMalla, codigo, nombre, nivel, horasPractica, horasDocente, horasAutonomas, idUnidadOrganizacion, idCampoFormacion) VALUES
(2,'DS_MD_1','Matemática discreta','1','0','48','27','1','1'),
(2,'DS_IDS_1','Introducción al desarrollo de software','1','12','60','27','2','2'),
(2,'DS_DP_1','Desarrolo del pensamiento','1','0','36','36','3','3'),
(2,'DS_FP_1','Fundamentos de programación','1','24','72','32','3','3'),
(2,'DS_ADS_1','Análisis y diseño de sistemas','1','0','60','32','4','4'),
(2,'DS_IA1_1','Ingles A1','1','0','48','36','5','5'),
(2,'DS_AT_2','Álgebra y trigonometría','2','0','48','27','6','6'),
(2,'DS_BD_2','Base de datos','2','24','60','25','7','7'),
(2,'DS_POO_2','Programación orientada a objetos','2','24','72','32','8','8'),
(2,'DS_MDS_2','Metodologías de desrrollo de software','2','12','60','20','9','9'),
(2,'DS_LC_2','Lenguaje y comunicación','2','0','36','25','10','10'),
(2,'DS_IA2_2','Ingles A2','2','0','48','27','11','11'),
(2,'DS_CDI_3','Cálculo diferencial e integral','3','0','48','32','12','12'),
(2,'DS_BDA_3','Base de datos avanzada','3','24','48','32','13','13'),
(2,'DS_FA_3','Fundamentos de administración','3','0','24','25','14','14'),
(2,'DS_PV_3','Programación visual','3','36','60','20','15','15'),
(2,'DS_DI_3','Diseño de interfaz','3','36','60','20','16','16'),
(2,'DS_IB1_3','Ingles B1.1','3','0','48','27','17','17'),
(2,'DS_ED_4','Estadística descriptiva','4','0','48','26','18','18'),
(2,'DS_LJ_4','Legislación informatica','4','0','48','26','19','19'),
(2,'DS_PAW_4','Programación de aplicaciones web','4', '24','60','38','20','20'),
(2,'DS_DAM_4','Desarrollo de apliaciones moviles','4','24','72','37','21','21'),
(2,'DS_IB2_4','Ingles B1.2','4','0','48','27','22','22'),
(2,'DS_DC_4','Diversidad y cultura','4','0','36','26','23','23'),
(2,'DS_CS_5','Calidad del software','5','24','60','6','24','24'),
(2,'DS_E_5','Emprendimiento','5','0','36','5','25','25'),
(2,'DS_PT_5','Proyecto de titulación','5', NULL, NULL, NULL,'26','26'),
(2,'DS_TAP_5','Tendencias actuales de programación','5','24','60','6','27','27'),
(2,'DS_FRC_5','Fundamentos de redes y conectividaad','5','12','60','6','28','28'),
(2,'DS_EP_5','Ética profesional','5','0','36','5','29','29');

SELECT * FROM ignug.Asistencia;
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
(10 ,"2018-03-14",10);

SELECT * FROM ignug.Aula;
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

SELECT * FROM ignug.ExperienciaLaboral;
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
(1,"2017-08-12",1),
(2,"2017-01-12",1),
(3,"2017-10-02",1),
(4,"2018-01-22",1);

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

