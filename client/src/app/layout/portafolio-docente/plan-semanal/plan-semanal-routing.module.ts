import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { PlanSemanalComponent } from './plan-semanal.component';

const routes: Routes = [
    { path: '', component: PlanSemanalComponent }
];

@NgModule({
    imports: [RouterModule.forChild(routes)],
    exports: [RouterModule]
})
export class PlanSemanalRoutingModule { }
