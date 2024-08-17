// Creación de un array con diferentes elementos
// Indice      0  1  2  3  4
let numeros = [1, 2, 3, 4, 5];

// Acceso a un elemento del array por su índice
console.log("Primer número: " + numeros[0]); // Salida: 1

// Modificación de un elemento del array
numeros[2] = 10;
console.log("Array modificado: " + numeros); // Salida: [1, 2, 10, 4, 5]

// Agregar un nuevo elemento al final del array
numeros.push(6);
console.log("Array después de push: " + numeros); // Salida: [1, 2, 10, 4, 5, 6]

// Eliminar el último elemento del array
let ultimo = numeros.pop();
console.log("Elemento eliminado: " + ultimo); // Salida: 6
console.log("Array después de pop: " + numeros); // Salida: [1, 2, 10, 4, 5]
