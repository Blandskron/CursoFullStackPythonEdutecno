// Simulación de datos que se obtendrán, modificarán y eliminarán
let data = [
    { id: 1, nombre: "Producto A" },
    { id: 2, nombre: "Producto B" },
    { id: 3, nombre: "Producto C" }
];

// Función GET: Simula obtener datos
function getData() {
    console.log("Método GET ejecutado");
    let id = parseInt(document.getElementById('productId').value);
    if (id) {
        let producto = data.find(p => p.id === id);
        if (producto) {
            document.getElementById('resultado').textContent = "Producto encontrado: " + JSON.stringify(producto, null, 2);
        } else {
            document.getElementById('resultado').textContent = "Producto no encontrado.";
        }
    } else {
        document.getElementById('resultado').textContent = "Todos los productos: " + JSON.stringify(data, null, 2);
    }
}

// Función POST: Simula agregar un nuevo elemento
function postData() {
    console.log("Método POST ejecutado");
    let id = parseInt(document.getElementById('productId').value);
    let nombre = document.getElementById('productName').value;
    if (id && nombre) {
        let nuevoProducto = { id: id, nombre: nombre };
        data.push(nuevoProducto);
        document.getElementById('resultado').textContent = "Producto agregado: " + JSON.stringify(nuevoProducto, null, 2);
    } else {
        document.getElementById('resultado').textContent = "Por favor, proporciona tanto el ID como el nombre del producto.";
    }
}

// Función PUT: Simula modificar un elemento existente
function putData() {
    console.log("Método PUT ejecutado");
    let id = parseInt(document.getElementById('productId').value);
    let nombre = document.getElementById('productName').value;
    if (id && nombre) {
        let productoModificado = data.find(p => p.id === id);
        if (productoModificado) {
            productoModificado.nombre = nombre;
            document.getElementById('resultado').textContent = "Producto modificado: " + JSON.stringify(productoModificado, null, 2);
        } else {
            document.getElementById('resultado').textContent = "Producto no encontrado para modificar.";
        }
    } else {
        document.getElementById('resultado').textContent = "Por favor, proporciona tanto el ID como el nombre del producto.";
    }
}

// Función DELETE: Simula eliminar un elemento
function deleteData() {
    console.log("Método DELETE ejecutado");
    let id = parseInt(document.getElementById('productId').value);
    if (id) {
        let index = data.findIndex(p => p.id === id);
        if (index !== -1) {
            let eliminado = data.splice(index, 1);
            document.getElementById('resultado').textContent = "Producto eliminado: " + JSON.stringify(eliminado[0], null, 2);
        } else {
            document.getElementById('resultado').textContent = "Producto no encontrado para eliminar.";
        }
    } else {
        document.getElementById('resultado').textContent = "Por favor, proporciona el ID del producto a eliminar.";
    }
}
