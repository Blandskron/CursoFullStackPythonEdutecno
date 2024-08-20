// Crea un nuevo párrafo y lo añade a un div existente
var nuevoParrafo = document.createElement("p");
nuevoParrafo.innerText = "Este es un nuevo párrafo.";
document.getElementById("miDiv").appendChild(nuevoParrafo);

var titulo = document.createElement("h2");
titulo.innerText = "Este es un título.";
document.getElementById("miTitulo").appendChild(titulo);