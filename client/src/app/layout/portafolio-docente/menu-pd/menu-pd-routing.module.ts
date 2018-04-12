import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { MenuPdComponent } from './menu-pd.component';

const routes: Routes = [
    { path: '', component: MenuPdComponent }
];

@NgModule({
    imports: [RouterModule.forChild(routes)],
    exports: [RouterModule]
})
export class MenuPdRoutingModule { }
