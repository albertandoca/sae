import { Injectable } from '@angular/core';
import { Headers, Http } from '@angular/http';
import { environment } from './../../../../environments/environment';

import 'rxjs/add/operator/toPromise';
import { PlanSemana } from 'app/entidades/CRUD/PlanSemana';
import { PlanSemanaTemaSelec } from 'app/entidades/especifico/Plan-Semana-Tema-Selec';
import { Paralelo } from 'app/entidades/CRUD/Paralelo';
import { Metodologia } from 'app/entidades/CRUD/Metodologia';
import { RecursosDidacticos } from 'app/entidades/CRUD/RecursosDidacticos';
import { Silabo } from 'app/entidades/CRUD/Silabo';
import { PlanSemanaPeriodos } from 'app/entidades/especifico/Plan-Semana-Periodos';
import { EjeTransversal } from 'app/entidades/CRUD/EjeTransversal';

@Injectable()

export class PlanSemanalService {
    private headers = new Headers({ 'Content-Type': 'application/json', 'Access-Control-Allow-Origin': '*' });
    private urlBase = environment.apiUrl;

    constructor(private http: Http) {
    }
    getTema(idAsignatura: number, idPeriodoLectivo: number): Promise<PlanSemanaTemaSelec[]> {
        const url = `${this.urlBase + 'plan_semanal/getTemas?idAsignatura=' + idAsignatura.toString()
        + '&idPeriodoLectivo=' + idPeriodoLectivo.toString()}`;
        return this.http.get(url)
        .toPromise()
        .then(response => {
            const toReturn = response.json() as PlanSemanaTemaSelec[];
            return toReturn;
    })
    .catch(this.handleError);
    }

    getParalelos(): Promise<Paralelo[]> {
        const url = `${this.urlBase + 'paralelo/leer'}`;
        return this.http.get(url)
        .toPromise()
        .then(response => {
            const toReturn = response.json() as Paralelo[];
            return toReturn;
    })
    .catch(this.handleError);
    }

    getMetodologias(): Promise<Metodologia[]> {
        const url = `${this.urlBase + 'metodologia/leer'}`;
        return this.http.get(url)
        .toPromise()
        .then(response => {
            const toReturn = response.json() as Metodologia[];
            return toReturn;
    })
    .catch(this.handleError);
    }

    getRecursos(): Promise<RecursosDidacticos[]> {
        const url = `${this.urlBase + 'recursosdidacticos/leer'}`;
        return this.http.get(url)
        .toPromise()
        .then(response => {
            const toReturn = response.json() as RecursosDidacticos[];
            return toReturn;
    })
    .catch(this.handleError);
    }

    getObjetivos(idPeriodoLectivo: number, idAsignatura: number): Promise<Silabo[]> {
        const url = `${this.urlBase + 'plan_semanal/get_objetivos?idPeriodoLectivo='
        + idPeriodoLectivo.toString() + '&idAsignatura=' + idAsignatura.toString()}`;
        return this.http.get(url)
        .toPromise()
        .then(response => {
            const toReturn = response.json() as Silabo[];
            return toReturn;
    })
    .catch(this.handleError);
    }

    getPeriodo(idAsignatura: number): Promise<PlanSemanaPeriodos[]> {
        const url = `${this.urlBase + 'plan_semanal/getPeriodos?idAsignatura=' + idAsignatura.toString()}`;
        return this.http.get(url)
        .toPromise()
        .then(response => {
            const toReturn = response.json() as PlanSemanaPeriodos[];
            return toReturn;
    })
    .catch(this.handleError);
    }

    getEjeTrasversal(): Promise<EjeTransversal[]> {
        const url = `${this.urlBase + 'ejetransversal/leer'}`;
        return this.http.get(url)
        .toPromise()
        .then(response => {
            const toReturn = response.json() as EjeTransversal[];
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
