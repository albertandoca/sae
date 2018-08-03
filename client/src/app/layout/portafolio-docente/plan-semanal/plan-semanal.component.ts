import { LoginResult } from 'app/entidades/especifico/Login-Result';
import { Component, OnInit, ViewContainerRef } from '@angular/core';
import { ToastsManager } from 'ng2-toastr/ng2-toastr';
import { Router } from '@angular/router';
import { ModalComponent } from 'app/layout/bs-component/components';
import { NgbModal, ModalDismissReasons } from '@ng-bootstrap/ng-bootstrap';
import { Message } from '@angular/compiler/src/i18n/i18n_ast';
import { Persona } from 'app/entidades/CRUD/Persona';
import { AsignaturasDocente } from 'app/entidades/especifico/Asignaturas-Docente';
import { CarrerasDocente } from 'app/entidades/especifico/Carreras-Docente';
import { isNull, isUndefined } from 'util';
import { PlanSemanalService } from './plan-semanal.service';
import { PlanSemana } from 'app/entidades/CRUD/PlanSemana';
import { PlanSemanaTemaSelec } from 'app/entidades/especifico/Plan-Semana-Tema-Selec';
import { Paralelo } from 'app/entidades/CRUD/Paralelo';
import { Metodologia } from 'app/entidades/CRUD/Metodologia';
import { RecursosDidacticos } from 'app/entidades/CRUD/RecursosDidacticos';
import { Silabo } from 'app/entidades/CRUD/Silabo';
import { PlanSemanaPeriodos } from 'app/entidades/especifico/Plan-Semana-Periodos';
import { EjeTransversal } from 'app/entidades/CRUD/EjeTransversal';

@Component({
    selector: 'app-plan-semanal',
    templateUrl: './plan-semanal.component.html',
    styleUrls: ['./plan-semanal.component.scss']
})
export class PlanSemanalComponent implements OnInit {
    busy: Promise<any>;
    personaLogeada: Persona;
    rol: number;
    tipoDocumento: number;
    asignaturaSeleccionada: AsignaturasDocente;
    carreraSeleccionada: CarrerasDocente;
    temas: PlanSemanaTemaSelec[];
    paralelo: Paralelo[];
    semana: number[];
    temaSeleccionado: number;
    metodologia: Metodologia[];
    recursos: RecursosDidacticos[];
    paraleloSeleccionado: number;
    numeroSemana: number;
    metodoSeleccionado: number;
    recursoSeleccionado: number;
    objetivo: Silabo[];
    objetivoSeleccionado: number;
    periodo: PlanSemanaPeriodos[];
    ejeTransversal: EjeTransversal[];
    ejeSeleccionado: number;
    textosTema: string[];
    temaIngresado: string;
    textoObjetivo: string[];
    uno: string;
    textoRepetido: boolean;
    subtemaIngresado: string;
    subtemaSeleccionado: number;
    textoSubtema: string[];

    constructor(public toastr: ToastsManager, private modalService: NgbModal,
        public router: Router, vcr: ViewContainerRef, private planSemanalDataService: PlanSemanalService) {
        this.toastr.setRootViewContainerRef(vcr);
    }

    ngOnInit() {
        this.textosTema = [];
        this.textoSubtema = [];
        this.textoObjetivo = [];
        this.semana = [1, 2, 3, 4, 5, 6, 7, 8, 9];
        this.getTema();
        this.getPeriodo();
        this.paraleloSeleccionado = 0;
        this.numeroSemana = 0;
        this.metodoSeleccionado = 0;
        this.recursoSeleccionado = 0;
        this.objetivoSeleccionado = 0;
        this.ejeSeleccionado = 0;
        const logedResult = JSON.parse(localStorage.getItem('logedResult')) as LoginResult;
        this.personaLogeada = logedResult.persona;
        this.rol = logedResult.idRol;
        this.tipoDocumento = 1;
        if (this.rol === 2) {
            this.asignaturaSeleccionada = JSON.parse(localStorage.getItem('asignatura')) as AsignaturasDocente;
            localStorage.removeItem('asignatura');
            this.carreraSeleccionada = JSON.parse(localStorage.getItem('carrera')) as CarrerasDocente;
            localStorage.removeItem('carrera');
            if (isNull(this.asignaturaSeleccionada) || isNull(this.carreraSeleccionada)) {
                this.router.navigate(['/menu-pd']);
            }
        }
    }

    getTema() {
        this.busy = this.planSemanalDataService.getTema(1, 2)
        .then(respuesta => {
            this.temas = respuesta;
            this.getParalelo();
            this.getMetodologia();
            this.getRecurso();
            this.getObjetivo();
            this.getEjeTransversal()
        })
        .catch(error => {
        });
    }

    getParalelo() {
        this.busy = this.planSemanalDataService.getParalelos()
        .then(respuesta => {
            this.paralelo = respuesta;
        })
        .catch(error => {
        });
    }

    getMetodologia() {
        this.busy = this.planSemanalDataService.getMetodologias()
        .then(respuesta => {
            this.metodologia = respuesta;
        })
        .catch(error => {
        });
    }

    getRecurso() {
        this.busy = this.planSemanalDataService.getRecursos()
        .then(respuesta => {
            this.recursos = respuesta;
        })
        .catch(error => {
        });
    }

    getObjetivo() {
        this.busy = this.planSemanalDataService.getObjetivos(2, 1)
        .then(respuesta => {
            this.objetivo = respuesta;
            alert(this.objetivo[0])
        })
        .catch(error => {
        });
    }

    getPeriodo() {
        this.busy = this.planSemanalDataService.getPeriodo(1)
        .then(respuesta => {
            this.periodo = respuesta;
        })
        .catch(error => {
        });
    }

    getEjeTransversal() {
        this.busy = this.planSemanalDataService.getEjeTrasversal()
        .then(respuesta => {
            this.ejeTransversal = respuesta;
        })
        .catch(error => {
        });
    }

    openTema(tema) {
        this.temaSeleccionado = 9999;
        this.uno = '';
        this.modalService.open(tema)
        .result
        .then((result => {
            if (result === 'anadir') {
                if (this.textoRepetido === false) {
                    this.textosTema.push(this.uno);
                } else {
                    this.toastr.warning('Lo sentimos, su tema no pudo ser agregado', 'Tema ingresado');
                }
            }
            if (result === 'cancelar') {
                // nada
            }
            }), (result => {
                // nada
            }));
        }

        seleccionaTema() {
            this.textoRepetido = false
            this.textosTema.forEach(element => {
                if (element === this.temas[this.temaSeleccionado].objeto) {
                    this.textoRepetido = true;
                    this.toastr.warning('El tema ya fue seleccionado para esta semana', 'Tema ingresado');
                }
            });
            if (this.textoRepetido === false) {
                this.uno = this.temas[this.temaSeleccionado].objeto;
            }
        }

        openSubtema(subtema) {
            this.subtemaSeleccionado = 9999;
            this.subtemaIngresado = '';
            this.modalService.open(subtema)
            .result
            .then((result => {
                if (result === 'anadir') {
                    if (this.textoRepetido === false) {
                        this.textoSubtema.push(this.subtemaIngresado);
                    } else {
                        this.toastr.warning('Lo sentimos, su tema no pudo ser agregado', 'Subtema ingresado');
                    }
                }
                if (result === 'cancelar') {
                    // nada
                }
                }), (result => {
                    // nada
                }));
            }

            seleccionaSubtema() {
                this.textoRepetido = false
                this.textoSubtema.forEach(element => {
                    if (element === this.temas[this.subtemaSeleccionado].objeto) {
                        this.textoRepetido = true;
                        this.toastr.warning('El subtema ya fue seleccionado para esta semana', 'Subtema ingresado');
                    }
                });
                if (this.textoRepetido === false) {
                    this.uno = this.temas[this.subtemaSeleccionado].objeto;
                }

}
}
