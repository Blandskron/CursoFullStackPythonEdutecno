// 'let' se utiliza para declarar variables con un alcance de bloque, lo que significa que
// la variable solo existe dentro del bloque en el que se declara.

if (true) {
    let edad = 25; // Esta variable solo es accesible dentro de este bloque 'if'
    console.log(edad); // Salida: 25
}

// console.log(edad); // Esto daría un error porque 'edad' no está definida fuera del bloque
