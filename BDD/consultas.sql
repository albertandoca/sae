Actualizar 

Asignatura Correquisito

Use ignug;
Select Asignatura.nombre, AsignaturaCorrequisito.id from AsignaturaCorrequisito
Inner Join Asignatura on AsignaturaCorrequisito.idAsignaturaCorrequisito = Asignatura.id
Where AsignaturaCorrequisito.idAsignatura;

Asignatura Prerrequisito
Use ignug;
Select Asignatura.nombre, AsignaturaPrerrequisito.id from AsignaturaPrerrequisito
Inner Join Asignatura on AsignaturaPrerrequisito.idAsignaturaPrerrequisito = Asignatura.id
Where AsignaturaPrerrequisito.idAsignatura;

Descripcion Asignatura
Use ignug;
Select Asignatura.nombre, Silabo.id from Silabo
Inner Join Asignatura on Silabo.id = Asignatura.id
Where Silabo.idAsignatura;


