// Creación de un array multidimensional (matriz)
let matriz = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
];

// Acceso a un elemento específico de la matriz
console.log("Elemento en [1][2]: " + matriz[1][2]); // Salida: 6

// Recorrido de la matriz con un bucle
for (let i = 0; i < matriz.length; i++) {
    for (let j = 0; j < matriz[i].length; j++) {
        console.log("Elemento en [" + i + "][" + j + "]: " + matriz[i][j]);
    }
}
