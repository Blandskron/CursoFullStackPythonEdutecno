// Ejercicio 7: Sumar elementos de un array
// Este ejercicio suma todos los números en un array y muestra el resultado.

var numeros = [1, 2, 3, 4, 5]; // Se define un array con 5 números.
var suma = 0; // Inicializa la variable suma en 0.

for (var i = 0; i < numeros.length; i++) { // El bucle recorre todo el array.
    suma += numeros[i]; // Suma cada número a la variable suma.
}

console.log("La suma total es: " + suma); // Muestra la suma total de los números.
