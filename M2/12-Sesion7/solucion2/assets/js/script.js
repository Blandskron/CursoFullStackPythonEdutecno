var opcion = prompt("¡Hola! Soy Eva, tu asistente virtual del Servicio al Cliente de Mentel. Estoy aquí para ayudarte en lo que necesides.\nEscribe el número de la opción que buscas: \n1.- Boletas y Pagos \n2.- Señal y llamadas \n3.- Oferta comercial  \n4.- Otras consultas")

switch (opcion) {
    case "1":
        boletasPagos();
        break;
    case "2":
        senalLlamadas();
        break;
    case "3":
        ofertaComercial();
        break;
    case "4":
        otros();
        break;

    default:
        defecto();
        break;
}

//FUNCIONES

function boletasPagos(){
    let option = prompt("Seleccione una opción \n1.- Ver Boleta  \n2.- Pagar cuenta");
    if (option == 1){
        alert("Haga clic aquí para descargar su boleta.")
    }else if (option == 2){
        alert("Usted está siendo transferido. Espere por favor...");
    }else{
        alert("La opción ingresada no es válida. Gracias por preferir nuestros servicios.")
    }
}


function senalLlamadas(){
    let option = prompt("Seleccione una opción \n1.- Problemas con la señal  \n2.- Problemas con las llamadas");
    if (option == 1 || option == 2){
        let problema = prompt("A continuación escriba su solicitud");
        alert("Estimado usuario, su solicitud: '" + problema + "' Ha sido ingresada con éxito. Pronto será contactado por uno de nuestros ejecutivos.");
    }else{
        alert("La opción ingresada no es válida. Gracias por preferir nuestros servicios.")
    }
}

function ofertaComercial(){
    let oferta = prompt("¡Mentel tiene una oferta comercial acorde a tus necesidades! \nPara conocer más información y ser asesorado personalmente por un ejecutivo escribe 'SI' y un ejecutivo te llamará. De lo contrario ingrese 'NO'");
    if(oferta == "SI"){
        alert("Un ejecutivo contactará con usted")
    }
    else if (oferta == "NO"){
        alert("Gracias por preferir nuestros servicios")
    }else{
        alert("La opción ingresada no es válida. Gracias por preferir nuestros servicios")
    }
}

function otros(){
    let consulta = prompt("A continuación escriba su consulta");
    alert("Estimado usuario, su consulta: '" + consulta + "' Ha sido ingresada con éxito. Pronto será contactado por uno de nuestros ejecutivos.");
}

function defecto(){
    alert("La opción ingresada no es válida. Gracias por preferir nuestros servicios");
}