import { LoginResult } from 'app/entidades/especifico/Login-Result';
import { Component, OnInit, ViewContainerRef } from '@angular/core';
import { ToastsManager } from 'ng2-toastr/ng2-toastr';
import { PortafolioDocenteService } from '../portafolio-docente.service';
import { Router } from '@angular/router';
import { ModalComponent } from 'app/layout/bs-component/components';
import { NgbModal, ModalDismissReasons } from '@ng-bootstrap/ng-bootstrap';
import { Message } from '@angular/compiler/src/i18n/i18n_ast';

import { PeriodoLectivoActual } from '../../../entidades/especifico/Periodo-Lectivo-Actual';
import { Persona } from '../../../entidades/CRUD/Persona';
import { Carrera } from '../../../entidades/CRUD/Carrera';
import { Asignatura } from '../../../entidades/CRUD/Asignatura';
import { PeriodosDocumentos } from '../../../entidades/especifico/Periodos-Documentos';
import { Genero } from '../../../entidades/CRUD/Genero';
import { TipoSangre } from '../../../entidades/CRUD/TipoSangre';
import { AsignaturaDocente } from '../../../entidades/especifico/Asignatura-Docente';
import { AsignaturaDocenteAsistenciaEstudiante } from '../../../entidades/especifico/Asignatura-Docente-Asistencia-Estudiante';

@Component({
    selector: 'app-silabo',
    templateUrl: './silabo.component.html',
    styleUrls: ['./silabo.component.scss']
})

export class SilaboComponent implements OnInit {
    busy: Promise<any>;
    variableEjemplo: string;
    carreraSeleccionada: Carrera;
    asignaturaSeleccionada: Asignatura;
    periodoLectivo: PeriodoLectivoActual;
    personaLogeada: Persona;
    tipoDocumento: number;
    periodos: PeriodosDocumentos;
    rol: number;
    genero: Genero[];
    generoSeleccionada: number;
    tipoSangre: TipoSangre[];
    asignaturaDocente:  AsignaturaDocenteAsistenciaEstudiante[];
    cont: string;

    constructor(public toastr: ToastsManager, vcr: ViewContainerRef,
        private portafolioDocenteDataService: PortafolioDocenteService, public router: Router,
        private modalService: NgbModal) {
            this.toastr.setRootViewContainerRef(vcr);
    }

    ngOnInit() {
        this.cambioGenero();
        this.sangreGenero();
        this.cont = 'content';
        this.open(this.cont);
        const logedResult = JSON.parse(localStorage.getItem('logedResult')) as LoginResult;
        this.personaLogeada = logedResult.persona;
        this.rol = logedResult.idRol;
        this.tipoDocumento = 1;
        if (this.rol === 3) {
            const asignaturaSeleccionada = JSON.parse(localStorage.getItem('asignatura')) as Asignatura;
            this.personaLogeada = logedResult.persona;
            const carreraSeleccionada = JSON.parse(localStorage.getItem('carrera')) as Carrera;
            this.personaLogeada = logedResult.persona;
            this.getPeriodoLectivoActual();
        } else {
            this.router.navigate(['/login']);
        }
    }

    open(content) {
    this.nombreAsignatura();
        this.modalService.open(content)
        .result
        .then((result => {
           if (result === 'save') {

           }
        }), (result => {
           // Esto se ejecuta si la ventana se cierra sin aceptar los cambios
        }));
     }
    getPeriodoLectivoActual() {
        this.busy = this.portafolioDocenteDataService.getPeriodoLectivoActual()
        .then(respuesta => {
            this.periodoLectivo = respuesta;
            // this.openSilabo();
        })
        .catch(error => {

        });
    }

    cambioGenero() {
        this.busy = this.portafolioDocenteDataService.cambioGenero()
        .then(respuesta => {
            this.genero = respuesta;
        })
        .catch(error => {

        });
    }



    prueba() {
        alert(this.genero[this.generoSeleccionada].descripcion);
    }


sangreGenero() {
    this.busy = this.portafolioDocenteDataService.sangreGenero()
    .then(respuesta => {
        this.tipoSangre = respuesta;
    })
    .catch(error => {

    });
}


nombreAsignatura() {
    this.busy = this.portafolioDocenteDataService.nombreAsignatura(43, 2)
    .then(respuesta => {
        this.asignaturaDocente = respuesta;
    })
    .catch(error => {

    });
}


imprimir() {}
}
