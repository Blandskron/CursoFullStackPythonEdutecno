// Ejercicio 4: Par o impar
// Este ejercicio pide al usuario que ingrese un número y luego determina si el número es par o impar.

var numero = prompt("Ingresa un número:"); // Solicita un número al usuario.

if (numero % 2 == 0) { // Si el número dividido por 2 da un resto de 0...
    console.log(numero + " es un número par."); // Muestra que el número es par.
} else { // Si el número dividido por 2 no da un resto de 0...
    console.log(numero + " es un número impar."); // Muestra que el número es impar.
}
