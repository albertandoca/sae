import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { CommonModule } from '@angular/common';
<<<<<<< HEAD
import { HttpModule } from '@angular/http';
import { NgbModule } from '@ng-bootstrap/ng-bootstrap';
=======

>>>>>>> 3491fab01e24f31352e930441b90a5392d70e3b4
import { SilaboRoutingModule } from './silabo-routing.module';
import { SilaboComponent } from './silabo.component';
import { PortafolioDocenteService } from '../portafolio-docente.service';
import { Router } from '@angular/router';


<<<<<<< HEAD

=======
>>>>>>> 3491fab01e24f31352e930441b90a5392d70e3b4
@NgModule({
  imports: [
    CommonModule,
    FormsModule,
<<<<<<< HEAD
    NgbModule,
    HttpModule,
=======
>>>>>>> 3491fab01e24f31352e930441b90a5392d70e3b4
    SilaboRoutingModule
  ],
  providers: [PortafolioDocenteService],
  declarations: [SilaboComponent]
})
export class SilaboModule { }
