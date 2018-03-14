select Carrera.nombre, Modalidad.descripcion, Persona.nombre1, Persona.apellido1 from Asignatura 
inner join Malla on Asignatura.idMalla = Malla.id
inner join DocenteAsignatura on DocenteAsignatura.idAsignatura = Asignatura.id
inner join Carrera on Malla.idCarrera = Carrera.id
inner join Modalidad on Carrera.idModalidad= Modalidad.id
inner join Docente on DocenteAsignatura.idDocente = Docente.id
inner join Persona on Docente.idPersona = Persona.id;