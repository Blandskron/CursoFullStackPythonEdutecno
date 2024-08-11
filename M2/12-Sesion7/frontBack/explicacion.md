### 1. Crear el archivo JSON

Primero, crea un archivo JSON llamado `datos.json` que contendrá la información que deseas mostrar en el frontend. Este archivo podría tener el siguiente contenido:

```json
[
    {
        "titulo": "Artículo 1",
        "descripcion": "Este es el primer artículo."
    },
    {
        "titulo": "Artículo 2",
        "descripcion": "Este es el segundo artículo."
    },
    {
        "titulo": "Artículo 3",
        "descripcion": "Este es el tercer artículo."
    }
]
```

### 2. Crear el archivo HTML

Luego, crea un archivo HTML que utilizará JavaScript para cargar y mostrar los datos del archivo JSON. Aquí te dejo un ejemplo:

```html
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mostrar contenido con JSON</title>
</head>
<body>
    <h1>Artículos</h1>
    <!-- Este contenedor se usará para mostrar los datos que lleguen del JSON -->
    <div id="contenedor-articulos"></div>

    <script>
        // Paso 1: Crear una nueva solicitud HTTP
        var xhr = new XMLHttpRequest();

        // Paso 2: Configurar la solicitud para obtener el archivo JSON
        xhr.open("GET", "datos.json", true);

        // Paso 3: Definir qué hacer cuando la solicitud es exitosa
        xhr.onreadystatechange = function() {
            if (xhr.readyState == 4 && xhr.status == 200) {
                // Paso 4: Convertir el texto JSON a un objeto de JavaScript
                var articulos = JSON.parse(xhr.responseText);

                // Paso 5: Seleccionar el contenedor en el HTML donde se mostrarán los artículos
                var contenedor = document.getElementById('contenedor-articulos');

                // Paso 6: Recorrer cada artículo en el array y crear elementos HTML para mostrarlo
                articulos.forEach(function(articulo) {
                    // Crear un elemento <h2> para el título del artículo
                    var tituloElemento = document.createElement('h2');
                    tituloElemento.textContent = articulo.titulo; // Asignar el título del artículo

                    // Crear un elemento <p> para la descripción del artículo
                    var descripcionElemento = document.createElement('p');
                    descripcionElemento.textContent = articulo.descripcion; // Asignar la descripción del artículo

                    // Agregar los elementos al contenedor
                    contenedor.appendChild(tituloElemento);
                    contenedor.appendChild(descripcionElemento);
                });
            }
        };

        // Paso 7: Enviar la solicitud al servidor para obtener los datos
        xhr.send();
    </script>
</body>
</html>
```

### Explicación del Código:

1. **Estructura del HTML:**  
   El HTML básico contiene un `div` con el `id="contenedor-articulos"` donde se insertará el contenido que se cargue desde el JSON.

2. **Creación de la solicitud HTTP (XHR):**  
   Se crea un objeto `XMLHttpRequest` (`xhr`) que es utilizado para hacer solicitudes HTTP y obtener datos desde un servidor. En este caso, se solicita el archivo `datos.json`.

3. **Configuración de la solicitud (`open`):**  
   Se configura la solicitud para que sea de tipo GET, lo que significa que queremos obtener datos. El tercer parámetro `true` indica que la solicitud es asíncrona, lo que significa que no bloquea la ejecución del resto del código mientras espera la respuesta.

4. **Manejo de la respuesta (`onreadystatechange`):**  
   Se define una función que se ejecuta cada vez que cambia el estado de la solicitud (`readyState`). Cuando el `readyState` es 4 y el `status` es 200, significa que la solicitud ha sido completada con éxito y los datos han sido recibidos.

5. **Parsear el JSON (`JSON.parse`):**  
   Los datos recibidos en `xhr.responseText` están en formato JSON, que es una cadena de texto. Para trabajar con estos datos en JavaScript, se convierte esa cadena en un objeto JavaScript utilizando `JSON.parse`.

6. **Mostrar el contenido en HTML:**  
   Se recorre cada objeto en el array `articulos` y se crean elementos HTML (`h2` para los títulos y `p` para las descripciones) que se añaden al `div` con `id="contenedor-articulos"`.

7. **Enviar la solicitud:**  
   Finalmente, se envía la solicitud al servidor con `xhr.send()` para que se ejecute y obtenga los datos.
