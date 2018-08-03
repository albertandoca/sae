import { async, ComponentFixture, TestBed } from '@angular/core/testing';
import { SilaboBibliografiaComponent } from './silabobibliografia.component';

describe('SilaboBibliografiaComponent', () => {
   let component: SilaboBibliografiaComponent;
   let fixture: ComponentFixture<SilaboBibliografiaComponent>;

   beforeEach(async(() => {
      TestBed.configureTestingModule({
         declarations: [ SilaboBibliografiaComponent ]
      }).compileComponents();
   }));

   beforeEach(() => {
      fixture = TestBed.createComponent(SilaboBibliografiaComponent);
      component = fixture.componentInstance;
      fixture.detectChanges();
   });

   it('should create', () => {
      expect(component).toBeTruthy();
   });
});