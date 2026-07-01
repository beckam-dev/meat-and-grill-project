import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms'; // <-- Importante para usar [(ngModel)]

@Component({
  selector: 'app-mesero',
  standalone: true,
  imports: [CommonModule, FormsModule], // <-- Asegúrate de agregar FormsModule aquí
  templateUrl: './mesero.html',
  styleUrl: './mesero.scss'
})
export class Mesero {
  menu = [
    { id: 1, nombre: 'Parrilla Personal', categoria: 'Carnes', precio: 35.00, descripcion: 'Corte de res, chuleta de cerdo, un chorizo y papas fritas.' },
    { id: 2, nombre: 'Lomo Fino a la Parrilla', categoria: 'Carnes', precio: 42.00, descripcion: 'Medallón de lomo fino acompañado de ensalada.' },
    { id: 3, nombre: 'Anticuchos Tradicionales', categoria: 'Entradas', precio: 18.00, descripcion: 'Dos palos de anticucho de corazón con papa y choclo.' },
    { id: 4, nombre: 'Porción de Papas Fritas', categoria: 'Guarniciones', precio: 8.00, descripcion: 'Papas canchán crujientes.' },
    { id: 5, nombre: 'Chicha Morada 1L', categoria: 'Bebidas', precio: 12.00, descripcion: 'Chicha natural de la casa.' }
  ];

  carrito: any[] = [];
  numeroMesa: string = '';

  agregarAlPedido(plato: any) {
    // Buscar si el producto ya está en el carrito
    const itemExistente = this.carrito.find(item => item.id === plato.id);

    if (itemExistente) {
      // Si ya existe, aumentamos su cantidad
      itemExistente.cantidad++;
    } else {
      // Si es nuevo, lo agregamos con cantidad inicial 1 y una propiedad para notas especiales
      this.carrito.push({
        ...plato,
        cantidad: 1,
        notas: ''
      });
    }
  }

  eliminarDelPedido(index: number) {
    this.carrito.splice(index, 1);
  }

  get totalPedido(): number {
    return this.carrito.reduce((sum, item) => sum + (item.precio * item.cantidad), 0);
  }

  enviarA_Cocina() {
    if (!this.numeroMesa) {
      alert('Por favor, ingresa el número de mesa antes de enviar.');
      return;
    }
    if (this.carrito.length === 0) {
      alert('El pedido está vacío. Agrega al menos un plato.');
      return;
    }

    // Aquí simulamos el envío (el Issue #14 conectará esto con la base de datos)
    alert(`¡Pedido de la Mesa ${this.numeroMesa} enviado a cocina con éxito!`);
    
    // Limpiamos el panel para la siguiente orden
    this.carrito = [];
    this.numeroMesa = '';
  }
}