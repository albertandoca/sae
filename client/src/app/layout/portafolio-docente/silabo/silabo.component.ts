import { LoginResult } from 'app/entidades/especifico/Login-Result';
import { Component, OnInit, ViewContainerRef, ViewChild } from '@angular/core';
import { Http, RequestOptions, Headers } from '@angular/http';
import { HttpHeaders } from '@angular/common/http';
import { ToastsManager } from 'ng2-toastr/ng2-toastr';
import { PortafolioDocenteService } from '../portafolio-docente.service';
import { Router } from '@angular/router';
import { ModalComponent } from 'app/layout/bs-component/components';
import { NgbModal, ModalDismissReasons, NgbTabset, NgbTooltip, NgbModalRef} from '@ng-bootstrap/ng-bootstrap';
import { Message } from '@angular/compiler/src/i18n/i18n_ast';

import { PeriodoLectivoActual } from '../../../entidades/especifico/Periodo-Lectivo-Actual';
import { Persona } from '../../../entidades/CRUD/Persona';
import { CarrerasDocente } from '../../../entidades/especifico/Carreras-Docente';
import { AsignaturasDocente } from '../../../entidades/especifico/Asignaturas-Docente';
import { PeriodosDocumentos } from '../../../entidades/especifico/Periodos-Documentos';
import { isNull, isUndefined } from 'util';
import { AsignaturasRequisito } from '../../../entidades/especifico/Asignaturas-Requisito';
import { Silabo } from '../../../entidades/CRUD/Silabo';
import { SilaboUnidades } from '../../../entidades/CRUD/SilaboUnidades';
import { SilaboElementos } from '../../../entidades/CRUD/SilaboElementos';
import { SilaboResultados } from '../../../entidades/CRUD/SilaboResultados';
import { SilaboEvidenciasRa } from '../../../entidades/CRUD/SilaboEvidenciasRa';
import { VerboBloom } from '../../../entidades/CRUD/VerboBloom';
import { VerboBloomService } from '../../../CRUD/verbobloom/verbobloom.service';
import { PortafolioDocenteResumen } from '../../../entidades/CRUD/PortafolioDocenteResumen';
import { element } from 'protractor';
import { SilaboMetodologia } from '../../../entidades/CRUD/SilaboMetodologia';
import { SilaboRecursoDidactico } from '../../../entidades/CRUD/SilaboRecursoDidactico';
import { SilaboBibliografia } from '../../../entidades/CRUD/SilaboBibliografia';


@Component({
    selector: 'app-silabo',
    templateUrl: './silabo.component.html',
    styleUrls: ['./silabo.component.scss']
})

export class SilaboComponent implements OnInit {
    @ViewChild('content') modalInicio;
    @ViewChild('objetivo') modalObjetivo;
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
    silabo: Silabo;
    silaboUnidades: SilaboUnidades[];
    silaboUnidadesEnviar: SilaboUnidades;
    silaboElementos: SilaboElementos[];
    silaboElementosEnviar: SilaboElementos[];
    silaboResultados: SilaboResultados[];
    silaboResultadosEnviar: SilaboResultados[];
    silaboEvidencias: SilaboEvidenciasRa[];
    silaboEvidenciasEnviar: SilaboEvidenciasRa[];
    silaboMetodologia: SilaboMetodologia[];
    silaboRecursoDidactico: SilaboRecursoDidactico[];
    silaboBibliografia: SilaboBibliografia[];
    descripcionAsignatura: string;
    objetivoAsignatura: string;
    descripcionIcono: boolean;
    descripcionTexto: boolean;
    objetivo1: string;
    objetivo2: string;
    objetivo3: string;
    objetivo4: string;
    objetivoAceptar: boolean;
    verboBloom: VerboBloom[];
    modalUnidad: number;
    modalElemento: number;
    modalResultado: number;
    modalEvidencia: number;
    ordenSecuencia: number[];
    numeroUnidad: number;
    resumen: PortafolioDocenteResumen;
    idPortafolio: number;
    tab: number;
    modificaInformacionGeneral: boolean;
    accion: number;
    verTab3: boolean;
    textoUnidad: string;
    botonAceptar: number;
    categoriaVerboSeleccionado: number;
    verboSeleccionado: number;
    textoObjeto: string;
    textoCondicion: string;
    textoFinalidad: string;
    verboBloomCategoria: VerboBloom[];
    verboBloomVerbo: VerboBloom[];
    textoVerbo: string;
    modalRef: NgbModalRef;
    @ViewChild('tabs')
    tabs: NgbTabset;

    constructor(public toastr: ToastsManager, vcr: ViewContainerRef,
        private portafolioDocenteDataService: PortafolioDocenteService,
        private verboBloomDataService: VerboBloomService,
        public router: Router,
        private modalService: NgbModal) {
        this.toastr.setRootViewContainerRef(vcr);
    }

    ngOnInit() {
        this.descripcionTexto = true;
        this.descripcionIcono = true;
        this.objetivoAceptar = false;
        this.categoriaVerboSeleccionado = 0;
        const logedResult = JSON.parse(localStorage.getItem('logedResult')) as LoginResult;
        this.personaLogeada = logedResult.persona;
        this.rol = logedResult.idRol;
        this.tipoDocumento = 1;
        if (this.rol === 3) {
            this.asignaturaSeleccionada = JSON.parse(localStorage.getItem('asignatura')) as AsignaturasDocente;
            localStorage.removeItem('asignatura');
            this.carreraSeleccionada = JSON.parse(localStorage.getItem('carrera')) as CarrerasDocente;
            localStorage.removeItem('carrera');
            if (isNull(this.asignaturaSeleccionada) || isNull(this.carreraSeleccionada)) {
                this.router.navigate(['/menu-pd']);
            }
            this.totalHoras = 1 * this.asignaturaSeleccionada.horasDocente + 1 * this.asignaturaSeleccionada.horasAutonomas +
                1 * this.asignaturaSeleccionada.horasPractica;
            this.busy = this.portafolioDocenteDataService.getPrerequisitos(this.asignaturaSeleccionada.id)
                .then(respuesta => {
                    this.preRequisitos = respuesta;
                    if (isUndefined(this.preRequisitos[0].nombre)) {
                        this.preRequisitos = [];
                        this.preRequisitos.push({
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
                        this.coRequisitos.push({
                            'nombre': 'Sin co-requisitos',
                            'codigo': '0'
                        });
                    }
                })
                .catch(error => {

                });
            this.busy = this.verboBloomDataService.getAll()
                .then(respuesta => {
                    this.verboBloom = respuesta;
                })
                .catch(error => {

                });
                this.busy = this.verboBloomDataService.getFiltrado('idPadre', 'coincide', '0')
                .then(respuesta => {
                    this.verboBloomCategoria = respuesta;
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
        this.busy = this.portafolioDocenteDataService.getPeriodos(this.asignaturaSeleccionada.id, 4, this.personaLogeada.id)
            .then(respuesta => {
                this.periodos = respuesta;
                this.accion = 0;
                this.periodos.forEach(element1 => {
                    if (this.periodoLectivo.id === element1.idPeriodoLectivo && element1.idPersona === this.personaLogeada.id) {
                        if (element1.idEstadoComponentePd == 1 || element1.idEstadoComponentePd == 4) {
                            this.accion = 1;
                        } else if (element1.idEstadoComponentePd == 2 || element1.idEstadoComponentePd == 5) {
                            this.accion = 2;
                        } else if (element1.idEstadoComponentePd == 3 || element1.idEstadoComponentePd == 6) {
                            this.accion = 3;
                        }
                        this.idPortafolio = element1.idPortafolioDocenteResumen;
                    }
                });
                this.modificaInformacionGeneral = false;
                if (this.accion === 0) {
                    this.open(this.modalInicio);
                } else if (this.accion === 1) {
                    this.getSilabo();
                } else if (this.accion === 2) {
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

    getSilabo() {
        this.busy = this.portafolioDocenteDataService.getSilabo(this.idPortafolio)
            .then(respuesta => {
                this.silabo = respuesta;
                this.objetivoAsignatura = this.silabo[0].objetivoParte1 + ' ' + this.silabo[0].objetivoParte2 +
                    ', ' + this.silabo[0].objetivoParte3 + ', ' + this.silabo[0].objetivoParte4 + '.';
                this.tab = 2;
                    this.getUnidades();
                    this.verTab3 = false;
                    this.getElementos();
                    this.getResultados();
                    this.getEvidencias();
                    // this.getMetodologia();
                    // this.getRecursoDidactico();
                    // this.getBibliografia();
            })
            .catch(error => {

            });
    }

    getUnidades() {
        this.busy = this.portafolioDocenteDataService.getUnidades(this.silabo[0].id)
            .then(respuesta => {
                this.silaboUnidades = respuesta;
                if (isNull(this.silaboUnidades[0].id) || isUndefined(this.silaboUnidades[0].id)) {
                    this.silaboUnidades = [];
                    this.verTab3 = true;
                }
            })
            .catch(error => {

            });
    }

    getElementos() {
        this.busy = this.portafolioDocenteDataService.getElementos(this.silabo[0].id)
            .then(respuesta => {
                this.silaboElementos = respuesta;
                if (isNull(this.silaboElementos[0].id) || isUndefined(this.silaboElementos[0].id)) {
                    this.silaboElementos = [];
                    this.verTab3 = true;
                }
            })
            .catch(error => {

            });
    }

    getResultados() {
        this.busy = this.portafolioDocenteDataService.getResultados(this.silabo[0].id)
            .then(respuesta => {
                this.silaboResultados = respuesta;
                if (isNull(this.silaboResultados[0].id) || isUndefined(this.silaboResultados[0].id)) {
                    this.silaboResultados = [];
                    this.verTab3 = true;
                }
            })
            .catch(error => {

            });
    }

    getEvidencias() {
        this.busy = this.portafolioDocenteDataService.getEvidencias(this.silabo[0].id)
            .then(respuesta => {
                this.silaboEvidencias = respuesta;
                if (isNull(this.silaboEvidencias[0].id) || isUndefined(this.silaboEvidencias[0].id)) {
                    this.silaboEvidencias = [];
                    this.verTab3 = true;
                }
                if (this.verTab3 === false) {
                    this.tab = 3;
                }
            })
            .catch(error => {

            });
    }

    getMetodologia() {
        this.busy = this.portafolioDocenteDataService.getMetodologia(this.silabo[0].id)
            .then(respuesta => {
                this.silaboMetodologia = respuesta;
                if (isNull(this.silaboMetodologia[0].id) || isUndefined(this.silaboMetodologia[0].id)) {
                    this.silaboMetodologia = [];
                }
            })
            .catch(error => {

            });
    }

    getRecursoDidactico() {
        this.busy = this.portafolioDocenteDataService.getRecursoDidactico(this.silabo[0].id)
            .then(respuesta => {
                this.silaboRecursoDidactico = respuesta;
                if (isNull(this.silaboRecursoDidactico[0].id) || isUndefined(this.silaboRecursoDidactico[0].id)) {
                    this.silaboRecursoDidactico = [];
                }
            })
            .catch(error => {

            });
    }

    getBibliografia() {
        this.busy = this.portafolioDocenteDataService.getBibliografia(this.silabo[0].id)
            .then(respuesta => {
                this.silaboBibliografia = respuesta;
                if (isNull(this.silaboBibliografia[0].id) || isUndefined(this.silaboBibliografia[0].id)) {
                    this.silaboBibliografia = [];
                }
            })
            .catch(error => {

            });
    }

    open(content) {
        this.periodoSeleccionado = 99;
        this.modalService.open(content)
            .result
            .then((result => {
                if (result === 'aceptar') {
                    if (this.periodoSeleccionado === 99) {
                        this.idPortafolio = 0;
                        this.tab = 1;
                        this.silabo = {
                            'id': 0,
                            'idAsignatura': this.asignaturaSeleccionada.id,
                            'idPeriodoLectivo': this.periodoLectivo.id,
                            'descripcion': '',
                            'objetivoParte1': '',
                            'objetivoParte2': '',
                            'objetivoParte3': '',
                            'objetivoParte4': '',
                            'codigo': '',
                            'idPortafolioDocenteResumen': 0
                        }
                        /* this.silaboUnidades = [];
                         this.silaboElementos = [];
                         this.silaboResultados = [];
                         this.silaboEvidencias = [];
                         this.objetivoAsignatura = '';
                         let k = 0;
                         let l = 0;
                         for (let j = 1; j < 4; j++) {
                             this.silaboUnidades.push(
                                 {
                                     'id': j,
                                     'idSilabo': 0,
                                     'descripcion': '',
                                     'codigo': j.toString()
                                 }
                             );
                             for (let h = 1; h < 3; h++) {
                                 this.silaboElementos.push(
                                     {
                                         'id': k,
                                         'idSilaboUnidades': j,
                                         'idVerboBloom': 1,
                                         'objeto': 'aaaa',
                                         'condicion': 'bbb',
                                         'finalidad': 'ccc',
                                         'codigo': j.toString() + '.' + h.toString()
                                     }
                                 );
                                 for (let i = 1; i < 3; i++) {
                                     this.silaboResultados.push(
                                         {
                                             'id': l,
                                             'idSilaboElementos': k,
                                             'idVerboBloom': 1,
                                             'objeto': 'aaa',
                                             'condicion': 'bbbb',
                                             'finalidad': 'cccc',
                                             'codigo': j.toString() + '.' + h.toString() + '.' + i.toLocaleString()
                                         }
                                     );
                                     l++;
                                 }
                                 this.silaboEvidencias.push(
                                     {
                                         'id': 0,
                                         'idSilaboResultados': k,
                                         'descripcion': 'aaaaa',
                                         'codigo': j.toString() + '.' + h.toString()
                                     }
                                 );
                                 k++;
                             }
                         } */
                    } else {
                        // llamar a la función de consulta
                    }
                }
                if (result === 'volver') {
                    this.guardarDatos();
                }
            }), (result => {
                this.guardarDatos();
            }));
    }

    openObjetivo(objetivo) {
        if (this.objetivoAceptar === false) {
            this.objetivo1 = this.silabo[0].objetivoParte1;
            this.objetivo2 = this.silabo[0].objetivoParte2;
            this.objetivo3 = this.silabo[0].objetivoParte3;
            this.objetivo4 = this.silabo[0].objetivoParte4;
        }
        this.modalRef = this.modalService.open(objetivo);
        this.modalRef.result
            .then((result => {
                if (result === 'cancelar') {
                    this.silabo[0].objetivoParte1 = this.objetivo1;
                    this.silabo[0].objetivoParte2 = this.objetivo2;
                    this.silabo[0].objetivoParte3 = this.objetivo3;
                    this.silabo[0].objetivoParte4 = this.objetivo4;
                    this.objetivoAsignatura = this.silabo[0].objetivoParte1 + ' ' + this.silabo[0].objetivoParte2 +
                        ', ' + this.silabo[0].objetivoParte3 + ', ' + this.silabo[0].objetivoParte4 + '.';
                }
            }), (result => {
                this.silabo[0].objetivoParte1 = this.objetivo1;
                this.silabo[0].objetivoParte2 = this.objetivo2;
                this.silabo[0].objetivoParte3 = this.objetivo3;
                this.silabo[0].objetivoParte4 = this.objetivo4;
                this.objetivoAsignatura = this.silabo[0].objetivoParte1 + ' ' + this.silabo[0].objetivoParte2 +
                    ', ' + this.silabo[0].objetivoParte3 + ', ' + this.silabo[0].objetivoParte4 + '.';
            }));
    }

    descripcion(icono: string) {
        if (icono === 'Modifica') {
            this.descripcionTexto = false;
            this.descripcionIcono = false;
            this.descripcionAsignatura = this.silabo[0].descripcion;
            const element2 = document.getElementById('textoDescripcion');
            element2.focus();
        } else if (icono === 'Aceptar') {
            this.descripcionTexto = true;
            this.descripcionIcono = true;
            if (this.idPortafolio !== 0) {
                this.modificaInformacionGeneral = true;
            }
        } else if (icono === 'Cancela') {
            this.silabo[0].descripcion = this.descripcionAsignatura;
            this.descripcionTexto = true;
            this.descripcionIcono = true;
        }
    }

    verObjetivo() {
        if (this.silabo[0].objetivoParte1 !== '' && this.silabo[0].objetivoParte2 !== '' &&
            this.silabo[0].objetivoParte3 !== '' && this.silabo[0].objetivoParte4 !== '') {
                if (this.silabo[0].idPortafolioDocenteResumen != 0) {
                    this.modificaInformacionGeneral = true;
                }
                this.objetivoAsignatura = this.silabo[0].objetivoParte1 + ' ' + this.silabo[0].objetivoParte2 +
                    ', ' + this.silabo[0].objetivoParte3 + ', ' + this.silabo[0].objetivoParte4 + '.';
                this.objetivoAceptar = true;
                this.modalRef.close();
        } else {
            this.objetivoAceptar = false;
            this.toastr.warning('Todos los campos deben estar llenos', 'Campos del objetivo vacios');
        }
    }

    modificarObjetivo() {
        this.objetivoAceptar = false;
    }

    guardaInformacionGeneral() {
        if (this.silabo[0].objetivoParte1 === '' || this.silabo[0].objetivoParte2 === '' ||
            this.silabo[0].objetivoParte3 === '' || this.silabo[0].objetivoParte4 === '' ||
            this.silabo[0].descripcion === '') {
            this.toastr.warning('Por favor redacte la descripción y el objetivo de la asignatura', 'Campos requeridos');
        } else {
            this.resumen = {
                'id': 0,
                'idComponentePd': 4,
                'idAsignatura': this.asignaturaSeleccionada.id,
                'idEstadoComponentePd': 1,
                'idPeriodoLectivo': this.periodoLectivo.id,
                'idPersona': this.personaLogeada.id
            }
            this.busy = this.portafolioDocenteDataService.crearPortafolioDocenteResumen(this.resumen)
                .then(respuesta => {
                    this.toastr.info('Los datos fueron guardados', 'Guardar Información general OK');
                })
                .catch(error => {
                    this.toastr.warning('No se pudo Guardar la información', 'Guardar Información general NO-OK');
                });
            this.busy = this.portafolioDocenteDataService.getIdPortafolioDocenteResumen
                (this.asignaturaSeleccionada.id, this.periodoLectivo.id, this.personaLogeada.id)
                .then(respuesta => {
                    this.idPortafolio = respuesta;
                    this.silabo[0].codigo = '04-' + this.asignaturaSeleccionada.codigo + '-' +
                    this.periodoLectivo.id + '-' + this.idPortafolio + this.personaLogeada.id;
                    this.silabo[0].idPortafolioDocenteResumen = this.idPortafolio;
                    this.tab = 2;
                    this.crearSilabo();
                })
                .catch(error => {

                });
            
        }
    }

    crearSilabo() {
        this.busy = this.portafolioDocenteDataService.crearSilabo(this.silabo)
            .then(respuesta1 => {
            })
            .catch(error => {
            });
    }

    openUnidad(ventanaUnidad, accion, lugar) {
        if (accion == 1) {
            this.modalUnidad = 1;
            this.textoUnidad = '';
        } else if (accion == 2) {
            this.modalUnidad = 2;
            this.textoUnidad = this.silaboUnidades[lugar].descripcion;
        } else {
            this.modalUnidad = 3;
        }
        this.modalService.open(ventanaUnidad)
            .result
            .then((result => {
                if (result === 'aceptarUnidad') {
                    const registros = this.silaboUnidades.length + 1;
                    if (this.textoUnidad == '' || isNull(this.textoUnidad) || isUndefined(this.textoUnidad)) {
                        this.toastr.warning('Por favor redacte una unidad', 'Unidad');
                    } else {
                        this.crearUnidad(this.silabo[0].id, this.textoUnidad, registros);
                    }
                }
                if (result === 'modificarUnidad') {
                    this.silaboUnidades[lugar].descripcion = this.textoUnidad;
                    if (this.textoUnidad == '' || isNull(this.textoUnidad) || isUndefined(this.textoUnidad)) {
                        this.toastr.warning('Por favor redacte una unidad', 'Unidad');
                    } else {
                        this.modificarUnidad(this.silaboUnidades[lugar].id, this.textoUnidad);
                    }
                }
                if (result === 'eliminarUnidad') {
                    this.eliminarUnidad(this.silaboUnidades[lugar].id, this.silaboUnidades[lugar].idSilabo);
                }
                if (result === 'cancelar') {

                }
            }), (result => {

            }));
    }

    crearUnidad(idSilabo, descripcion, codigo) {
        this.busy = this.portafolioDocenteDataService.crearUnidad(idSilabo, descripcion, codigo)
                .then(respuesta => {
                    this.toastr.info('Los datos fueron guardados', 'Guardar unidad OK');
                    this.getUnidades();
                })
                .catch(error => {
                    this.toastr.warning('No se pudo guardar la información', 'Guardar unidad NO-OK');
                });
    }

    modificarUnidad(idSilaboUnidad, descripcion) {
        this.busy = this.portafolioDocenteDataService.modificarUnidad(idSilaboUnidad, descripcion)
                .then(respuesta => {
                    this.toastr.info('Los datos fueron modificados', 'Modificar unidad OK');
                    this.getUnidades();
                })
                .catch(error => {
                    this.toastr.warning('No se pudo modificar la información', 'Modificar unidad NO-OK');
                });
    }

    eliminarUnidad(idSilaboUnidad, idSilabo) {
        this.busy = this.portafolioDocenteDataService.eliminarUnidad(idSilaboUnidad)
            .then(respuesta => {
                let i = 1;
                this.silaboUnidades.forEach(element1 => {
                    if (element1.idSilabo == idSilabo && element1.id != idSilaboUnidad) {
                        this.busy = this.portafolioDocenteDataService.modificarUnidadCodigo(element1.id, i.toString())
                            .then(respuesta1 => {
                            })
                            .catch(error => {
                            });
                        i++;
                    }
                });
                this.getUnidades();
                this.toastr.info('Los datos fueron eliminados', 'Eliminar unidad OK');
            })
            .catch(error => {
                this.toastr.warning('No se pudo eliminar la información', 'Eliminar unidad NO-OK');
            });
    }

    openElemento(ventanaElemento, accion, lugar) {
        this.botonAceptar = 0;
        this.categoriaVerboSeleccionado = 9999;
        this.verboSeleccionado = 9999;
        if (accion == 1) {
            this.botonAceptar = 1;
            this.modalUnidad = 1;
            this.textoObjeto = '';
            this.textoCondicion = '';
            this.textoFinalidad = '';
        } else if (accion == 2) {
            this.botonAceptar = 2;
            this.modalUnidad = 2;
            this.textoVerbo = this.silaboElementos[lugar].verbo;
            this.textoObjeto = this.silaboElementos[lugar].objeto;
            this.textoCondicion = this.silaboElementos[lugar].condicion;
            this.textoFinalidad = this.silaboElementos[lugar].finalidad;
        } else {

            this.modalUnidad = 3;
        }
        this.modalService.open(ventanaElemento)
            .result
            .then((result => {
                if (result === 'aceptarElemento') {
                    const registros = this.silaboElementos.length + 1;
                    if (this.textoVerbo != '' || this.textoObjeto != '' || this.textoCondicion != '' || this.textoFinalidad != '') {
                        this.crearElemento(this.silaboUnidades[lugar].id, this.textoVerbo, this.textoObjeto,
                            this.textoCondicion, this.textoFinalidad, registros.toString());
                    } else {
                        this.toastr.warning('Por favor redacte un elemento', 'Elementos');
                    }
                }
                if (result === 'modificarElemento') {
                    // this.silaboUnidades[lugar].descripcion = this.textoUnidad;
                    if (this.textoVerbo != '' || this.textoObjeto != '' || this.textoCondicion != '' || this.textoFinalidad != '') {
                        this.modificarElemento(this.silaboElementos[lugar].id, this.textoVerbo, this.textoObjeto,
                            this.textoCondicion, this.textoFinalidad);
                    } else {
                        this.toastr.warning('Por favor redacte un elemento', 'Elementos');
                    }
                }
                if (result === 'eliminarElemento') {
                    this.eliminarElemento(this.silaboElementos[lugar].id);
                }
                if (result === 'cancelar') {

                }
            }), (result => {

            }));
    }

    verElemento() {
        this.botonAceptar = 1;
    }

    verVerboBloom(columna: string, valor: string) {
        this.busy = this.verboBloomDataService.getFiltrado(columna, 'coincide', valor)
                .then(respuesta => {
                    this.verboBloomVerbo = respuesta;
                })
                .catch(error => {

                });
    }

    escribeVerboBloom(lugar: number) {
        this.textoVerbo = this.verboBloomVerbo[lugar].descripcion;
    }

    crearElemento(idSilaboUnidades: number, verbo: string, objeto: string, condicion: string, finalidad: string, codigo: string) {
        this.busy = this.portafolioDocenteDataService.crearElementos(idSilaboUnidades, verbo, objeto, condicion, finalidad, codigo)
                .then(respuesta => {
                    this.toastr.info('Los datos fueron guardados', 'Guardar unidad OK');
                    this.getElementos();
                })
                .catch(error => {
                    this.toastr.warning('No se pudo guardar la información', 'Guardar unidad NO-OK');
                });
    }

    modificarElemento(idSilaboElementos: number, verbo: string, objeto: string, condicion: string, finalidad: string) {
        this.busy = this.portafolioDocenteDataService.modificarElementos(idSilaboElementos, verbo, objeto, condicion, finalidad)
                .then(respuesta => {
                    this.toastr.info('Los datos fueron modificados', 'Modificar unidad OK');
                    this.getElementos();
                })
                .catch(error => {
                    this.toastr.warning('No se pudo modificar la información', 'Modificar unidad NO-OK');
                });
    }

    eliminarElemento(idSilaboElementos: number) {
        this.busy = this.portafolioDocenteDataService.eliminarElementos(idSilaboElementos)
                .then(respuesta => {
                    this.toastr.info('Los datos fueron eliminados', 'Eliminar unidad OK');
                    this.getElementos();
                })
                .catch(error => {
                    this.toastr.warning('No se pudo eliminar la información', 'Eliminar unidad NO-OK');
                });
    }

    openResultado(ventanaResultado, accion, lugar) {
        this.botonAceptar = 0;
        this.categoriaVerboSeleccionado = 9999;
        this.verboSeleccionado = 9999;
        if (accion == 1) {
            this.botonAceptar = 1;
            this.modalUnidad = 1;
            this.textoObjeto = '';
            this.textoCondicion = '';
            this.textoFinalidad = '';
        } else if (accion == 2) {
            this.botonAceptar = 2;
            this.modalUnidad = 2;
            this.textoVerbo = this.silaboResultados[lugar].verbo;
            this.textoObjeto = this.silaboResultados[lugar].objeto;
            this.textoCondicion = this.silaboResultados[lugar].condicion;
            this.textoFinalidad = this.silaboResultados[lugar].finalidad;
        } else {

            this.modalUnidad = 3;
        }
        this.modalService.open(ventanaResultado)
            .result
            .then((result => {
                if (result === 'aceptarResultado') {
                    const registros = this.silaboResultados.length + 1;
                    if (this.textoVerbo != '' || this.textoObjeto != '' || this.textoCondicion != '' || this.textoFinalidad != '') {
                        this.crearResultado(this.silaboElementos[lugar].id, this.textoVerbo, this.textoObjeto,
                            this.textoCondicion, this.textoFinalidad, registros.toString());
                    } else {
                        this.toastr.warning('Por favor redacte un Resultado', 'Resultados');
                    }
                }
                if (result === 'modificarResultado') {
                    // this.silaboUnidades[lugar].descripcion = this.textoUnidad;
                    if (this.textoVerbo != '' || this.textoObjeto != '' || this.textoCondicion != '' || this.textoFinalidad != '') {
                        this.modificarResultado(this.silaboResultados[lugar].id, this.textoVerbo, this.textoObjeto,
                            this.textoCondicion, this.textoFinalidad);
                    } else {
                        this.toastr.warning('Por favor redacte un Resultado', 'Resultados');
                    }
                }
                if (result === 'eliminarResultado') {
                    this.eliminarResultado(this.silaboResultados[lugar].id);
                }
                if (result === 'cancelar') {

                }
            }), (result => {

            }));
    }

    crearResultado(idSilaboUnidades: number, verbo: string, objeto: string, condicion: string, finalidad: string, codigo: string) {
        this.busy = this.portafolioDocenteDataService.crearResultados(idSilaboUnidades, verbo, objeto, condicion, finalidad, codigo)
                .then(respuesta => {
                    this.toastr.info('Los datos fueron guardados', 'Guardar unidad OK');
                    this.getResultados();
                })
                .catch(error => {
                    this.toastr.warning('No se pudo guardar la información', 'Guardar unidad NO-OK');
                });
    }

    modificarResultado(idSilaboResultados: number, verbo: string, objeto: string, condicion: string, finalidad: string) {
        this.busy = this.portafolioDocenteDataService.modificarResultados(idSilaboResultados, verbo, objeto, condicion, finalidad)
                .then(respuesta => {
                    this.toastr.info('Los datos fueron modificados', 'Modificar unidad OK');
                    this.getResultados();
                })
                .catch(error => {
                    this.toastr.warning('No se pudo modificar la información', 'Modificar unidad NO-OK');
                });
    }

    eliminarResultado(idSilaboResultados: number) {
        this.busy = this.portafolioDocenteDataService.eliminarResultados(idSilaboResultados)
                .then(respuesta => {
                    this.toastr.info('Los datos fueron eliminados', 'Eliminar unidad OK');
                    this.getResultados();
                })
                .catch(error => {
                    this.toastr.warning('No se pudo eliminar la información', 'Eliminar unidad NO-OK');
                });
    }


    prueba(numero: number) {
        alert('hola' + numero);
    }
    imprimir() { }
}
