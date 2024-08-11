// Uso de 'this' dentro de un objeto
let persona = {
    nombre: "Carlos",
    saludar: function() {
        console.log("Hola, " + this.nombre + "!"); // 'this' se refiere al objeto 'persona'
    }
};

persona.saludar(); // Salida: Hola, Carlos!
