// Crea una lista de tareas a partir de entradas de usuario
document.getElementById("agregarTarea").addEventListener("click", function() {
    var tarea = document.getElementById("nuevaTarea").value;
    if(tarea !== "") {
        var li = document.createElement("li");
        li.innerText = tarea;
        document.getElementById("listaTareas").appendChild(li);
        document.getElementById("nuevaTarea").value = "";
    }
});
