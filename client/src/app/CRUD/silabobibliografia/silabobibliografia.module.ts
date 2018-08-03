import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { CommonModule } from '@angular/common';

import { SilaboBibliografiaRoutingModule } from './silabobibliografia-routing.module';
import { SilaboBibliografiaComponent } from './silabobibliografia.component';
import { SilaboBibliografiaService } from './silabobibliografia.service';

@NgModule({
   imports: [
      CommonModule,
      FormsModule,
      SilaboBibliografiaRoutingModule
   ],
   providers: [SilaboBibliografiaService],
   declarations: [SilaboBibliografiaComponent],
})
export class SilaboBibliografiaModule { }
