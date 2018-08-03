import { PeriodoLectivoActual } from 'app/entidades/especifico/Periodo-Lectivo-Actual';
import { CarrerasDocente } from 'app/entidades/especifico/Carreras-Docente';

import { Injectable } from '@angular/core';
import { Headers, Http } from '@angular/http';
import { environment } from './../../../environments/environment';

import 'rxjs/add/operator/toPromise';
import { AsignaturasDocente } from '../../entidades/especifico/Asignaturas-Docente';
import { PeriodosDocumentos } from '../../entidades/especifico/Periodos-Documentos';
import { AsignaturasRequisito } from '../../entidades/especifico/Asignaturas-Requisito';
import { VerboBloom } from '../../entidades/CRUD/VerboBloom';
import { PortafolioDocenteResumen } from '../../entidades/CRUD/PortafolioDocenteResumen';
import { Silabo } from '../../entidades/CRUD/Silabo';
import { SilaboUnidades } from '../../entidades/CRUD/SilaboUnidades';
import { SilaboElementos } from '../../entidades/CRUD/SilaboElementos';
import { SilaboResultados } from '../../entidades/CRUD/SilaboResultados';
import { SilaboEvidenciasRa } from '../../entidades/CRUD/SilaboEvidenciasRa';
import { SilaboMetodologia } from '../../entidades/CRUD/SilaboMetodologia';
import { SilaboRecursoDidactico } from '../../entidades/CRUD/SilaboRecursoDidactico';
import { SilaboBibliografia } from '../../entidades/CRUD/SilaboBibliografia';



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

    getPeriodos(idAsignatura: number, idComponentePd: number, idPersona: number): Promise<PeriodosDocumentos[]> {
        const url = `${this.urlBase + 'silabo_pd/periodos?idAsignatura=' + idAsignatura.toString() +
        '&idComponentePd=' + idComponentePd.toString() + '&idPersona=' + idPersona.toString()}`;
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

    crearPortafolioDocenteResumen(resumen: PortafolioDocenteResumen): Promise<any> {
        const url = `${this.urlBase + 'silabo_pd/crear_portafolio_docente_resumen'}`;
        return this.http.post(url, JSON.stringify(resumen))
        .toPromise()
        .then(response => response.json())
        .catch(this.handleError);
    }

    getIdPortafolioDocenteResumen(idAsignatura: number, idPeriodoLectivo: number, idPersona: number): Promise<number> {
        const url = `${this.urlBase + 'silabo_pd/get_id_portafolio_docente_resumen?idAsignatura='
        + idAsignatura.toString() + '&idPeriodoLectivo=' + idPeriodoLectivo.toString() + '&idPersona=' + idPersona.toString()}`;
        return this.http.get(url)
        .toPromise()
        .then(response => {
            const toReturn = response.json() as number;
            return toReturn;
    })
        .catch(this.handleError);
    }

    crearSilabo(silabo:Silabo): Promise<any> {
        const url = `${this.urlBase + 'silabo_pd/crear_silabo'}`;
        return this.http.post(url, JSON.stringify(silabo))
        .toPromise()
        .then(response => response.json())
        .catch(this.handleError);
    }

    getSilabo(idPortafolioDocenteResumen: number): Promise<Silabo> {
        const url = `${this.urlBase + 'silabo_pd/get_silabo?idPortafolioDocenteResumen=' + idPortafolioDocenteResumen.toString()}`;
        return this.http.get(url)
        .toPromise()
        .then(response => {
            const toReturn = response.json() as Silabo;
            return toReturn;
    })
        .catch(this.handleError);
    }

    getUnidades(idSilabo: number): Promise<SilaboUnidades[]> {
        const url = `${this.urlBase + 'silabo_pd/get_silabo_unidades?idSilabo=' + idSilabo.toString()}`;
        return this.http.get(url)
        .toPromise()
        .then(response => {
            const toReturn = response.json() as SilaboUnidades[];
            return toReturn;
    })
        .catch(this.handleError);
    }

    getElementos(idSilabo: number): Promise<SilaboElementos[]> {
        const url = `${this.urlBase + 'silabo_pd/get_silabo_elementos?idSilabo=' + idSilabo.toString()}`;
        return this.http.get(url)
        .toPromise()
        .then(response => {
            const toReturn = response.json() as SilaboElementos[];
            return toReturn;
    })
        .catch(this.handleError);
    }

    getResultados(idSilabo: number): Promise<SilaboResultados[]> {
        const url = `${this.urlBase + 'silabo_pd/get_silabo_resultados?idSilabo=' + idSilabo.toString()}`;
        return this.http.get(url)
        .toPromise()
        .then(response => {
            const toReturn = response.json() as SilaboResultados[];
            return toReturn;
    })
        .catch(this.handleError);
    }

    getEvidencias(idSilabo: number): Promise<SilaboEvidenciasRa[]> {
        const url = `${this.urlBase + 'silabo_pd/get_silabo_evidencias?idSilabo=' + idSilabo.toString()}`;
        return this.http.get(url)
        .toPromise()
        .then(response => {
            const toReturn = response.json() as SilaboEvidenciasRa[];
            return toReturn;
    })
        .catch(this.handleError);
    }

    getMetodologia(idSilabo: number): Promise<SilaboMetodologia[]> {
        const url = `${this.urlBase + 'silabo_pd/get_silabo_metodologia?idSilabo=' + idSilabo.toString()}`;
        return this.http.get(url)
        .toPromise()
        .then(response => {
            const toReturn = response.json() as SilaboMetodologia[];
            return toReturn;
    })
        .catch(this.handleError);
    }

    getRecursoDidactico(idSilabo: number): Promise<SilaboRecursoDidactico[]> {
        const url = `${this.urlBase + 'silabo_pd/get_silabo_recurso_didactico?idSilabo=' + idSilabo.toString()}`;
        return this.http.get(url)
        .toPromise()
        .then(response => {
            const toReturn = response.json() as SilaboRecursoDidactico[];
            return toReturn;
    })
        .catch(this.handleError);
    }

    getBibliografia(idSilabo: number): Promise<SilaboBibliografia[]> {
        const url = `${this.urlBase + 'silabo_pd/get_silabo_bibliografia?idSilabo=' + idSilabo.toString()}`;
        return this.http.get(url)
        .toPromise()
        .then(response => {
            const toReturn = response.json() as SilaboBibliografia[];
            return toReturn;
    })
        .catch(this.handleError);
    }

    crearUnidad(idSilabo: number, descripcion: string, codigo: string): Promise<any> {
        const url = `${this.urlBase + 'silabo_pd/crear_unidad?idSilabo=' + idSilabo.toString() 
        + '&descripcion=' + descripcion.toString() + '&codigo=' + codigo.toString()}`;
        return this.http.get(url)
        .toPromise()
        .then(response => {
         })
        .catch(this.handleError);
    }

    modificarUnidad(idSilaboUnidades: number, descripcion: string): Promise<any> {
        const url = `${this.urlBase + 'silabo_pd/modificar_unidad?idSilaboUnidades=' + idSilaboUnidades.toString()
        + '&descripcion=' + descripcion.toString()}`;
        return this.http.get(url)
        .toPromise()
        .then(response => {
         })
        .catch(this.handleError);
    }

    eliminarUnidad(idSilaboUnidades: number): Promise<any> {
        const url = `${this.urlBase + 'silabo_pd/eliminar_unidad?idSilaboUnidades=' + idSilaboUnidades.toString()}`;
        return this.http.get(url)
        .toPromise()
        .then(response => {
         })
        .catch(this.handleError);
    }

    modificarUnidadCodigo(idSilaboUnidades: number, codigo: string): Promise<any> {
        const url = `${this.urlBase + 'silabo_pd/modificar_unidad_codigo?idSilaboUnidades=' + idSilaboUnidades.toString()
        + '&codigo=' + codigo.toString()}`;
        return this.http.get(url)
        .toPromise()
        .then(response => {
         })
        .catch(this.handleError);
    }

    crearElementos(idSilaboUnidades: number, verbo: string, objeto: string, condicion: string,
        finalidad: string, codigo: string): Promise<any> {
        const url = `${this.urlBase + 'silabo_pd/crear_elemento?idSilaboUnidades=' + idSilaboUnidades.toString() 
        + '&verbo=' + verbo.toString() + '&objeto=' + objeto.toString() + '&condicion=' + condicion.toString()
        + '&finalidad=' + finalidad.toString() + '&codigo=' + codigo.toString()}`;
        return this.http.get(url)
        .toPromise()
        .then(response => {
         })
        .catch(this.handleError);
    }

    modificarElementos(idSilaboElementos: number, verbo: string, objeto: string, condicion: string, finalidad: string): Promise<any> {
        const url = `${this.urlBase + 'silabo_pd/modificar_elemento?idSilaboElementos=' + idSilaboElementos.toString()
        + '&verbo=' + verbo.toString() + '&objeto=' + objeto.toString() + '&condicion=' + condicion.toString()
        + '&finalidad=' + finalidad.toString()}`;
        return this.http.get(url)
        .toPromise()
        .then(response => {
         })
        .catch(this.handleError);
    }

    eliminarElementos(idSilaboElementos: number): Promise<any> {
        const url = `${this.urlBase + 'silabo_pd/eliminar_elemento?idSilaboElementos=' + idSilaboElementos.toString()}`;
        return this.http.get(url)
        .toPromise()
        .then(response => {
         })
        .catch(this.handleError);
    }

    crearResultados(idSilaboElementos: number, verbo: string, objeto: string, condicion: string,
        finalidad: string, codigo: string): Promise<any> {
        const url = `${this.urlBase + 'silabo_pd/crear_Resultado?idSilaboElementos=' + idSilaboElementos.toString() 
        + '&verbo=' + verbo.toString() + '&objeto=' + objeto.toString() + '&condicion=' + condicion.toString()
        + '&finalidad=' + finalidad.toString() + '&codigo=' + codigo.toString()}`;
        return this.http.get(url)
        .toPromise()
        .then(response => {
         })
        .catch(this.handleError);
    }

    modificarResultados(idSilaboResultados: number, verbo: string, objeto: string, condicion: string, finalidad: string): Promise<any> {
        const url = `${this.urlBase + 'silabo_pd/modificar_Resultado?idSilaboResultados=' + idSilaboResultados.toString()
        + '&verbo=' + verbo.toString() + '&objeto=' + objeto.toString() + '&condicion=' + condicion.toString()
        + '&finalidad=' + finalidad.toString()}`;
        return this.http.get(url)
        .toPromise()
        .then(response => {
         })
        .catch(this.handleError);
    }

    eliminarResultados(idSilaboResultados: number): Promise<any> {
        const url = `${this.urlBase + 'silabo_pd/eliminar_Resultado?idSilaboResultados=' + idSilaboResultados.toString()}`;
        return this.http.get(url)
        .toPromise()
        .then(response => {
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
