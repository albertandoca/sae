import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { SilaboBibliografiaComponent } from './silabobibliografia.component';

const routes: Routes = [
   { path: '', component: SilaboBibliografiaComponent }
];

@NgModule({
   imports: [RouterModule.forChild(routes)],
   exports: [RouterModule]
})
export class SilaboBibliografiaRoutingModule { }
