SELECT * FROM ignug.Silabo;
insert into Silabo (idAsignatura, idPeriodoLectivo, descripcion, objetivo1, objetivo2, objetivo3, objetivo4, codigo, estado) values (1, 2,'Las matemáticas discretas son un área de las matemáticas encargadas del estudio de los conjuntos discretos: finitos o infinitos numerables.', 'Al terminar el curso el alumno conocerá', 'las técnicas y métodos del área de matemáticas discretas', ' más
importantes,', ' y será capaz de aplicarlos en la solución de problemas específicos. ', 'DS001', '1');
insert into Silabo (idAsignatura, idPeriodoLectivo, descripcion, objetivo1, objetivo2, objetivo3, objetivo4, codigo, estado) values 
(2, 1,'Una metodología nos ordena, nos contiene, nos permite definir límites. Construir software complejo requiere un gran esfuerzo: tecnología, dinero y sobre todo: personas. Personas que interactúan entre sí, con diferentes grados de conocimiento, con diferentes roles, con diferentes intereses. ', 'Preparar', 'a los estudiantes para el desarrollo de software', 'mediante temas poco complicados', 'para  adquisición por parte del estudiante de una formación avanzada, de carácter especializado y multidisciplinar, orientada a la especialización académica o profesional', 'M001', '1');
insert into Silabo (idAsignatura, idPeriodoLectivo, descripcion, objetivo1, objetivo2, objetivo3, objetivo4, codigo, estado) values 
(3, 1,'Fundamentos de Programación es una asignatura básica que permite crear programas que exhiban un comportamiento deseado. El proceso de escribir código requiere frecuentemente conocimientos en varias áreas distintas, además del dominio del lenguaje a utilizar, algoritmos especializados y lógica formal.',
'Preparar','a los estudiantes para que  sean capaces de resolver de manera eficaz',
' distintos problemas de carácter general, con independencia del lenguaje de programación utilizado',
'y asi  adquieran el conocimiento teórico y práctico sobre las técnicas básicas de programación estructurada', 'T001', '1');
select * from Silabo;
insert into SilaboUnidades (idSilabo, descripcion, codigo) values (1, 'Conjuntos', 001);
insert into SilaboUnidades (idSilabo, descripcion, codigo) values (1, 'Relaciones, aplicaciones y funciones', 002);
insert into SilaboUnidades (idSilabo, descripcion, codigo) values (1, 'Combinatoria', 003);
insert into SilaboUnidades (idSilabo, descripcion, codigo) values (1, ' Inducción', 004);
insert into SilaboUnidades (idSilabo, descripcion, codigo) values (1, ' Aritmética modular', 005);
insert into SilaboUnidades (idSilabo, descripcion, codigo) values (2, ' Introducción a la programación', 001);
insert into SilaboUnidades (idSilabo, descripcion, codigo) values (2, 'La programación estructurada', 002);
insert into SilaboUnidades (idSilabo, descripcion, codigo) values (2, 'Programación avanzada en C. Desarrollo eficiente de aplicaciones ', 003);
insert into SilaboUnidades (idSilabo, descripcion, codigo) values (2, 'Programación orientada a objetos en C++ ', 004);
insert into SilaboUnidades (idSilabo, descripcion, codigo) values (3, 'Contextualización ', 001);
insert into SilaboUnidades (idSilabo, descripcion, codigo) values (3, 'Competencias ', 002);
insert into SilaboUnidades (idSilabo, descripcion, codigo) values (3, ' Prerrequisitos ', 003);
insert into SilaboUnidades (idSilabo, descripcion, codigo) values (3, ' .Bloques y temas de contenidos ', 004);