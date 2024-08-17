var tareas = [
    { tarea: "Pintar la fachada de la casa" },
    { tarea: "Comprar comida para el perro" },
    { tarea: "Pagar la tarjeta de crédito" }
]

tabla(tareas)



///////////////////////////////////////////////////////////////////////////////////////////////////////////


//Función tabla para mostrar todos los datos en una tabla
function tabla(tareas) {
    var cuerpoTabla = document.getElementById("cuerpo-tabla");
    cuerpoTabla.innerHTML = "";
    for (let i = 0; i < tareas.length; i++) {
        cuerpoTabla.innerHTML += ` <tr>
      <td >${tareas[i].tarea}</td>
      <td><button type="button" class="btn btn-danger" onclick="eliminar(${i})">Finalizar</button></td>
   </tr> `
    }
}


// Función para eliminar una tarea del arreglo y actualizar la tabla
function eliminar(indice) {
    tareas.splice(indice, 1);
    tabla(tareas);
}

// Función para mostrar u ocultar el formulario según necesidad del usuario
function mostrarFormulario() {
    var formulario = document.getElementById("formulario");
    if (formulario.style.display === "none" || formulario.style.display === "") {
        formulario.style.display = "block";
    } else {
        formulario.style.display = "none";
    }
}

//Función para agregar una nueva tarea al arreglo
function agregarTarea() {
    var nuevaTarea = document.getElementById("nuevaTarea").value;
    tareas.push({ tarea: nuevaTarea });
    tabla(tareas);
    document.getElementById("formulario").style.display = "none";
    document.getElementById("nuevaTarea").value = "";
}