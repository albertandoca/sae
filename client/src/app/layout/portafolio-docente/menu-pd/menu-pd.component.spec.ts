import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { MenuPdComponent } from './menu-pd.component';

describe('SilaboComponent', () => {
  let component: MenuPdComponent;
  let fixture: ComponentFixture<MenuPdComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ MenuPdComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(MenuPdComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
