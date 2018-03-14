Use ignug;
Select Asignatura.nombre, AsignaturaPrerrequisito.id from AsignaturaPrerrequisito
Inner Join Asignatura on AsignaturaPrerrequisito.idAsignaturaPrerrequisito = Asignatura.id
Where AsignaturaPrerrequisito.idAsignatura;


