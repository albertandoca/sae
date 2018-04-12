import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { CommonModule } from '@angular/common';

import { MenuPdRoutingModule } from './menu-pd-routing.module';
import { MenuPdComponent } from './menu-pd.component';
import { PortafolioDocenteService } from '../portafolio-docente.service';
import { Router } from '@angular/router';


@NgModule({
  imports: [
    CommonModule,
    FormsModule,
    MenuPdRoutingModule
  ],
  providers: [PortafolioDocenteService],
  declarations: [MenuPdComponent]
})
export class MenuPdModule { }
