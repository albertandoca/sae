import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { PlanSemanalComponent } from './plan-semanal.component';

describe('PlanSemanalComponent', () => {
  let component: PlanSemanalComponent;
  let fixture: ComponentFixture<PlanSemanalComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ PlanSemanalComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(PlanSemanalComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
