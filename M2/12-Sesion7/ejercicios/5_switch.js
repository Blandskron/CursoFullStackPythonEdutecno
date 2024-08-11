// La palabra clave 'switch' se utiliza para ejecutar diferentes bloques de código basados en el valor de una variable.

let dia = "Lunes"; // Declara una variable llamada 'dia' con el valor "Lunes".

switch (dia) {
    case "Lunes":
        console.log("Hoy es lunes."); // Se ejecuta este bloque si 'dia' es "Lunes".
        break; // 'break' detiene la ejecución del switch.
    case "Martes":
        console.log("Hoy es martes."); // Se ejecuta este bloque si 'dia' es "Martes".
        break;
    default:
        console.log("Hoy no es lunes ni martes."); // Se ejecuta si 'dia' no coincide con ninguno de los casos.
        break;
}
