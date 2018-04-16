Use ignug;
Select Asignatura.nombre, AsignaturaCorrequisito.id from AsignaturaCorrequisito
Inner Join Asignatura on AsignaturaCorrequisito.idAsignaturaCorrequisito = Asignatura.id
Where AsignaturaCorrequisito.idAsignatura;


Select Asignatura.nombre, AsignaturaPrerrequisito.id from AsignaturaPrerrequisito
Inner Join Asignatura on AsignaturaPrerrequisito.idAsignaturaPrerequisito = Asignatura.id
Where AsignaturaPrerrequisito.idAsignatura;


Select Asignatura.nombre, Silabo.id from Silabo
Inner Join Asignatura on Silabo.id = Asignatura.id
Where Silabo.idAsignatura;


