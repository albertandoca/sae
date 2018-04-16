import { LoginResult } from 'app/entidades/especifico/Login-Result';
import { Component, OnInit, ViewContainerRef } from '@angular/core';
import { ToastsManager } from 'ng2-toastr/ng2-toastr';
import { PortafolioDocenteService } from '../portafolio-docente.service';
import { Router } from '@angular/router';
import { PeriodoLectivoActual } from '../../../entidades/especifico/Periodo-Lectivo-Actual';
import { Persona } from '../../../entidades/CRUD/Persona';
<<<<<<< HEAD
import { CarrerasDocente } from '../../../entidades/especifico/Carreras-Docente';
import { AsignaturasDocente } from '../../../entidades/especifico/Asignaturas-Docente';
import { isNull } from 'util';
=======
import { Carrera } from '../../../entidades/CRUD/Carrera';
import { Asignatura } from '../../../entidades/CRUD/Asignatura';
>>>>>>> 3491fab01e24f31352e930441b90a5392d70e3b4

@Component({
    selector: 'app-menu-pd',
    templateUrl: './menu-pd.component.html',
    styleUrls: ['./menu-pd.component.scss']
})

export class MenuPdComponent implements OnInit {
    busy: Promise<any>;
    variableEjemplo: string;
<<<<<<< HEAD
    carrerasDocente: CarrerasDocente[];
    asignaturasDocente: AsignaturasDocente[];
=======
    carrerasDocente: Carrera[];
    asignaturasDocente: Asignatura[];
>>>>>>> 3491fab01e24f31352e930441b90a5392d70e3b4
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
<<<<<<< HEAD
            const carrera = JSON.parse(localStorage.getItem('carrera')) as CarrerasDocente;
            localStorage.removeItem('carrera');
            let i = 0;
            if (isNull (carrera)) {
                this.carreraSeleccionada = 0;
            } else {
                this.carrerasDocente.forEach(element => {
                    if (element.id === carrera.id) {
                        this.carreraSeleccionada = i;
                    }
                    i++;
                });
            }
=======
            this.carreraSeleccionada = 0;
>>>>>>> 3491fab01e24f31352e930441b90a5392d70e3b4
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
<<<<<<< HEAD
            const asignatura = JSON.parse(localStorage.getItem('asignatura')) as AsignaturasDocente;
            localStorage.removeItem('asignatura');
            let i = 0;
            if (isNull (asignatura)) {
                this.asignaturaSeleccionada = 0;
            } else {
                this.asignaturasDocente.forEach(element => {
                    if (element.id === asignatura.id) {
                        this.asignaturaSeleccionada = i;
                    }
                    i++;
                });
            }
=======
            this.asignaturaSeleccionada = 0;
>>>>>>> 3491fab01e24f31352e930441b90a5392d70e3b4
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
