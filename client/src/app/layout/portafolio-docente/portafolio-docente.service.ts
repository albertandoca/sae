import { PeriodoLectivoActual } from 'app/entidades/especifico/Periodo-Lectivo-Actual';
import { Carrera } from 'app/entidades/CRUD/Carrera';

import { Injectable } from '@angular/core';
import { Headers, Http } from '@angular/http';
import { environment } from './../../../environments/environment';

import 'rxjs/add/operator/toPromise';
import { Asignatura } from '../../entidades/CRUD/Asignatura';
import { Genero } from '../../entidades/CRUD/Genero';
import { TipoSangre } from '../../entidades/CRUD/TipoSangre';
import { AsignaturaDocenteAsistenciaEstudiante } from '../../entidades/especifico/Asignatura-Docente-Asistencia-Estudiante';



@Injectable()

export class PortafolioDocenteService {
   private headers = new Headers({ 'Content-Type': 'application/json', 'Access-Control-Allow-Origin': '*' });
   private urlBase = environment.apiUrl;

   constructor(private http: Http) {

   }

   getAsignatura(idPersona: number, idPeriodoLectivo: number, idCarrera: number): Promise<Asignatura[]> {
    const url = `${this.urlBase + 'asignatura_docente/asignaturas?idPersona=' + idPersona.toString() + 
    '&idPeriodoLectivo=' + idPeriodoLectivo.toString() + '&idCarrera=' + idCarrera.toString()}`;
    return this.http.get(url)
    .toPromise()
    .then(response => {
        const toReturn = response.json() as Asignatura[];
        return toReturn;
    })
    .catch(this.handleError);
 }

   getCarrera(idPersona: number, idPeriodoLectivo: number): Promise<Carrera[]> {
    const url = `${this.urlBase + 'asignatura_docente/carreras?idPersona=' + idPersona.toString() + 
    '&idPeriodoLectivo=' + idPeriodoLectivo.toString()}`;
    return this.http.get(url)
    .toPromise()
    .then(response => {
        const toReturn = response.json() as Carrera[];
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

cambioGenero(): Promise<Genero[]> {
    const url = `${this.urlBase + 'genero/leer'}`;
    return this.http.get(url)
    .toPromise()
    .then(response => {
        const toReturn = response.json() as Genero[];
        return toReturn;
    })
    .catch(this.handleError);
 }

 sangreGenero(): Promise<TipoSangre[]> {
    const url = `${this.urlBase + 'tiposangre/leer'}`;
    return this.http.get(url)
    .toPromise()
    .then(response => {
        const toReturn = response.json() as TipoSangre[];
        return toReturn;
    })
    .catch(this.handleError);
 }
 nombreAsignatura(idPersona: number, idPeriodoLectivo: number): Promise<AsignaturaDocenteAsistenciaEstudiante[]> {
    const url = `${this.urlBase + '/asignatura_docente/leer?idPersona=' + idPersona.toString() + '&idPeriodoLectivo=' + idPeriodoLectivo.toString()}`;
    return this.http.get(url)
    .toPromise()
    .then(response => {
        const toReturn = response.json() as AsignaturaDocenteAsistenciaEstudiante[];
        return toReturn;
    })
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
