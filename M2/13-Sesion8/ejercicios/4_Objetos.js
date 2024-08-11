// Creación de un objeto con propiedades y métodos
let coche = {
    marca: "Toyota",
    modelo: "Corolla",
    año: 2020,
    arrancar: function() {
        console.log(this.marca + " " + this.modelo + " ha arrancado.");
    }
};

// Acceso a las propiedades del objeto
console.log("Marca del coche: " + coche.marca); // Salida: Toyota
console.log("Año del coche: " + coche.año); // Salida: 2020

// Llamada a un método del objeto
coche.arrancar(); // Salida: Toyota Corolla ha arrancado.
