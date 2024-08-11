// Manejo de excepciones con 'try' y 'catch'
try {
    let resultado = 10 / 0; // Intento de dividir por cero (aunque no genera error en JavaScript)
    console.log("Resultado: " + resultado); // Esto se ejecuta incluso si el denominador es 0
} catch (error) {
    console.log("Ocurrió un error: " + error.message); // Captura cualquier error que ocurra en el bloque 'try'
}
