import { LoginResult } from 'app/entidades/especifico/Login-Result';
import { Component, OnInit, ViewContainerRef, ViewChild } from '@angular/core';
import { Http, RequestOptions, Headers } from '@angular/http';
import { HttpHeaders } from '@angular/common/http';
import { ToastsManager } from 'ng2-toastr/ng2-toastr';
import { PortafolioDocenteService } from '../portafolio-docente.service';
import { Router } from '@angular/router';
import { ModalComponent } from 'app/layout/bs-component/components';
import { NgbModal, ModalDismissReasons, NgbTabset } from '@ng-bootstrap/ng-bootstrap';
import { Message } from '@angular/compiler/src/i18n/i18n_ast';

import { PeriodoLectivoActual } from '../../../entidades/especifico/Periodo-Lectivo-Actual';
import { Persona } from '../../../entidades/CRUD/Persona';
import { CarrerasDocente } from '../../../entidades/especifico/Carreras-Docente';
import { AsignaturasDocente } from '../../../entidades/especifico/Asignaturas-Docente';
import { PeriodosDocumentos } from '../../../entidades/especifico/Periodos-Documentos';
import { isNull, isUndefined } from 'util';
import { AsignaturasRequisito } from '../../../entidades/especifico/Asignaturas-Requisito';
import { arrayify } from 'tslint/lib/utils';

@Component({
    selector: 'app-silabo',
    templateUrl: './silabo.component.html',
    styleUrls: ['./silabo.component.scss']
})

export class SilaboComponent implements OnInit {
    @ViewChild('content') ventana;
    busy: Promise<any>;
    variableEjemplo: string;
    carreraSeleccionada: CarrerasDocente;
    asignaturaSeleccionada: AsignaturasDocente;
    periodoSeleccionado: number;
    periodoLectivo: PeriodoLectivoActual;
    personaLogeada: Persona;
    tipoDocumento: number;
    periodos: PeriodosDocumentos[];
    rol: number;
    activeTab: string;
    procesos: string[];
    elementos: string[];
    totalHoras: number;
    preRequisitos: AsignaturasRequisito[];
    coRequisitos: AsignaturasRequisito[];
    

    @ViewChild('tabs')
    private tabs: NgbTabset;

    constructor(public toastr: ToastsManager, vcr: ViewContainerRef,
        private portafolioDocenteDataService: PortafolioDocenteService,
        public router: Router,
        private modalService: NgbModal) {
        this.toastr.setRootViewContainerRef(vcr);
    }

    ngOnInit() {
        this.procesos = ['casa', 'perro', 'gato', 'animal'];
        this.elementos = ['casa1', 'perro1', 'gato1', 'animal1'];
        const logedResult = JSON.parse(localStorage.getItem('logedResult')) as LoginResult;
        this.personaLogeada = logedResult.persona;
        this.rol = logedResult.idRol;
        this.tipoDocumento = 1;
        if (this.rol === 3) {
            this.asignaturaSeleccionada = JSON.parse(localStorage.getItem('asignatura')) as AsignaturasDocente;
            localStorage.removeItem('asignatura');
            this.carreraSeleccionada = JSON.parse(localStorage.getItem('carrera')) as CarrerasDocente;
            localStorage.removeItem('carrera');
            if (isNull (this.asignaturaSeleccionada) || isNull (this.carreraSeleccionada)) {
                this.router.navigate(['/menu-pd']);
            }
            this.totalHoras = 1 * this.asignaturaSeleccionada.horasDocente + 1 * this.asignaturaSeleccionada.horasAutonomas +
            1 * this.asignaturaSeleccionada.horasPractica;
            this.busy = this.portafolioDocenteDataService.getPrerequisitos(this.asignaturaSeleccionada.id)
            .then(respuesta => {
                this.preRequisitos = respuesta;
                if (isUndefined(this.preRequisitos[0].nombre)) {
                    this.preRequisitos = [];
                    this.preRequisitos.push( {
                        'nombre': 'Sin pre-requisitos',
                        'codigo': '0'
                    });
                }
            })
            .catch(error => {

            });
            this.busy = this.portafolioDocenteDataService.getCorequisitos(this.asignaturaSeleccionada.id)
            .then(respuesta => {
                this.coRequisitos = respuesta;
                if (isUndefined(this.coRequisitos[0].nombre)) {
                    this.coRequisitos = [];
                    this.coRequisitos.push( {
                        'nombre': 'Sin co-requisitos',
                        'codigo': '0'
                    });
                }
            })
            .catch(error => {

            });
            this.getPeriodoLectivoActual();
        } else {
            this.router.navigate(['/login']);
        }
    }

    getPeriodoLectivoActual() {
        this.busy = this.portafolioDocenteDataService.getPeriodoLectivoActual()
        .then(respuesta => {
            this.periodoLectivo = respuesta;
            this.getPeriodos();
        })
        .catch(error => {

        });
    }

    getPeriodos() {
        this.busy = this.portafolioDocenteDataService.getPeriodos(this.asignaturaSeleccionada.id, 4)
        .then(respuesta => {
            this.periodos = respuesta;
            let accion = 0;
            this.periodos.forEach(element => {
                if (this.periodoLectivo.id === element.idPeriodoLectivo) {
                    if (element.idEstadoComponentePd === 1 || element.idEstadoComponentePd === 4 ) {
                        accion = 1;
                    } else {
                        accion = 2;
                    }
                }
            });
            if (accion === 0) {
                this.open(this.ventana);
            } else if (accion === 1) {
                // muestra los datos del periodo activo
            } else if (accion === 2) {
                // muestra pdf y mensaje con el estado
            }
        })
        .catch(error => {

        });
    }

    guardarDatos() {
        localStorage.setItem('asignatura', JSON.stringify(this.asignaturaSeleccionada));
        localStorage.setItem('carrera', JSON.stringify(this.carreraSeleccionada));
        this.router.navigate(['/menu-pd']);
    }

    open(content) {
        this.periodoSeleccionado = 99;
        this.modalService.open(content)
        .result
        .then((result => {
            if (result === 'aceptar') {

            }
            if (result === 'cancelar') {
                this.guardarDatos();
            }
        }), (result => {
            this.guardarDatos();
        }));
     }

    prueba() {
        alert('hola');
    }
     imprimir() {}
}
