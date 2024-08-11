// Bucle 'for...in' que itera sobre las propiedades de un objeto
const persona = { nombre: "Ana", edad: 30, ciudad: "Madrid" };

for (let propiedad in persona) {
    console.log(propiedad + ": " + persona[propiedad]); // Muestra cada propiedad y su valor
}
