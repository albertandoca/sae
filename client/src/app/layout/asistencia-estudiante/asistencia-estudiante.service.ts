import { AsignaturaDocenteAsistenciaEstudiante } from './../../entidades/especifico/Asignatura-Docente-Asistencia-Estudiante';
import { RegistroAsistenciaEstudiante } from './../../entidades/especifico/Registro-Asistencia-Estudiante';
import { Asignatura } from './../../entidades/CRUD/Asignatura';
import { HorasClase } from './../../entidades/CRUD/HorasClase';
import { PeriodoLectivoActual } from 'app/entidades/especifico/Periodo-Lectivo-Actual';
import { GuardarAsistenciaEstudiante } from 'app/entidades/especifico/Guardar-Asistencia-Estudiante';
import { ActualizarAsistenciaEstudiante } from 'app/entidades/especifico/Actualizar-Asistencia-Estudiante';
import { TotalHorasDia } from './../../entidades/especifico/Total-Horas-Dia';
import { Injectable } from '@angular/core';
import { Headers, Http } from '@angular/http';
import { environment } from './../../../environments/environment';

import 'rxjs/add/operator/toPromise';



@Injectable()

export class AsistenciaEstudianteService {
   private headers = new Headers({ 'Content-Type': 'application/json', 'Access-Control-Allow-Origin': '*' });
   private urlBase = environment.apiUrl;

   constructor(private http: Http) {

   }

   getAsignaturaDocenteAsistenciaEstudiante(idPersona: number, idPeriodoLectivo: number): Promise<AsignaturaDocenteAsistenciaEstudiante[]> {
      const url = `${this.urlBase + 'asignatura_docente/leer?idPersona=' + idPersona.toString() + 
      '&idPeriodoLectivo=' + idPeriodoLectivo.toString()}`;
      return this.http.get(url)
      .toPromise()
      .then(response => {
          const toReturn = response.json() as AsignaturaDocenteAsistenciaEstudiante[];
          return toReturn;
      })
      .catch(this.handleError);
   }

   getPeriodoLectivoActual(): Promise<PeriodoLectivoActual> {
        const url = `${this.urlBase + 'periodo_lectivo_actual/consultar'}`;
        return this.http.get(url)
        .toPromise()
        .then(response => {
            const toReturn = (response.json() as PeriodoLectivoActual[])[0];
            return toReturn;
        })
        .catch(this.handleError);
    }

    getTotalHorasDia(idDocenteAsignatura: number, fecha: string): Promise<TotalHorasDia> {
        const url = `${this.urlBase + 'asistencias_estudiante/leer_horas_dia?idDocenteAsignatura='
        + idDocenteAsignatura.toString() + '&fecha=' + fecha.toString()}`;
        return this.http.get(url)
        .toPromise()
        .then(response => {
            const toReturn = (response.json() as TotalHorasDia[])[0];
            return toReturn;
        })
        .catch(this.handleError);
    }

    getRegistroAsitenciaEstudiante(idAsignatura: number, idPeriodoLectivo: number, 
        idParalelo: number, fecha: string, horas: number): Promise<RegistroAsistenciaEstudiante[]> {
        const url = `${this.urlBase + 'asistencias_estudiante/leer?idAsignatura=' + idAsignatura.toString() + '&idPeriodoLectivo=' + 
        idPeriodoLectivo.toString() + '&idParalelo=' + idParalelo.toString() + '&fecha=' + 
        fecha.toString() + '&horas=' + horas.toString()}`;
        return this.http.get(url)
        .toPromise()
        .then(response => {
            const toReturn = response.json() as RegistroAsistenciaEstudiante[];
            return toReturn;
        })
        .catch(this.handleError);
    }

    /*create(guardarAsistenciaDia: GuardarAsistenciaEstudiante[]): Promise<boolean> {
        const url = `${this.urlBase + 'asistencias_estudiante/crear?asistenciaDia=' + (JSON.stringify(guardarAsistenciaDia)).toString()}`;
        return this.http.get(url)
        .toPromise()
        .then(response => response.json())
        .catch(this.handleError);
     }*/

     create(guardarAsistenciaDia: GuardarAsistenciaEstudiante[]): Promise<boolean> {
        const url = `${this.urlBase + 'asistencias_estudiante/crear'}`;
        return this.http.post(url, JSON.stringify(guardarAsistenciaDia))
        .toPromise()
        .then(response => response.json())
        .catch(this.handleError);
     }

    leer_fecha_hoy(): Promise<string> {
        const url = `${this.urlBase + 'asistencias_estudiante/leer_fecha_hoy'}`;
        return this.http.get(url)
        .toPromise()
        .then(response => response.json())
        .catch(this.handleError);
    }

    guardarHorasDia(horasDia: HorasClase): Promise<boolean> {
        const url = `${this.urlBase + 'horasclase/crear'}`;
        return this.http.post(url, JSON.stringify(horasDia))
        .toPromise()
        .then(response => response.json())
        .catch(this.handleError);
     }

   baseUrl(): string {
       return this.urlBase;
   }

   handleError(error: any): Promise<any> {
      console.error('An error occurred', error); // for demo purposes only
      return Promise.reject(error.message || error);
   }
}
