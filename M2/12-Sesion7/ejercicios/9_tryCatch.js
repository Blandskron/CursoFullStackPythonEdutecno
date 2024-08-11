// 'try' se utiliza para ejecutar un bloque de código que podría producir un error.
// 'catch' captura y maneja cualquier error que ocurra en el bloque 'try'.

try {
    let resultado = dividir(10, 0); // Esto puede causar un error
    console.log("El resultado es: " + resultado);
} catch (error) { // Captura cualquier error que ocurra en el bloque 'try'
    console.log("Ocurrió un error: " + error.message); // Muestra el mensaje de error
}

function dividir(a, b) {
    if (b === 0) {
        throw new Error("No se puede dividir por cero."); // Lanza un error si 'b' es 0
    }
    return a / b; // Devuelve el resultado de la división si no hay error
}
