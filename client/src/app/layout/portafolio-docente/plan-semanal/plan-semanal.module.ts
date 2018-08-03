import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { NgbModule } from '@ng-bootstrap/ng-bootstrap';

import { PlanSemanalRoutingModule } from './plan-semanal-routing.module';
import { PlanSemanalComponent } from './plan-semanal.component';
import { PlanSemanalService } from './plan-semanal.service';
@NgModule({
  imports: [
    CommonModule,
    PlanSemanalRoutingModule,
    NgbModule,
    FormsModule
  ],
  providers: [PlanSemanalService],
  declarations: [PlanSemanalComponent]
})
export class PlanSemanalModule { }
