**Sitio web para expresiones regulares:** [Regex101](https://regex101.com/)

**Paso a paso para el formulario HTML con expresiones regulares:**

1. **Creación del archivo HTML:**
   - Abre tu editor de texto o entorno de desarrollo favorito (como Visual Studio Code, Sublime Text, Atom, etc.).
   - Crea un nuevo archivo y nómbralo `formulario.html`.

2. **Estructura básica del HTML:**
   - Añade la estructura básica del documento HTML:
     ```html
     <!DOCTYPE html>
     <html lang="es">
     <head>
         <meta charset="UTF-8">
         <meta name="viewport" content="width=device-width, initial-scale=1.0">
         <title>Formulario Completo</title>
     </head>
     <body>
         <!-- Aquí irá el contenido del formulario -->
     </body>
     </html>
     ```

3. **Añadir el formulario:**
   - Dentro de la etiqueta `<body>`, añade la estructura del formulario con todos los campos y etiquetas:
     ```html
     <form action="/submit" method="post">
         <!-- Campo de texto -->
         <label for="nombre">Nombre:</label>
         <input type="text" id="nombre" name="nombre" required pattern="[A-Za-z\s]{1,50}" title="Solo letras y espacios, máximo 50 caracteres">
         <br><br>

         <!-- Campo de contraseña -->
         <label for="password">Contraseña:</label>
         <input type="password" id="password" name="password" required pattern=".{8,}" title="Mínimo 8 caracteres">
         <br><br>

         <!-- Campo de correo electrónico -->
         <label for="email">Correo Electrónico:</label>
         <input type="email" id="email" name="email" required>
         <br><br>

         <!-- Campo de número -->
         <label for="telefono">Teléfono:</label>
         <input type="tel" id="telefono" name="telefono" required pattern="\+?[0-9\s\-]{7,15}" title="Formato de teléfono válido, por ejemplo: +56912345678">
         <br><br>

         <!-- Campo de URL -->
         <label for="sitio_web">Sitio Web:</label>
         <input type="url" id="sitio_web" name="sitio_web">
         <br><br>

         <!-- Campo de fecha -->
         <label for="fecha_nacimiento">Fecha de Nacimiento:</label>
         <input type="date" id="fecha_nacimiento" name="fecha_nacimiento" required>
         <br><br>

         <!-- Campo de tiempo -->
         <label for="hora">Hora:</label>
         <input type="time" id="hora" name="hora">
         <br><br>

         <!-- Campo de número con límite -->
         <label for="edad">Edad:</label>
         <input type="number" id="edad" name="edad" min="0" max="100" required>
         <br><br>

         <!-- Campo de búsqueda -->
         <label for="buscar">Buscar:</label>
         <input type="search" id="buscar" name="buscar">
         <br><br>

         <!-- Selector de color -->
         <label for="color">Color Favorito:</label>
         <input type="color" id="color" name="color">
         <br><br>

         <!-- Selector de archivo -->
         <label for="archivo">Subir Archivo:</label>
         <input type="file" id="archivo" name="archivo">
         <br><br>

         <!-- Selector de rango -->
         <label for="rango">Rango:</label>
         <input type="range" id="rango" name="rango" min="0" max="100">
         <br><br>

         <!-- Campo de casilla de verificación -->
         <label for="aceptar">
             <input type="checkbox" id="aceptar" name="aceptar" required>
             Acepto los términos y condiciones
         </label>
         <br><br>

         <!-- Botones de opción (radio) -->
         <label>Género:</label>
         <label for="masculino">
             <input type="radio" id="masculino" name="genero" value="masculino" required>
             Masculino
         </label>
         <label for="femenino">
             <input type="radio" id="femenino" name="genero" value="femenino">
             Femenino
         </label>
         <br><br>

         <!-- Selector (dropdown) -->
         <label for="pais">País:</label>
         <select id="pais" name="pais" required>
             <option value="">Seleccione su país</option>
             <option value="chile">Chile</option>
             <option value="argentina">Argentina</option>
             <option value="peru">Perú</option>
             <option value="brasil">Brasil</option>
         </select>
         <br><br>

         <!-- Campo de área de texto -->
         <label for="comentarios">Comentarios:</label>
         <textarea id="comentarios" name="comentarios" rows="4" cols="50" required></textarea>
         <br><br>

         <!-- Botón de envío -->
         <input type="submit" value="Enviar">
         <br><br>

         <!-- Botón de reinicio -->
         <input type="reset" value="Reiniciar">
         <br><br>

         <!-- Campo oculto -->
         <input type="hidden" name="token" value="1234567890">
         <br><br>

         <!-- Campo de imagen como botón de envío -->
         <input type="image" src="boton_enviar.png" alt="Enviar">
         <br><br>
     </form>
     ```

4. **Expresiones regulares y atributos:**
   - Las expresiones regulares se añaden en los campos con el atributo `pattern`. El atributo `title` se utiliza para proporcionar un mensaje de ayuda sobre el formato requerido.

5. **Guarda y prueba el formulario:**
   - Guarda el archivo `formulario.html`.
   - Abre el archivo en un navegador web para probar la funcionalidad del formulario y asegurarte de que los campos con expresiones regulares funcionan correctamente.
