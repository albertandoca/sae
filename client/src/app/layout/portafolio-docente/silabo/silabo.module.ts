import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { CommonModule } from '@angular/common';

import { SilaboRoutingModule } from './silabo-routing.module';
import { SilaboComponent } from './silabo.component';
import { PortafolioDocenteService } from '../portafolio-docente.service';
import { Router } from '@angular/router';


@NgModule({
  imports: [
    CommonModule,
    FormsModule,
    SilaboRoutingModule
  ],
  providers: [PortafolioDocenteService],
  declarations: [SilaboComponent]
})
export class SilaboModule { }
