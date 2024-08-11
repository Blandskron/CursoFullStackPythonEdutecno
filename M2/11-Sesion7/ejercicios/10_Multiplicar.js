// Ejercicio 10: Tabla de multiplicar
// Este ejercicio pide al usuario que ingrese un número y luego muestra su tabla de multiplicar del 1 al 10.

var numero = prompt("Ingresa un número:"); // Solicita un número al usuario.

for (var i = 1; i <= 10; i++) { // El bucle recorre los números del 1 al 10.
    var resultado = numero * i; // Multiplica el número ingresado por el número actual del bucle.
    console.log(numero + " x " + i + " = " + resultado); // Muestra el resultado de la multiplicación.
}
