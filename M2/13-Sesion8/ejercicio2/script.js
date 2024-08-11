// Ejemplo 1: Bucle For
let bucleForOutput = "";
for (let i = 1; i <= 5; i++) {
    bucleForOutput += "Número: " + i + "\n"; // Muestra los números del 1 al 5
}
document.getElementById('bucleFor').textContent = bucleForOutput;

// Ejemplo 2: Manejo de Excepciones con try...catch
let manejoExcepcionesOutput = "";
try {
    let resultado = 10 / 2;
    manejoExcepcionesOutput += "Resultado: " + resultado + "\n"; // Muestra el resultado de la división
} catch (error) {
    manejoExcepcionesOutput += "Ocurrió un error: " + error.message + "\n"; // Captura cualquier error
} finally {
    manejoExcepcionesOutput += "Este código siempre se ejecuta, independientemente de si hubo un error o no.\n"; // Siempre se ejecuta
}
document.getElementById('manejoExcepciones').textContent = manejoExcepcionesOutput;

// Ejemplo 3: Arrays (Arreglos)
let arraysOutput = "";
let numeros = [1, 2, 3, 4, 5];
numeros[2] = 10; // Modificación de un elemento del array
numeros.push(6); // Agregar un nuevo elemento al final del array
let ultimo = numeros.pop(); // Eliminar el último elemento del array
arraysOutput += "Array modificado: " + numeros + "\n"; // Salida: [1, 2, 10, 4, 5]
arraysOutput += "Elemento eliminado: " + ultimo + "\n"; // Salida: 6
document.getElementById('arrays').textContent = arraysOutput;

// Ejemplo 4: Objetos
let objetosOutput = "";
let coche = {
    marca: "Toyota",
    modelo: "Corolla",
    año: 2020,
    arrancar: function() {
        return this.marca + " " + this.modelo + " ha arrancado.\n";
    }
};
objetosOutput += "Marca del coche: " + coche.marca + "\n"; // Salida: Toyota
objetosOutput += coche.arrancar(); // Salida: Toyota Corolla ha arrancado.
document.getElementById('objetos').textContent = objetosOutput;
