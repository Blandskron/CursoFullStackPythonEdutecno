// 'finally' se ejecuta siempre, haya o no error
try {
    let resultado = 10 / 2;
    console.log("Resultado: " + resultado); // Muestra el resultado de la división
} catch (error) {
    console.log("Ocurrió un error: " + error.message); // Captura cualquier error
} finally {
    console.log("Este código siempre se ejecuta, independientemente de si hubo un error o no."); // Siempre se ejecuta
}
