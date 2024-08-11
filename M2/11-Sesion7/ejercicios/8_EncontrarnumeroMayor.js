// Ejercicio 8: Encontrar el número mayor en un array
// Este ejercicio encuentra y muestra el número más grande en un array.

var numeros = [3, 6, 2, 8, 4]; // Se define un array con varios números.
var mayor = numeros[0]; // Se asume inicialmente que el primer número es el mayor.

for (var i = 1; i < numeros.length; i++) { // El bucle recorre todo el array, comenzando desde el segundo elemento.
    if (numeros[i] > mayor) { // Si se encuentra un número mayor...
        console.log("El número mayor anterior era: " + mayor); // Muestra el número anteriormente encontrado.
        mayor = numeros[i]; // Se actualiza la variable mayor.
        console.log("El número mayor es ahora: " + mayor);
    }
}

console.log("El número mayor es: " + mayor); // Muestra el número más grande encontrado.
