//función constructora
function Persona(nombre, dni, clave, cuenta) {
    this.nombre = nombre;
    this.dni = dni;
    this.clave = clave;
    this.cuenta = cuenta;
}

//3 objetos con los que se podrá ingresar al menú
var persona1 = new Persona("Manuel González", "1254623", 1234, 200000);
var persona2 = new Persona("Tamara Salazar", "1597863", 7539, 1000);
var persona3 = new Persona("Patricia Torres", "1257896", 7415, 1000500);

//lista de objetos
var miLista = [persona1, persona2, persona3];

alert("Bienvenido a Banca en Línea");
var dni = prompt("Ingrese su identificador");
var clave = parseInt(prompt("Ingrese su clave"));

alert("procesando...")

var boolean = false;
for (let i = 0; i < miLista.length; i++) {
    if (miLista[i].dni == dni && miLista[i].clave == clave) {
        boolean = true;
    } else {
        boolean = false;
    }

    if (boolean == true) {
        alert("Bienvenido " + miLista[i].nombre);
        menu(miLista[i]);
    }

}

if (boolean == false) {
    alert("usuario incorrecto");
}


function menu(usuario) {
    do {
        var opcion = parseInt(prompt("Seleccione que desea hacer: \n 1.- Ver saldo \n 2.- Realizar giro \n 3.- Realizar depósito \n 4.- Salir"));

        switch (opcion) {
            case 1:
                alert("Su saldo actual es: " + usuario.cuenta);
                break;
            case 2:
                var giro = parseInt(prompt("Su saldo actual es: " + usuario.cuenta + " \nIngrese el monto que desea girar"));

                if (giro > usuario.cuenta) {
                    alert("No se puede realizar la operación solicitada. Excede el saldo");

                } else {
                    var nuevoSaldo = usuario.cuenta - giro;

                    usuario.cuenta = nuevoSaldo;

                    alert("Giro realizado. Su nuevo saldo es " + usuario.cuenta);
                }

                break;
            case 3:
                var deposito = parseInt(prompt("Su saldo actual es: " + usuario.cuenta + " \nIngrese el monto que desea depositar"));


                usuario.cuenta = usuario.cuenta + deposito;

                alert("Deposito realizado. Su nuevo saldo es " + usuario.cuenta);



                break;
            case 4:
                alert("Gracias por preferirnos");
                exits();

                break;

            default:

                alert("Selección erronea")
                break;
        }

    } while (opcion != 4);
}



