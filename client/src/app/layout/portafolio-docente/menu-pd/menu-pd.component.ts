import { LoginResult } from 'app/entidades/especifico/Login-Result';
import { Component, OnInit, ViewContainerRef } from '@angular/core';
import { ToastsManager } from 'ng2-toastr/ng2-toastr';
import { PortafolioDocenteService } from '../portafolio-docente.service';
import { Router } from '@angular/router';
import { PeriodoLectivoActual } from '../../../entidades/especifico/Periodo-Lectivo-Actual';
import { Persona } from '../../../entidades/CRUD/Persona';
import { Carrera } from '../../../entidades/CRUD/Carrera';
import { Asignatura } from '../../../entidades/CRUD/Asignatura';

@Component({
    selector: 'app-menu-pd',
    templateUrl: './menu-pd.component.html',
    styleUrls: ['./menu-pd.component.scss']
})

export class MenuPdComponent implements OnInit {
    busy: Promise<any>;
    variableEjemplo: string;
    carrerasDocente: Carrera[];
    asignaturasDocente: Asignatura[];
    carreraSeleccionada: number;
    asignaturaSeleccionada: number;
    periodoLectivo: PeriodoLectivoActual;
    personaLogeada: Persona;
    rol: number;

    constructor(public toastr: ToastsManager, vcr: ViewContainerRef,
        private portafolioDocenteDataService: PortafolioDocenteService, public router: Router) {
            this.toastr.setRootViewContainerRef(vcr);
    }

    ngOnInit() {
        const logedResult = JSON.parse(localStorage.getItem('logedResult')) as LoginResult;
        this.personaLogeada = logedResult.persona;
        this.rol = logedResult.idRol;
        if (this.rol === 3) {
            this.getPeriodoLectivoActual();
        } else {
            this.router.navigate(['/login']);
        }
    }

    getPeriodoLectivoActual() {
        this.busy = this.portafolioDocenteDataService.getPeriodoLectivoActual()
        .then(respuesta => {
            this.periodoLectivo = respuesta;
            this.getCarrera();
        })
        .catch(error => {

        });
    }

    getCarrera() {
        this.busy = this.portafolioDocenteDataService.getCarrera(this.personaLogeada.id, this.periodoLectivo.id)
        .then(respuesta => {
            this.carrerasDocente = respuesta;
            this.carreraSeleccionada = 0;
            this.getAsignatura();
        })
        .catch(error => {
        });
    }
    getAsignatura() {
        this.busy = this.portafolioDocenteDataService.getAsignatura(this.personaLogeada.id,
            this.periodoLectivo.id, this.carrerasDocente[this.carreraSeleccionada].id)
        .then(respuesta => {
            this.asignaturasDocente = respuesta;
            this.asignaturaSeleccionada = 0;
        })
        .catch(error => {
        });
    }

    guardarDatos() {
        localStorage.setItem('asignatura', JSON.stringify(this.asignaturasDocente[this.asignaturaSeleccionada]));
        localStorage.setItem('carrera', JSON.stringify(this.carrerasDocente[this.carreraSeleccionada]));
    }

    silabo() {
        this.guardarDatos();
        this.router.navigate(['/silabo']);
    }
    imprimir() {}
}
