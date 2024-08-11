// La palabra clave 'const' se utiliza para declarar una constante.
// Las constantes tienen un alcance de bloque como 'let', pero su valor no se puede cambiar después de ser asignado.

const PI = 3.14159; // Declara una constante llamada 'PI' y le asigna el valor 3.14159.

if (true) {
    const PI = 3.14; // Se puede declarar una nueva constante 'PI' dentro de este bloque.
    console.log(PI); // Salida: "3.14"
}

console.log(PI); // Salida: "3.14159", porque la constante 'PI' original no fue alterada fuera del bloque 'if'.

// PI = 3.2; // Esto generaría un error porque no se puede reasignar una constante.
