import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { CommonModule } from '@angular/common';
import { HttpModule } from '@angular/http';
import { NgbModule } from '@ng-bootstrap/ng-bootstrap';
import { SilaboRoutingModule } from './silabo-routing.module';
import { SilaboComponent } from './silabo.component';
import { PortafolioDocenteService } from '../portafolio-docente.service';
import { VerboBloomService } from '../../../CRUD/verbobloom/verbobloom.service';
import { Router } from '@angular/router';


@NgModule({
  imports: [
    CommonModule,
    FormsModule,
    NgbModule,
    HttpModule,
    SilaboRoutingModule
  ],
  providers: [PortafolioDocenteService, VerboBloomService],
  declarations: [SilaboComponent]
})
export class SilaboModule { }
