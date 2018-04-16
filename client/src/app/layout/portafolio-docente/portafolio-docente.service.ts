import { PeriodoLectivoActual } from 'app/entidades/especifico/Periodo-Lectivo-Actual';
import { CarrerasDocente } from 'app/entidades/especifico/Carreras-Docente';

import { Injectable } from '@angular/core';
import { Headers, Http } from '@angular/http';
import { environment } from './../../../environments/environment';

import 'rxjs/add/operator/toPromise';
import { AsignaturasDocente } from '../../entidades/especifico/Asignaturas-Docente';
import { PeriodosDocumentos } from '../../entidades/especifico/Periodos-Documentos';
import { AsignaturasRequisito } from '../../entidades/especifico/Asignaturas-Requisito';



@Injectable()

export class PortafolioDocenteService {
   private headers = new Headers({ 'Content-Type': 'application/json', 'Access-Control-Allow-Origin': '*' });
   private urlBase = environment.apiUrl;

   constructor(private http: Http) {

   }

    getAsignatura(idPersona: number, idPeriodoLectivo: number, idCarrera: number): Promise<AsignaturasDocente[]> {
        const url = `${this.urlBase + 'asignatura_docente/asignaturas?idPersona=' + idPersona.toString() + 
        '&idPeriodoLectivo=' + idPeriodoLectivo.toString() + '&idCarrera=' + idCarrera.toString()}`;
        return this.http.get(url)
        .toPromise()
        .then(response => {
            const toReturn = response.json() as AsignaturasDocente[];
            return toReturn;
    })
    .catch(this.handleError);
    }

    getCarrera(idPersona: number, idPeriodoLectivo: number): Promise<CarrerasDocente[]> {
        const url = `${this.urlBase + 'asignatura_docente/carreras?idPersona=' + idPersona.toString() + 
        '&idPeriodoLectivo=' + idPeriodoLectivo.toString()}`;
        return this.http.get(url)
        .toPromise()
        .then(response => {
            const toReturn = response.json() as CarrerasDocente[];
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

    getPeriodos(idAsignatura: number, idComponentePd: number): Promise<PeriodosDocumentos[]> {
        const url = `${this.urlBase + 'silabo_pd/periodos?idAsignatura=' + idAsignatura.toString() +
        '&idComponentePd=' + idComponentePd.toString()}`;
        return this.http.get(url)
        .toPromise()
        .then(response => {
            const toReturn = response.json() as PeriodosDocumentos[];
            return toReturn;
    })
        .catch(this.handleError);
    }

    getPrerequisitos(idAsignatura: number): Promise<AsignaturasRequisito[]> {
        const url = `${this.urlBase + 'silabo_pd/pre_requisitos?idAsignatura=' + idAsignatura.toString()}`;
        return this.http.get(url)
        .toPromise()
        .then(response => {
            const toReturn = response.json() as AsignaturasRequisito[];
            return toReturn;
    })
        .catch(this.handleError);
    }

    getCorequisitos(idAsignatura: number): Promise<AsignaturasRequisito[]> {
        const url = `${this.urlBase + 'silabo_pd/co_requisitos?idAsignatura=' + idAsignatura.toString()}`;
        return this.http.get(url)
        .toPromise()
        .then(response => {
            const toReturn = response.json() as AsignaturasRequisito[];
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
