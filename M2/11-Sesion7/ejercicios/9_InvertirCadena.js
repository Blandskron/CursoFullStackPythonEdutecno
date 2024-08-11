// Ejercicio 9: Invertir una cadena
// Este ejercicio invierte el orden de los caracteres en una cadena de texto.

var cadena = "Hola Mundo"; // Se define una cadena de texto.
var cadenaInvertida = ""; // Inicializa la cadena invertida como vacía.

for (var i = cadena.length - 1; i >= 0; i--) { // El bucle recorre la cadena desde el final hasta el principio.
    cadenaInvertida += cadena[i]; // Agrega cada carácter a la cadena invertida.
}

console.log("Cadena invertida: " + cadenaInvertida); // Muestra la cadena invertida.
