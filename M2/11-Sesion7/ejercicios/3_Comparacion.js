// Ejercicio 3: Comparación de números
// Este ejercicio pide al usuario que ingrese dos números y luego compara cuál es mayor.

var num1 = prompt("Ingresa el primer número:"); // Solicita el primer número.
var num2 = prompt("Ingresa el segundo número:"); // Solicita el segundo número.

if (num1 > num2) { // Si el primer número es mayor que el segundo...
    console.log(num1 + " es mayor que " + num2); // Muestra que el primer número es mayor.
} else if (num1 < num2) { // Si el segundo número es mayor que el primero...
    console.log(num2 + " es mayor que " + num1); // Muestra que el segundo número es mayor.
} else { // Si los números son iguales...
    console.log(num1 + " es igual a " + num2); // Muestra que los números son iguales.
}
