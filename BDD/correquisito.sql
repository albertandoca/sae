Use ignug;
Select Asignatura.nombre, AsignaturaCorrequisito.id from AsignaturaCorrequisito
Inner Join Asignatura on AsignaturaCorrequisito.idAsignaturaCorrequisito = Asignatura.id
Where AsignaturaCorrequisito.idAsignatura;