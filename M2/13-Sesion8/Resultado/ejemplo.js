function mostrarMenu() {
    let opcion;
    do {
        opcion = prompt(
            "Seleccione una opción:\n" +
            "1. Saludar\n" +
            "2. Mostrar números del 1 al 5\n" +
            "3. Calcular la suma de dos números\n" +
            "4. Salir"
        );

        switch (opcion) {
            case '1':
                saludar();
                break;
            case '2':
                mostrarNumeros();
                break;
            case '3':
                calcularSuma();
                break;
            case '4':
                alert("Saliendo del programa.");
                break;
            default:
                alert("Opción no válida. Inténtelo de nuevo.");
        }
    } while (opcion !== '4');
}

function saludar() {
    let nombre = prompt("¿Cuál es tu nombre?");
    alert("¡Hola, " + nombre + "!");
}

function mostrarNumeros() {
    let numeros = "";
    for (let i = 1; i <= 5; i++) {
        numeros += i + "\n";
    }
    alert("Números del 1 al 5:\n" + numeros);
}

function calcularSuma() {
    let num1 = parseFloat(prompt("Ingrese el primer número:"));
    let num2 = parseFloat(prompt("Ingrese el segundo número:"));
    let suma = num1 + num2;
    alert("La suma de " + num1 + " y " + num2 + " es " + suma);
}

// Iniciar el menú
mostrarMenu();
