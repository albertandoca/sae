Use ignug;
Select Asignatura.nombre, AsignaturaPrerrequisito.id from AsignaturaPrerrequisito
Inner Join Asignatura on AsignaturaPrerrequisito.idAsignaturaPrerequisito = Asignatura.id
Where AsignaturaPrerrequisito.idAsignatura;


