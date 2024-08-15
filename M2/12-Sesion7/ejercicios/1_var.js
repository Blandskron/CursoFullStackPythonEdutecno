// La palabra clave 'var' se utiliza para declarar una variable.
// Estas variables tienen un alcance de función o global, dependiendo de dónde se declaren.

var nombre = "Juan"; // Declara una variable llamada 'nombre' y le asigna el valor "Juan".
console.log(nombre);
if (true) {
    var nombre = "Pedro"; // Esta 'var' redefine la variable 'nombre' dentro del mismo ámbito.
    console.log(nombre); // Salida: "Pedro"
}

console.log(nombre); // Salida: "Pedro", porque 'var' no tiene alcance de bloque.
