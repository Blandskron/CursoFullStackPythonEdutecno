// La palabra clave 'let' también se utiliza para declarar una variable.
// Sin embargo, 'let' tiene un alcance de bloque, lo que significa que solo existe dentro del bloque donde se declara.

let edad = 30; // Declara una variable llamada 'edad' y le asigna el valor 30.

if (true) {
    let edad = 25; // Esta 'let' crea una nueva variable 'edad' dentro de este bloque.
    console.log(edad); // Salida: "25"
}

console.log(edad); // Salida: "30", porque la 'edad' original sigue existiendo fuera del bloque 'if'.
