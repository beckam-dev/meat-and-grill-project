import { Routes } from '@angular/router';
import { Mesero } from './components/mesero/mesero'; 
import { Cocina } from './components/cocina/cocina'; 

export const routes: Routes = [
  { path: 'mesero', component: Mesero }, 
  { path: 'cocina', component: Cocina }, 
  { path: '', redirectTo: 'mesero', pathMatch: 'full' }
];