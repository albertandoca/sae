CREATE DATABASE ignug DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;

USE ignug;

CREATE TABLE LogMailSender (
   id INT NOT NULL AUTO_INCREMENT,
   fecha DATETIME NULL,
   FromEmail VARCHAR(1024) NULL,
   FromAlias VARCHAR(1024) NULL,
   ReplyEmail VARCHAR(1024) NULL,
   ReplyAlias VARCHAR(1024) NULL,
   ToEmail VARCHAR(1024) NULL,
   ToAlias VARCHAR(1024) NULL,
   Asunto VARCHAR(1024) NULL,
   Mensaje TEXT NULL,
   EstadoEnvio VARCHAR(20) NULL,
   PRIMARY KEY (id)
);

CREATE TABLE RolSecundario (
   id INT NOT NULL AUTO_INCREMENT,
   idPersona INT NULL,
   idRol INT NULL,
   PRIMARY KEY (id)
);

CREATE TABLE FotoPerfil (
	id INT NOT NULL AUTO_INCREMENT,
    idPersona INT NULL,
    tipoArchivo VARCHAR(255) NULL,
    nombreArchivo VARCHAR(255) NULL,
    adjunto LONGBLOB NULL,
    PRIMARY KEY (id)
);

CREATE TABLE HorasClase (
   id INT NOT NULL AUTO_INCREMENT,
   idAsignatura INT NULL,
   idParalelo INT NULL,
   fecha DATETIME NULL,
   horas INT NULL,
   PRIMARY KEY (id)
);

CREATE TABLE Cuenta (
    id INT NOT NULL AUTO_INCREMENT,
    idRol INT NULL,
    idPersona INT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE CarreraInstituto (
    id INT NOT NULL AUTO_INCREMENT,
    idCarrera INT NULL,
    idInstituto INT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE Roles (
	id INT NOT NULL AUTO_INCREMENT,
	descripcion VARCHAR(255) NULL,
	acceso INT NULL,
PRIMARY KEY (id));

CREATE TABLE Persona (
	id INT NOT NULL AUTO_INCREMENT,
    identificacion VARCHAR(20) NULL,
    nombre1 VARCHAR(100) NULL,
    nombre2 VARCHAR(100) NULL,
    apellido1 VARCHAR(100) NULL,
    apellido2 VARCHAR(100) NULL,
    fechaNacimiento DATETIME NULL,
    telefonoCelular VARCHAR(15) NULL,
    telefonoDomicilio VARCHAR(15) NULL,
    correoElectronicoInstitucional VARCHAR(255) NULL,
    correoElectronicoPersonal VARCHAR(255) NULL,
    idGenero INT NULL,
    idUbicacionDomicilioPais VARCHAR(20) NULL,
    idUbicacionDomicilioProvincia VARCHAR(20) NULL,
    idUbicacionDomicilioCanton VARCHAR(20) NULL,
    idUbicacionDomicilioParroquia VARCHAR(20) NULL,
    direccionDomicilio VARCHAR(255) NULL,
    idEstadoCivil INT NULL,
    idUbicacionNacimientoPais VARCHAR(20) NULL,
    idUbicacionNacimientoProvincia VARCHAR(20) NULL,
    idUbicacionNacimientoCanton VARCHAR(20) NULL,
    idUbicacionNacimientoParroquia VARCHAR(20) NULL,
    idIngresos DOUBLE NULL,
    idEtnia INT NULL,
    idTipoSangre INT NULL,
    numeroHijos INT NULL,
    idOcupacion INT NULL,
    carnetConadis VARCHAR(20) NULL,
    idTipoDiscapacidad INT NULL,
    porcentajeDiscapacidad DOUBLE NULL,
    nombrePadre VARCHAR(255) NULL,
    paisOrigenPadre INT NULL,
    idNivelEstudioPadre INT NULL,
    nombreMadre VARCHAR(255) NULL,
    paisOrigenMadre INT NULL,
    idNivelEstudioMadre INT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE Etnia (
	id INT NOT NULL AUTO_INCREMENT,
    descripcion VARCHAR(20) NULL,
    PRIMARY KEY (id)
);

CREATE TABLE TipoIngresos (
	id INT NOT NULL AUTO_INCREMENT,
    descripcion VARCHAR(20) NULL,
    PRIMARY KEY (id)
);

CREATE TABLE TipoSangre (
	id INT NOT NULL AUTO_INCREMENT,
    descripcion VARCHAR(20) NULL,
    PRIMARY KEY (id)
);

CREATE TABLE Ubicacion(
	id INT NOT NULL AUTO_INCREMENT,
    codigo VARCHAR(20) NULL,
    descripcion VARCHAR(255) NULL,
    codigoPadre VARCHAR(20) NULL,
    PRIMARY KEY (id)
);

CREATE TABLE Estudiante(
	id INT NOT NULL AUTO_INCREMENT,
    idPersona INT NULL,
    notaPostulacion DOUBLE NULL,
    tituloBachiller VARCHAR(1024) NULL,
    idTipoInstitucionProcedencia INT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE TipoInstitucionProcedencia(
	id INT NOT NULL AUTO_INCREMENT,
    descripcion VARCHAR(255) NULL,
    PRIMARY KEY (id)
);

CREATE TABLE DatosEstudiante(
	id INT NOT NULL AUTO_INCREMENT,
    idEstudiante INT NULL,
    descripcion VARCHAR(255) NULL,
    dato VARCHAR(255) NULL,
    PRIMARY KEY (id)
);

CREATE TABLE Jornada(
	id INT NOT NULL AUTO_INCREMENT,
    descripcion VARCHAR(255) NULL,
    PRIMARY KEY (id)
);

CREATE TABLE ExperienciaLaboral (
	id INT NOT NULL AUTO_INCREMENT,
    idPersona INT NULL,
    fechaInicio DATETIME NULL,
    fechaFin DATETIME NULL,
    descripcionCargo VARCHAR(1024) NULL,
    descripcionFunciones VARCHAR(1024) NULL,
    nombreEmpresa VARCHAR(255) NULL,
    idMotivoSalida INT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE MotivoSalida(
	id INT NOT NULL AUTO_INCREMENT,
    descripcion VARCHAR(255) NULL,
    PRIMARY KEY (id)
);

CREATE TABLE EducacionContinua(
	id INT AUTO_INCREMENT NOT NULL,
	descripcion varchar(255) NULL,
	horas INT NULL,
	fechaInicio DATETIME NULL,
	fechaFin DATETIME NULL,
	idTipoEducacionContinua VARCHAR(255) NULL,
	lugar VARCHAR(255) NULL,
PRIMARY KEY (id));

CREATE TABLE TipoEducacionContinua(
	id INT AUTO_INCREMENT NOT NULL,
	descripcion varchar(255) NULL,
PRIMARY KEY (id));


CREATE TABLE Aula(
	id INT AUTO_INCREMENT NOT NULL,
	capacidad INT NULL,
	descripcion VARCHAR(255) NULL,
	idTipoAula INT NULL,
PRIMARY KEY (id));

CREATE TABLE TipoAula(
	id INT AUTO_INCREMENT NOT NULL,
	descripcion varchar(255) NULL,
PRIMARY KEY (id));

CREATE TABLE Genero(
	id INT AUTO_INCREMENT NOT NULL,
	descripcion varchar(255) NULL,
PRIMARY KEY (id));

CREATE TABLE Contacto(
	id INT AUTO_INCREMENT NOT NULL,
    idPersona INT NULL,
	descripcion VARCHAR(255) NULL,
	contacto VARCHAR(255) NULL,
PRIMARY KEY (id));

CREATE TABLE Titulo(
	id INT AUTO_INCREMENT NOT NULL,
	idPersona INT NULL,
	idInstitucion INT NULL,
	codigoRegistro VARCHAR(255) NULL,
	idNivelTitulo INT NULL,
PRIMARY KEY(id));

CREATE TABLE Requisito(
	id INT AUTO_INCREMENT NOT NULL,
	idAsignaturaDependiente INT NULL,
	idAsignaturaIndependiente INT NULL,
	idTipoRequisito VARCHAR(255) NULL,
PRIMARY KEY(id));

CREATE TABLE TipoRequisito(
	id INT AUTO_INCREMENT NOT NULL,	
	descripcion VARCHAR(255)NULL,
PRIMARY KEY (id));

CREATE TABLE Malla(
	id INT AUTO_INCREMENT NOT NULL,
	fechaMallaInicio DATETIME NULL,
	fechaMallaFin DATETIME NULL,
	idCarrera INT NULL,
	idDocResolucion INT NULL,
PRIMARY KEY(id));

CREATE TABLE Documento(
	id INT AUTO_INCREMENT NOT NULL,
	documento VARCHAR(255)NULL,
	descripcion VARCHAR(255)NULL,
PRIMARY KEY (id));

CREATE TABLE Ocupacion(
	id INT AUTO_INCREMENT NOT NULL,
	descripcion VARCHAR(255)NULL,
PRIMARY KEY (id));

CREATE TABLE NivelTitulo(
	id INT AUTO_INCREMENT NOT NULL,
	descripcion VARCHAR(255)NULL,
PRIMARY KEY (id));

CREATE TABLE Carrera(
	id INT NOT NULL AUTO_INCREMENT,
	resolucion VARCHAR(255) NULL,
	nombre VARCHAR(255) NULL,
	descripcion VARCHAR(255) NULL,
    idModalidad INT NULL,
    idInstituto INT NULL,
    siglas VARCHAR(20) NULL,
PRIMARY KEY (id));

CREATE TABLE Instituto(
	id INT NOT NULL AUTO_INCREMENT,
	descripcion VARCHAR(255) NULL,
<<<<<<< HEAD:BDD/1 bdd.sql
    ruc VARCHAR(13) NULL,
    direccion VARCHAR(255) NULL,
    telefono1 VARCHAR(10) NULL,
    telefono2 VARCHAR(10) NULL,
    resolución VARCHAR(50) NULL,
=======
<<<<<<< HEAD
=======
    ruc VARCHAR(13) NOT NULL,
    direccion VARCHAR(255) NOT NULL,
    telefono1 VARCHAR(10) NOT NULL,
    telefono2 VARCHAR(10) NOT NULL,
    resolución VARCHAR(50) NOT NULL,
>>>>>>> 992520fae1c452f0b4a142caf9755559910792c8
>>>>>>> 3491fab01e24f31352e930441b90a5392d70e3b4:BDD/bdd.sql
    color VARCHAR(255) NULL,
PRIMARY KEY (id));

CREATE TABLE JornadaCarrera(
	id INT NOT NULL AUTO_INCREMENT,
    idJornada INT NULL,
    idCarrera INT NULL,
PRIMARY KEY (id));

CREATE TABLE Cupo(
	id INT NOT NULL AUTO_INCREMENT,
    idJornadaCarrera INT NULL,
    idPersona INT NULL,
    idEstadoCupo INT NULL,
    idPeriodoLectivo INT NULL,
    fecha DATE NULL,
PRIMARY KEY (id));

CREATE TABLE EstadoCupo(
	id INT NOT NULL AUTO_INCREMENT,
    descripcion VARCHAR(255) NULL,
PRIMARY KEY (id));

CREATE TABLE Modalidad(
	id INT NOT NULL AUTO_INCREMENT,
    descripcion VARCHAR(255) NULL,
PRIMARY KEY (id));

CREATE TABLE Enfermedad(
	id INT NOT NULL AUTO_INCREMENT,
    descripcion VARCHAR(255) NULL,
    observaciones VARCHAR(1024) NULL,
    tratamiento VARCHAR(255) NULL,
PRIMARY KEY (id));

CREATE TABLE EstadoCivil(
	id INT NOT NULL AUTO_INCREMENT,
    descripcion VARCHAR(255) NULL,
PRIMARY KEY (id));

CREATE TABLE Hobbies(
	id INT NOT NULL AUTO_INCREMENT,
    idPersona INT NULL,
    descripcion VARCHAR(255) NULL,
PRIMARY KEY (id));

CREATE TABLE Institucion(
	id INT NOT NULL AUTO_INCREMENT,
    nombre INT NULL,
    idUbicacion INT NULL,
    tipo VARCHAR(255) NULL,
PRIMARY KEY (id));

CREATE TABLE Estado(
	id INT NOT NULL AUTO_INCREMENT,
    descripcion VARCHAR(255) NULL,
PRIMARY KEY (id));

CREATE TABLE Discapacidad(
	id INT NOT NULL AUTO_INCREMENT,
    idPersona INT NULL,
    idTipoDiscapacidad VARCHAR(255) NULL,
    porcentaje DOUBLE NULL,
PRIMARY KEY (id));

CREATE TABLE TipoDiscapacidad(
	id INT NOT NULL AUTO_INCREMENT,
    descripcion VARCHAR(255) NULL,
PRIMARY KEY (id));

CREATE TABLE Docente(
	id INT NOT NULL AUTO_INCREMENT,
    idPersona INT NULL,
    fechaInicio DATETIME NULL,
    idEstado INT NULL,
PRIMARY KEY (id));

CREATE TABLE SolicitudMatricula(
	id INT NOT NULL AUTO_INCREMENT,
    codigo VARCHAR(255) NULL,
    fecha DATETIME NULL,
    idPeriodoLectivo INT NULL,
    idEstadoSolicitud INT NULL,
    idPersona INT NULL,
    idCarrera INT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE AsignaturaSolicitudMatricula(
	id INT NOT NULL AUTO_INCREMENT,
    idSolicitudMatricula INT NULL,
    idAsignatura INT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE AsignaturaCupo(
	id INT NOT NULL AUTO_INCREMENT,
    idCupo INT NULL,
    idAsignatura INT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE EstadoSolicitud(
	id INT NOT NULL AUTO_INCREMENT,
    descripcion VARCHAR(255) NULL,
PRIMARY KEY (id));

CREATE TABLE PeriodoLectivo(
	id INT NOT NULL AUTO_INCREMENT,
    descripcion VARCHAR(255) NULL,
    fechaInicio DATETIME NULL,
    fechaFin DATETIME NULL,
    matriculable BOOLEAN NULL,
    codigo VARCHAR(255) NULL,
PRIMARY KEY (id));

CREATE TABLE PeriodoAcademico(
	id INT NOT NULL AUTO_INCREMENT,
    descripcion VARCHAR(255) NULL,
PRIMARY KEY (id));

CREATE TABLE Parcial(
	id INT NOT NULL AUTO_INCREMENT,
    descripcion VARCHAR(255) NULL,
PRIMARY KEY (id));

CREATE TABLE Notas(
	id INT NOT NULL AUTO_INCREMENT,
    idParcial INT NULL,
    idMatriculaAsignatura INT NULL,
PRIMARY KEY (id));

CREATE TABLE Ponderacion(
	id INT NOT NULL AUTO_INCREMENT,
    idCategoria INT NULL,
    idParcial INT NULL,
    porcentaje DOUBLE NULL,
PRIMARY KEY (id));

CREATE TABLE DocenteAsignatura(
	id INT NOT NULL AUTO_INCREMENT,
    idDocente INT NULL,
    idPeriodoLectivo INT NULL,
    idAsignatura INT NULL,
	idParalelo INT NULL,
PRIMARY KEY (id));

CREATE TABLE AulasAsignaturas(
	id INT NOT NULL AUTO_INCREMENT,
    idAula INT NULL,
    idDocenteAsignatura INT NULL,
PRIMARY KEY (id));

CREATE TABLE CategoriaNota(
	id INT NOT NULL AUTO_INCREMENT,
    descripcion VARCHAR(255) NULL,
PRIMARY KEY (id));

CREATE TABLE DetalleNotas(
	id INT NOT NULL AUTO_INCREMENT,
    descripcion VARCHAR(255) NULL,
    nota DOUBLE NULL,
    idCateogiraNota INT NULL,
    idNota INT NULL,
PRIMARY KEY (id));

CREATE TABLE MatriculaAsignatura(
	id INT NOT NULL AUTO_INCREMENT,
    idMatricula INT NULL,
    idAsignatura INT NULL,
    idParalelo INT NULL,
PRIMARY KEY (id));

CREATE TABLE Paralelo(
	id INT NOT NULL AUTO_INCREMENT,
    descripcion VARCHAR(255) NULL,
PRIMARY KEY (id));

CREATE TABLE Matricula(
	id INT NOT NULL AUTO_INCREMENT,
    codigo VARCHAR(255) NULL,
    fecha DATETIME NULL,
    idPeriodoLectivo INT NULL,
    idPersona INT NULL,
    idCarrera INT NULL,
    numeroMatricula VARCHAR(255) NULL,
    folio VARCHAR(255) NULL,
    idJornada INT NULL,
PRIMARY KEY (id));

CREATE TABLE Asistencia(
	id INT NOT NULL AUTO_INCREMENT,
    idMatriculaAsignatura INT NULL,
    fecha DATETIME NULL,
    horas INT NULL,
PRIMARY KEY (id));

CREATE TABLE EstadoPersona(
	id INT NOT NULL AUTO_INCREMENT,
    idPersona INT NULL,
    datosCompletos BOOLEAN NULL,
    edicionDeDatos VARCHAR(20) NULL,
    encuestaFactoresAsociados BOOLEAN NULL,
PRIMARY KEY (id));

CREATE TABLE HorasClaseDia (
   id INT NOT NULL AUTO_INCREMENT,
   idDocenteAsignatura INT NULL,
   idDiaSemana INT NULL,
   idTipoAula INT NULL,
   numeroHoras INT NULL,
   PRIMARY KEY (id)
);

CREATE TABLE DiaSemana (
   id INT NOT NULL AUTO_INCREMENT,
   descripcion VARCHAR(10) NULL,
   PRIMARY KEY (id)
);

CREATE TABLE fechaEvaluacionesParciales (
   id INT NOT NULL AUTO_INCREMENT,
   fechaParcial1 DATE NULL,
   fechaEvaluacionParcial1 DATE NULL,
   fechaEvaluacionParcial2 DATE NULL,
   idMalla INT NULL,
   idPeriodoLectivo INT NULL,
   PRIMARY KEY (id)
);

<<<<<<< HEAD

/* tablas portafolio docente */
=======
/* Tablas para portafolio docente */
>>>>>>> 992520fae1c452f0b4a142caf9755559910792c8

CREATE TABLE Asignatura (
	id INT AUTO_INCREMENT NOT NULL,
	idMalla INT NULL,
	codigo VARCHAR(255) NULL,
	nombre VARCHAR (255) NULL,
<<<<<<< HEAD
	idPeriodoAcademico INT NULL,
=======
	nivel INT NULL,
>>>>>>> 992520fae1c452f0b4a142caf9755559910792c8
    horasPractica INT NULL,
    horasDocente INT NULL,
    horasAutonomas INT NULL,
    idUnidadOrganizacion INT NULL,
    idCampoFormacion INT NULL,
<<<<<<< HEAD
    credito INT NULL,
=======
>>>>>>> 992520fae1c452f0b4a142caf9755559910792c8
    PRIMARY KEY(id)
);

CREATE TABLE UnidadOrganizacion (
     id INT AUTO_INCREMENT NOT NULL,
     descripcion VARCHAR(255) NULL,
     PRIMARY KEY(id)
);

CREATE TABLE CampoFormacion (
     id INT AUTO_INCREMENT NOT NULL,
     descripcion VARCHAR(255) NULL,
     PRIMARY KEY(id)
);

CREATE TABLE AsignaturaPrerrequisito (
     id INT AUTO_INCREMENT NOT NULL,
     idAsignatura INT NULL,
     idAsignaturaPrerequisito INT NULL,
     PRIMARY KEY(id)
);

CREATE TABLE AsignaturaCorrequisito (
     id INT AUTO_INCREMENT NOT NULL,
     idAsignatura INT NULL,
     idAsignaturaCorrequisito INT NULL,
     PRIMARY KEY(id)
);
<<<<<<< HEAD
CREATE TABLE PortafolioDocente (
    id INT AUTO_INCREMENT NOT NULL,
    idComponentePd INT NULL,
    idAsignatura INT NULL,
    idEstadoComponentePd INT NULL,
    idPeriodoLectivo INT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE ComponentePd (
    id INT AUTO_INCREMENT NOT NULL,
    componente VARCHAR(100) NULL,
    estado INT NULL,
    PRIMARY KEY(id)
);

SELECT PeriodoLectivo.id, PeriodoLectivo.descripcion, EstadoComponentePd.estadoComponente, PortafolioDocente.id FROM PortafolioDocente
INNER JOIN

CREATE TABLE EstadoComponentePd (
    id INT AUTO_INCREMENT NOT NULL,
    estadocomponente VARCHAR(100) NULL,
    estado INT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE PortafolioDocente (
    id INT AUTO_INCREMENT NOT NULL,
    idComponentePd INT NULL,
    idAsignatura INT NULL,
    idEstadoComponentePd INT NULL,
    idPeriodoLectivo INT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE ComponentePd (
    id INT AUTO_INCREMENT NOT NULL,
    componente VARCHAR(100) NULL,
    estado INT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE EstadoComponentePd (
    id INT AUTO_INCREMENT NOT NULL,
    estadoComponente VARCHAR(100) NULL,
    estado INT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE Silabo (
    id INT AUTO_INCREMENT NOT NULL,
    idPeriodoLectivo INT NULL,
    idAsignatura INT NULL,
    descripcion MEDIUMTEXT NULL,
    objetivoParte1 VARCHAR(255) NULL,
    objetivoParte2 TEXT NULL,
    objetivoParte3 TEXT NULL,
    objetivoParte4 TEXT NULL,
    codigo VARCHAR(255) NULL,
    idPortafolioDocente INT NULL,
<<<<<<< HEAD:BDD/1 bdd.sql
=======
=======

CREATE TABLE Silabo (
    id INT AUTO_INCREMENT NOT NULL,
    idPeriodoLectivo INT NOT NULL,
    idAsignatura INT NOT NULL,
    descripcion MEDIUMTEXT NOT NULL,
    objetivo1 VARCHAR(255) NOT NULL,
    objetivo2 TEXT NOT NULL,
    objetivo3 TEXT NOT NULL,
    objetivo4 TEXT NOT NULL,
    codigo VARCHAR(255) NOT NULL,
    estado INT NOT NULL,
>>>>>>> 992520fae1c452f0b4a142caf9755559910792c8
>>>>>>> 3491fab01e24f31352e930441b90a5392d70e3b4:BDD/bdd.sql
    PRIMARY KEY(id)
);

CREATE TABLE SilaboUnidades (
    id INT AUTO_INCREMENT NOT NULL,
    idSilabo INT NULL,
    descripcion TEXT NULL,
    codigo VARCHAR(3) NULL,
    PRIMARY KEY(id)
);

CREATE TABLE SilaboElementos (
    id INT AUTO_INCREMENT NOT NULL,
    idSilaboUnidades INT NULL,
    IdVerboBloom INT NULL,
    objeto TEXT NULL,
    condicion TEXT NULL,
    finalidad TEXT NULL,
    codigo VARCHAR(6) NULL,
    PRIMARY KEY(id)
);

CREATE TABLE VerboBloom (                   /*Tabla recursiba */
    id INT AUTO_INCREMENT NOT NULL,
<<<<<<< HEAD:BDD/1 bdd.sql
    descripcion VARCHAR(60) NULL,
    idPadre VARCHAR(20) NULL,
=======
<<<<<<< HEAD
    descripcion VARCHAR(60) NOT NULL,
=======
    detalle VARCHAR(60) NOT NULL,
>>>>>>> 992520fae1c452f0b4a142caf9755559910792c8
    idPadre VARCHAR(20) NOT NULL,
>>>>>>> 3491fab01e24f31352e930441b90a5392d70e3b4:BDD/bdd.sql
    PRIMARY KEY(id)
);

CREATE TABLE SilaboResultados (
    id INT AUTO_INCREMENT NOT NULL,
    idSilaboElementos INT NULL,
    IdVerboBloom INT NULL,
    objeto TEXT NULL,
    condicion TEXT NULL,
    finalidad TEXT NULL,
    codigo VARCHAR(9) NULL,
    PRIMARY KEY(id)
);

CREATE TABLE SilaboEvidenciasRa (
    id INT AUTO_INCREMENT NOT NULL,
    idSilaboResultados INT NULL,
    descripcion TEXT NULL,
    codigo VARCHAR(3) NULL,
    PRIMARY KEY(id)
);

<<<<<<< HEAD
CREATE TABLE ContenidosElementos (         /* Para Contenidos */
    id INT AUTO_INCREMENT NOT NULL,
    idSilaboUnidad INT NULL,
    semana INT NULL,
    contenido TEXT NULL,       /*Visualiza el campo OBJETO */
<<<<<<< HEAD:BDD/1 bdd.sql
    horasDocencia INT NULL,
    observaciones TEXT NULL,
=======
    horasDocencia INT NOT NULL,
=======
CREATE TABLE ContenidosUnidad (           /*Para Contenidos de la Unidad */
    id INT AUTO_INCREMENT NOT NULL,
    idSilaboUnidades INT NOT NULL,        /*Visualiza el campo DESCRIPCIÓn */
    codigo VARCHAR(3) NOT NULL,
    PRIMARY KEY(id) 
);

CREATE TABLE ContenidosElementos (         /* Para Contenidos */
    id INT AUTO_INCREMENT NOT NULL,
    idContenidoUnidad INT NOT NULL,
    semana INT NOT NULL,
    idSilaboElementos INT NOT NULL,       /*Visualiza el campo OBJETO */
>>>>>>> 992520fae1c452f0b4a142caf9755559910792c8
    observaciones TEXT NOT NULL,
>>>>>>> 3491fab01e24f31352e930441b90a5392d70e3b4:BDD/bdd.sql
    PRIMARY KEY(id)
);

<<<<<<< HEAD
CREATE TABLE ContenidosActividades (     /*Para Trabajo práctico y autónomo */
    id INT AUTO_INCREMENT NOT NULL,
    idContenidosElementos INT NULL,
    contenido TEXT NULL,
    idTipoContenidoActividad VARCHAR(50) NULL,            /*Docente, Práctico o Autónomo*/
    orden INT NULL,
    horasActividad INT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE TipoContenidoActividad (     /*Para Trabajo práctico y autónomo */
    id INT AUTO_INCREMENT NOT NULL,
    descripcion VARCHAR(50) NULL,            /*Docente, Práctico o Autónomo*/
=======
CREATE TABLE ContenidosDocente (           /*Para Actividad de Docencia */
    id INT AUTO_INCREMENT NOT NULL,
    idContenidoElementos INT NOT NULL,
    idSilaboResultados INT NOT NULL,      /*Visualiza el campo OBJETO */
    horasClase INT NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE ContenidosActividades (     /*Para Trabajo práctico y autónomo */
    id INT AUTO_INCREMENT NOT NULL,
    idContenidoElementos INT NOT NULL,
    idSilaboEvidenciasRa INT NOT NULL,
    tipo VARCHAR(50) NOT NULL,            /*Práctico o Autónomo*/
    horasClase INT NOT NULL,
>>>>>>> 992520fae1c452f0b4a142caf9755559910792c8
    PRIMARY KEY(id)
);

CREATE TABLE SilaboMetodologia (     
    id INT AUTO_INCREMENT NOT NULL,
    idSilabo INT NULL,
    idMetodologia INT NULL,    
    PRIMARY KEY(id)
);

CREATE TABLE Metodologia (     
    id INT AUTO_INCREMENT NOT NULL,
    estrategia VARCHAR(255) NULL,
    finalidad TEXT NULL,    
    PRIMARY KEY(id)
);

CREATE TABLE SilaboRecursoDidactico (     
    id INT AUTO_INCREMENT NOT NULL,
    idSilabo INT NULL,
    idRecursoDidactico INT NULL,    
    PRIMARY KEY(id)
);

CREATE TABLE RecursosDidacticos (     
    id INT AUTO_INCREMENT NOT NULL,
    tipoMaterial VARCHAR(255) NULL,
    material TEXT NULL,    
    PRIMARY KEY(id)
);

CREATE TABLE RelacionPerfilResultado (
    id INT AUTO_INCREMENT NOT NULL,
    idSilaboResultados INT NULL,
    idPerfilEgreso INT NULL,
    contribucion VARCHAR(50) NULL,
    PRIMARY KEY(id)
);

CREATE TABLE PerfilEgreso (
    id INT AUTO_INCREMENT NOT NULL,
<<<<<<< HEAD:BDD/1 bdd.sql
    idmalla INT NULL,
    descripcion VARCHAR(255) NULL,
=======
    idmalla INT NOT NULL,
<<<<<<< HEAD
    descripcion VARCHAR(255) NOT NULL,
=======
    detalle VARCHAR(255) NOT NULL,
>>>>>>> 992520fae1c452f0b4a142caf9755559910792c8
>>>>>>> 3491fab01e24f31352e930441b90a5392d70e3b4:BDD/bdd.sql
    PRIMARY KEY(id)
);

CREATE TABLE SilaboBiliografia (
    id INT AUTO_INCREMENT NOT NULL,
<<<<<<< HEAD:BDD/1 bdd.sql
    descripcion VARCHAR(255) NULL,
    tipo VARCHAR(50) NULL,       /* Básica o Complementaria */
=======
<<<<<<< HEAD
    descripcion VARCHAR(255) NOT NULL,
=======
    detalle VARCHAR(255) NOT NULL,
>>>>>>> 992520fae1c452f0b4a142caf9755559910792c8
    tipo VARCHAR(50) NOT NULL,       /* Básica o Complementaria */
>>>>>>> 3491fab01e24f31352e930441b90a5392d70e3b4:BDD/bdd.sql
    PRIMARY KEY(id)
);

CREATE TABLE PlanSemana (
    id INT AUTO_INCREMENT NOT NULL,
    semana INT NULL,
    idPeriodoLectivo INT NULL,
    idAsignatura INT NULL,
    estado INT NULL,
    codigo VARCHAR(255) NULL,
    objetivo TEXT NULL,
    PRIMARY KEY(id)
);


CREATE TABLE PlanSemanaTema (
    id INT AUTO_INCREMENT NOT NULL,
<<<<<<< HEAD:BDD/1 bdd.sql
    descripcion TEXT NULL,
    idPlanSemana INT NULL,
=======
<<<<<<< HEAD
    descripcion TEXT NOT NULL,
=======
    detalle TEXT NOT NULL,
>>>>>>> 992520fae1c452f0b4a142caf9755559910792c8
    idPlanSemana INT NOT NULL,
>>>>>>> 3491fab01e24f31352e930441b90a5392d70e3b4:BDD/bdd.sql
    PRIMARY KEY(id)    
);

CREATE TABLE PlanSemanaSubTema (
    id INT AUTO_INCREMENT NOT NULL,
<<<<<<< HEAD:BDD/1 bdd.sql
    descripcion TEXT NULL,
    idPlanSemana INT NULL,
=======
<<<<<<< HEAD
    descripcion TEXT NOT NULL,
=======
    detalle TEXT NOT NULL,
>>>>>>> 992520fae1c452f0b4a142caf9755559910792c8
    idPlanSemana INT NOT NULL,
>>>>>>> 3491fab01e24f31352e930441b90a5392d70e3b4:BDD/bdd.sql
    PRIMARY KEY(id)    
);

CREATE TABLE PlanSemanaEjeTransversal (
    id INT AUTO_INCREMENT NOT NULL,
<<<<<<< HEAD:BDD/1 bdd.sql
    descripcion TEXT NULL,
    idPlanSemana INT NULL,
=======
<<<<<<< HEAD
    descripcion TEXT NOT NULL,
=======
    detalle TEXT NOT NULL,
>>>>>>> 992520fae1c452f0b4a142caf9755559910792c8
    idPlanSemana INT NOT NULL,
>>>>>>> 3491fab01e24f31352e930441b90a5392d70e3b4:BDD/bdd.sql
    PRIMARY KEY(id)    
);

CREATE TABLE EjeTransversal (
    id INT AUTO_INCREMENT NOT NULL,
<<<<<<< HEAD:BDD/1 bdd.sql
    descripcion VARCHAR(255) NULL,
=======
<<<<<<< HEAD
    descripcion VARCHAR(255) NOT NULL,
=======
    detalle VARCHAR(255) NOT NULL,
>>>>>>> 992520fae1c452f0b4a142caf9755559910792c8
>>>>>>> 3491fab01e24f31352e930441b90a5392d70e3b4:BDD/bdd.sql
    PRIMARY KEY(id)
);

CREATE TABLE PlanSemanaObjetivo (
    id INT AUTO_INCREMENT NOT NULL,
    objetivo1 VARCHAR(255) NULL,
    objetivo2 TEXT NULL,
    objetivo3 TEXT NULL,
    objetivo4 TEXT NULL,
    idPlanSemana INT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE PlanSemanaMetodologia (
    id INT AUTO_INCREMENT NOT NULL,
    idSilaboMetodologia INT NULL,
    idPlanSemana INT NULL,
    PRIMARY KEY(id)    
);

CREATE TABLE PlanSemanaRecursoDidactico (
    id INT AUTO_INCREMENT NOT NULL,
    idSilaboRecursoDidactico INT NULL,
    idPlanSemana INT NULL,
    PRIMARY KEY(id)    
);

CREATE TABLE PlanSemanaDesarrolloClase (
    id INT AUTO_INCREMENT NOT NULL,
<<<<<<< HEAD:BDD/1 bdd.sql
    descripcion TEXT NULL,
    tiempo INT NULL,
    idPlanSemana INT NULL,
=======
<<<<<<< HEAD
    descripcion TEXT NOT NULL,
=======
    detalle TEXT NOT NULL,
>>>>>>> 992520fae1c452f0b4a142caf9755559910792c8
    tiempo INT NOT NULL,
    idPlanSemana INT NOT NULL,
>>>>>>> 3491fab01e24f31352e930441b90a5392d70e3b4:BDD/bdd.sql
    PRIMARY KEY(id)    
);

CREATE TABLE PlanSemanaPrerrequisitos (
    id INT AUTO_INCREMENT NOT NULL,
<<<<<<< HEAD:BDD/1 bdd.sql
    descripcion TEXT NULL,
    idPlanSemana INT NULL,
=======
<<<<<<< HEAD
    descripcion TEXT NOT NULL,
=======
    detalle TEXT NOT NULL,
>>>>>>> 992520fae1c452f0b4a142caf9755559910792c8
    idPlanSemana INT NOT NULL,
>>>>>>> 3491fab01e24f31352e930441b90a5392d70e3b4:BDD/bdd.sql
    PRIMARY KEY(id)    
);

CREATE TABLE PlanSemanaAplicacion (
    id INT AUTO_INCREMENT NOT NULL,
    idSilaboResultados TEXT NULL,
    idPlanSemana INT NULL,
    PRIMARY KEY(id)    
);

CREATE TABLE PlanSemanaTecnicaEvaluacion (
    id INT AUTO_INCREMENT NOT NULL,
    idTecnicasEvaluacion INT NULL,
    idPlanSemana INT NULL,
    PRIMARY KEY(id)    
);

CREATE TABLE TecnicaEvaluacion (
    id INT AUTO_INCREMENT NOT NULL,
<<<<<<< HEAD:BDD/1 bdd.sql
    descripcion TEXT NULL,
=======
<<<<<<< HEAD
    descripcion TEXT NOT NULL,
=======
    detalle TEXT NOT NULL,
>>>>>>> 992520fae1c452f0b4a142caf9755559910792c8
>>>>>>> 3491fab01e24f31352e930441b90a5392d70e3b4:BDD/bdd.sql
    PRIMARY KEY(id)    
);

CREATE TABLE PlanSemanaActividades (
    id INT AUTO_INCREMENT NOT NULL,
<<<<<<< HEAD:BDD/1 bdd.sql
    descripcion TEXT NULL,                        /* obtener de idSilaboEvidenciasRa */
    idPlanSemana INT NULL,
=======
<<<<<<< HEAD
    descripcion TEXT NOT NULL,                        /* obtener de idSilaboEvidenciasRa */
=======
    detalle TEXT NOT NULL,                        /* obtener de idSilaboEvidenciasRa */
>>>>>>> 992520fae1c452f0b4a142caf9755559910792c8
    idPlanSemana INT NOT NULL,
>>>>>>> 3491fab01e24f31352e930441b90a5392d70e3b4:BDD/bdd.sql
    PRIMARY KEY(id)  
);

CREATE TABLE CargoInstituto (
    id INT AUTO_INCREMENT NOT NULL,
<<<<<<< HEAD
    idInstituto INT NULL,
    idPersona INT NULL,
    idCargo INT NULL,
    fechaInicio DATE NULL,
    fechaFin DATE NULL,
    PRIMARY KEY(id)
);

CREATE TABLE CargoCarrera (
    id INT AUTO_INCREMENT NOT NULL,
    idCarrera INT NULL,
    idPersona INT NULL,
    idCargo INT NULL,
    fechaInicio DATE NULL,
    fechaFin DATE NULL,
=======
    idCarrera INT NOT NULL,
    idPersona INT NOT NULL,
    idCargo INT NOT NULL,
    fechaInicio DATE NOT NULL,
    fechaFin DATE NOT NULL,
    estado BOOLEAN NOT NULL,
>>>>>>> 992520fae1c452f0b4a142caf9755559910792c8
    PRIMARY KEY(id)
);

CREATE TABLE Cargo (
    id INT AUTO_INCREMENT NOT NULL,
<<<<<<< HEAD
    descripcion VARCHAR(100) NULL,
    PRIMARY KEY(id)
);

CREATE TABLE Aportes (
    id INT AUTO_INCREMENT NOT NULL,
    nota DOUBLE NULL,
    idDetalleAporte INT NULL,
    idMatriculaAsignatura INT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE DetalleAporte (
    id INT AUTO_INCREMENT NOT NULL,
    descripcion VARCHAR(100) NULL,
    idCategoriaNota INT NULL,
    idDocenteAsignatura INT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE CategoriaAporte (
    id INT AUTO_INCREMENT NOT NULL,
    descripcion VARCHAR(100) NULL,
    idPadre INT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE AporteFinal (
    id INT AUTO_INCREMENT NOT NULL,
    idCategoriaAporte INT NULL,
    idMatriculaAsignatura INT NULL,
    nota DOUBLE NULL,
    PRIMARY KEY(id)
);

CREATE TABLE PorcentajeAporteFinal (
    id INT AUTO_INCREMENT NOT NULL,
    idAporteFinal INT NULL,
    idCategoriaAporte INT NULL,
    porcentaje INT NULL,
    PRIMARY KEY(id)
);

=======
    detalle VARCHAR(100) NOT NULL,
    PRIMARY KEY(id)
);
>>>>>>> 992520fae1c452f0b4a142caf9755559910792c8
