Use ignug;
Select Asignatura.nombre, Silabo.id from Silabo
Inner Join Asignatura on Silabo.id = Asignatura.id
Where Silabo.idAsignatura;