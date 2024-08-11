// 'switch' se utiliza para ejecutar diferentes bloques de código en función del valor de una variable.

let dia = "Lunes";

switch (dia) {
    case "Lunes":
        console.log("Hoy es lunes."); // Salida: Hoy es lunes.
        break; // El 'break' termina el caso actual y previene la ejecución de casos siguientes
    case "Martes":
        console.log("Hoy es martes.");
        break;
    default:
        console.log("Hoy no es lunes ni martes.");
        break;
}
