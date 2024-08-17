// Cambia el estilo de un elemento al pasar el mouse sobre él
document.getElementById("miElemento").addEventListener("mouseover", function() {
    this.style.backgroundColor = "yellow";
});
document.getElementById("miElemento").addEventListener("mouseout", function() {
    this.style.backgroundColor = "";
});
