// La palabra clave 'try' se utiliza para ejecutar un bloque de código y capturar cualquier error que ocurra durante su ejecución.

try {
    let resultado = dividir(10, 0); // Intenta ejecutar esta operación, que puede causar un error.
    console.log("El resultado es: " + resultado); // Si no hay error, muestra el resultado.
} catch (error) { // Si ocurre un error, se captura y maneja aquí.
    console.log("Ocurrió un error: " + error.message); // Muestra el mensaje de error.
}

function dividir(a, b) {
    if (b === 0) { // Si se intenta dividir por cero...
        throw new Error("No se puede dividir por cero."); // Lanza un error.
    }
    return a / b; // Devuelve el resultado de la división si no hay error.
}
