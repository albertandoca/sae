import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { LayoutComponent } from './layout.component';

const routes: Routes = [
    {
        path: '', component: LayoutComponent,
        children: [
            { path: 'asignacion-asignaturas-cupo', loadChildren: './matriculacion/asignacion-asignaturas-cupo/asignacion-asignaturas-cupo.module#AsignacionAsignaturasCupoModule' },
            { path: 'cupo-asignatura', loadChildren: './cupo-asignatura/cupo-asignatura.module#CupoAsignaturaModule' },
            { path: 'contacto-estudiantes-nuevos', loadChildren: './contacto-estudiantes-nuevos/contacto-estudiantes-nuevos.module#ContactoEstudiantesNuevosModule' },
            { path: 'certificado-matricula', loadChildren: './matriculacion/certificado-matricula/certificado-matricula.module#CertificadoMatriculaModule' },
            { path: 'asignacion-roles', loadChildren: './matriculacion/asignacion-roles/asignacion-roles.module#AsignacionRolesModule' },
            { path: 'secretaria-academica', loadChildren: './matriculacion/secretaria-academica/secretaria-academica.module#SecretariaAcademicaModule' },
            { path: 'tutor', loadChildren: './matriculacion/tutor/tutor.module#TutorModule' },
            { path: 'hoja-datos', loadChildren: './matriculacion/hoja-datos/hoja-datos.module#HojaDatosModule' },
            { path: 'solicitud-matricula', loadChildren: './matriculacion/solicitud-matricula/solicitud-matricula.module#SolicitudMatriculaModule' },
            { path: 'encuesta-factores-asociados', loadChildren: './encuesta-factores-asociados/encuesta-factores-asociados.module#EncuestaFactoresAsociadosModule' },
            { path: 'perfil', loadChildren: './perfil/perfil.module#PerfilModule' },
            { path: 'mail-sender', loadChildren: './mail-sender/mail-sender.module#MailSenderModule' },
            { path: 'yavirac', loadChildren: './yavirac/yavirac.module#YaviracModule' },
            { path: 'dashboard', loadChildren: './dashboard/dashboard.module#DashboardModule' },
            { path: 'charts', loadChildren: './charts/charts.module#ChartsModule' },
            { path: 'tables', loadChildren: './tables/tables.module#TablesModule' },
            { path: 'forms', loadChildren: './form/form.module#FormModule' },
            { path: 'bs-element', loadChildren: './bs-element/bs-element.module#BsElementModule' },
            { path: 'grid', loadChildren: './grid/grid.module#GridModule' },
            { path: 'components', loadChildren: './bs-component/bs-component.module#BsComponentModule' },
            { path: 'blank-page', loadChildren: './blank-page/blank-page.module#BlankPageModule' },
            { path: 'asignatura', loadChildren: '../CRUD/asignatura/asignatura.module#AsignaturaModule' },
            { path: 'asignaturasolicitudmatricula', loadChildren: '../CRUD/asignaturasolicitudmatricula/asignaturasolicitudmatricula.module#AsignaturaSolicitudMatriculaModule' },
            { path: 'asistencia', loadChildren: '../CRUD/asistencia/asistencia.module#AsistenciaModule' },
            { path: 'asistencia-registro', loadChildren: './asistencia-registro/asistencia-registro.module#AsistenciaRegistroModule' },
            { path: 'carrerainstituto', loadChildren: '../CRUD/carrerainstituto/carrerainstituto.module#CarreraInstitutoModule' },
            { path: 'rolsecundario', loadChildren: '../CRUD/rolsecundario/rolsecundario.module#RolSecundarioModule' },
            { path: 'logmailsender', loadChildren: '../CRUD/logmailsender/logmailsender.module#LogMailSenderModule' },
<<<<<<< HEAD
            { path: 'registro-asistencia', loadChildren: './asistencia-estudiante/registro-asistencia/registro-asistencia.module#RegistroAsistenciaModule' },
            { path: 'menu-pd', loadChildren: './portafolio-docente/menu-pd/menu-pd.module#MenuPdModule' },
            { path: 'silabo', loadChildren: './portafolio-docente/silabo/silabo.module#SilaboModule' },
<<<<<<< HEAD
=======
=======
        { path: 'registro-asistencia', loadChildren: './asistencia-estudiante/registro-asistencia/registro-asistencia.module#RegistroAsistenciaModule' },
        { path: 'carlos', loadChildren: './carlos/carlos.module#CarlosModule' },
>>>>>>> 992520fae1c452f0b4a142caf9755559910792c8
>>>>>>> 3491fab01e24f31352e930441b90a5392d70e3b4
            /*{
                path: 'asistencia-justificacion',
                loadChildren: './asistencia-justificacion/asistencia-justificacion.module#AsistenciaJustificacionModule'
            },*/
            { path: 'aula', loadChildren: '../CRUD/aula/aula.module#AulaModule' },
            { path: 'asignaturacupo', loadChildren: '../CRUD/asignaturacupo/asignaturacupo.module#AsignaturaCupoModule' },
            { path: 'estadocupo', loadChildren: '../CRUD/estadocupo/estadocupo.module#EstadoCupoModule' },
            { path: 'aulasasignaturas', loadChildren: '../CRUD/aulasasignaturas/aulasasignaturas.module#AulasAsignaturasModule' },
            { path: 'carrera', loadChildren: '../CRUD/carrera/carrera.module#CarreraModule' },
            { path: 'categorianota', loadChildren: '../CRUD/categorianota/categorianota.module#CategoriaNotaModule' },
            { path: 'contacto', loadChildren: '../CRUD/contacto/contacto.module#ContactoModule' },
            { path: 'cuenta', loadChildren: '../CRUD/cuenta/cuenta.module#CuentaModule' },
            { path: 'cupo', loadChildren: '../CRUD/cupo/cupo.module#CupoModule' },
            { path: 'datosestudiante', loadChildren: '../CRUD/datosestudiante/datosestudiante.module#DatosEstudianteModule' },
            { path: 'detallenotas', loadChildren: '../CRUD/detallenotas/detallenotas.module#DetalleNotasModule' },
            { path: 'discapacidad', loadChildren: '../CRUD/discapacidad/discapacidad.module#DiscapacidadModule' },
            { path: 'docente', loadChildren: '../CRUD/docente/docente.module#DocenteModule' },
            { path: 'docenteasignatura', loadChildren: '../CRUD/docenteasignatura/docenteasignatura.module#DocenteAsignaturaModule' },
            { path: 'documento', loadChildren: '../CRUD/documento/documento.module#DocumentoModule' },
            { path: 'educacioncontinua', loadChildren: '../CRUD/educacioncontinua/educacioncontinua.module#EducacionContinuaModule' },
            { path: 'enfermedad', loadChildren: '../CRUD/enfermedad/enfermedad.module#EnfermedadModule' },
            { path: 'estado', loadChildren: '../CRUD/estado/estado.module#EstadoModule' },
            { path: 'estadocivil', loadChildren: '../CRUD/estadocivil/estadocivil.module#EstadoCivilModule' },
            { path: 'estadopersona', loadChildren: '../CRUD/estadopersona/estadopersona.module#EstadoPersonaModule' },
            { path: 'estadosolicitud', loadChildren: '../CRUD/estadosolicitud/estadosolicitud.module#EstadoSolicitudModule' },
            { path: 'estudiante', loadChildren: '../CRUD/estudiante/estudiante.module#EstudianteModule' },
            { path: 'etnia', loadChildren: '../CRUD/etnia/etnia.module#EtniaModule' },
            { path: 'experiencialaboral', loadChildren: '../CRUD/experiencialaboral/experiencialaboral.module#ExperienciaLaboralModule' },
            { path: 'fotoperfil', loadChildren: '../CRUD/fotoperfil/fotoperfil.module#FotoPerfilModule' },
            { path: 'genero', loadChildren: '../CRUD/genero/genero.module#GeneroModule' },
            { path: 'hobbies', loadChildren: '../CRUD/hobbies/hobbies.module#HobbiesModule' },
            { path: 'horasclase', loadChildren: '../CRUD/horasclase/horasclase.module#HorasClaseModule' },
            { path: 'institucion', loadChildren: '../CRUD/institucion/institucion.module#InstitucionModule' },
            { path: 'instituto', loadChildren: '../CRUD/instituto/instituto.module#InstitutoModule' },
            { path: 'jornada', loadChildren: '../CRUD/jornada/jornada.module#JornadaModule' },
            { path: 'jornadacarrera', loadChildren: '../CRUD/jornadacarrera/jornadacarrera.module#JornadaCarreraModule' },
            { path: 'malla', loadChildren: '../CRUD/malla/malla.module#MallaModule' },
            { path: 'matricula', loadChildren: '../CRUD/matricula/matricula.module#MatriculaModule' },
            { path: 'matriculaasignatura', loadChildren: '../CRUD/matriculaasignatura/matriculaasignatura.module#MatriculaAsignaturaModule' },
            { path: 'modalidad', loadChildren: '../CRUD/modalidad/modalidad.module#ModalidadModule' },
            { path: 'motivosalida', loadChildren: '../CRUD/motivosalida/motivosalida.module#MotivoSalidaModule' },
            { path: 'niveltitulo', loadChildren: '../CRUD/niveltitulo/niveltitulo.module#NivelTituloModule' },
            { path: 'notas', loadChildren: '../CRUD/notas/notas.module#NotasModule' },
            { path: 'ocupacion', loadChildren: '../CRUD/ocupacion/ocupacion.module#OcupacionModule' },
            { path: 'paralelo', loadChildren: '../CRUD/paralelo/paralelo.module#ParaleloModule' },
            { path: 'parcial', loadChildren: '../CRUD/parcial/parcial.module#ParcialModule' },
            { path: 'periodoacademico', loadChildren: '../CRUD/periodoacademico/periodoacademico.module#PeriodoAcademicoModule' },
            { path: 'periodolectivo', loadChildren: '../CRUD/periodolectivo/periodolectivo.module#PeriodoLectivoModule' },
            { path: 'persona', loadChildren: '../CRUD/persona/persona.module#PersonaModule' },
            { path: 'ponderacion', loadChildren: '../CRUD/ponderacion/ponderacion.module#PonderacionModule' },
            { path: 'requisito', loadChildren: '../CRUD/requisito/requisito.module#RequisitoModule' },
            { path: 'roles', loadChildren: '../CRUD/roles/roles.module#RolesModule' },
            { path: 'solicitudmatricula', loadChildren: '../CRUD/solicitudmatricula/solicitudmatricula.module#SolicitudMatriculaModule' },
            { path: 'tipoaula', loadChildren: '../CRUD/tipoaula/tipoaula.module#TipoAulaModule' },
            { path: 'tipodiscapacidad', loadChildren: '../CRUD/tipodiscapacidad/tipodiscapacidad.module#TipoDiscapacidadModule' },
            { path: 'tipoeducacioncontinua', loadChildren: '../CRUD/tipoeducacioncontinua/tipoeducacioncontinua.module#TipoEducacionContinuaModule' },
            { path: 'tipoingresos', loadChildren: '../CRUD/tipoingresos/tipoingresos.module#TipoIngresosModule' },
            { path: 'tipoinstitucionprocedencia', loadChildren: '../CRUD/tipoinstitucionprocedencia/tipoinstitucionprocedencia.module#TipoInstitucionProcedenciaModule' },
            { path: 'tiporequisito', loadChildren: '../CRUD/tiporequisito/tiporequisito.module#TipoRequisitoModule' },
            { path: 'tiposangre', loadChildren: '../CRUD/tiposangre/tiposangre.module#TipoSangreModule' },
            { path: 'titulo', loadChildren: '../CRUD/titulo/titulo.module#TituloModule' },
            { path: 'ubicacion', loadChildren: '../CRUD/ubicacion/ubicacion.module#UbicacionModule' },
        ]
    }
];

@NgModule({
    imports: [RouterModule.forChild(routes)],
    exports: [RouterModule]
})

export class LayoutRoutingModule { }
