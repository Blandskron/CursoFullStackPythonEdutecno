### README - Portafolio Personal

#### Descripción del Proyecto
Este proyecto consiste en el desarrollo de un portafolio personal responsivo, el cual muestra información sobre tus habilidades y proyectos, y proporciona un formulario de contacto. El portafolio está construido con HTML, CSS, Bootstrap y JavaScript, siguiendo una estructura lógica y semántica.

#### Estructura del Proyecto
El proyecto está organizado en las siguientes secciones:
- **Información Personal**
- **Habilidades**
- **Proyectos Realizados**
- **Formulario de Contacto**

#### Requerimientos del Proyecto
El portafolio debe cumplir con los siguientes requerimientos:
1. **Estructura HTML (15 puntos)**
2. **Estilo CSS (15 puntos)**
3. **Bootstrap (15 puntos)**
4. **JavaScript básico (15 puntos)**
5. **Proyectos y habilidades (10 puntos)**
6. **Formulario de contacto (15 puntos)**
7. **Creatividad y originalidad (15 puntos)**

#### Desarrollo del Proyecto

1. **Estructura HTML**
   - **Uso de etiquetas semánticas:** Se utilizaron etiquetas semánticas como `<header>`, `<nav>`, `<main>`, `<section>`, y `<footer>`.
   - **Inclusión de encabezados, párrafos y listas:** Se utilizaron encabezados (`<h1>`, `<h2>`), párrafos (`<p>`), y listas (`<ul>`) para estructurar la información.
   - **Organización lógica:** La información se organizó de manera lógica y fácil de seguir, con secciones claramente definidas.

   ```html
   <header class="bg-primary text-white text-center p-4">
       <h1>Mi Portafolio</h1>
   </header>
   <nav class="navbar navbar-expand-lg navbar-light bg-light">
       <!-- Contenido del Navbar -->
   </nav>
   <main class="container my-4">
       <section id="about">
           <h2 class="section-title">Sobre mí</h2>
           <p>Hola, soy [Tu Nombre], un apasionado desarrollador web con experiencia en [tus áreas de especialización].</p>
       </section>
       <!-- Otras secciones -->
   </main>
   <footer class="bg-dark text-white text-center p-3">
       <p>&copy; 2024 Mi Portafolio</p>
   </footer>
   ```

2. **Estilo CSS**
   - **Selectores y reglas CSS:** Se aplicaron estilos personalizados usando selectores de clase, ID y etiquetas.
   - **Diseño atractivo y coherente:** Se creó un diseño visualmente atractivo y consistente.
   - **Estilos responsivos:** Se utilizaron media queries para adaptar el diseño a diferentes tamaños de pantalla.

   ```css
   body {
       font-family: Arial, sans-serif;
   }
   .section-title {
       text-align: center;
       margin: 20px 0;
   }
   ```

3. **Bootstrap**
   - **Integración de componentes:** Se integraron componentes de Bootstrap como Navbar y Card.
   - **Clases y estilos de Bootstrap:** Se aplicaron clases y estilos de Bootstrap para asegurar un diseño responsivo.

   ```html
   <nav class="navbar navbar-expand-lg navbar-light bg-light">
       <a class="navbar-brand" href="#">Inicio</a>
       <!-- Resto del contenido del navbar -->
   </nav>
   ```

4. **JavaScript básico**
   - **Interactividad básica:** Se añadió interactividad básica para la validación del formulario de contacto.
   - **Manipulación del DOM:** Se utilizó JavaScript para validar los campos del formulario.

   ```javascript
   document.getElementById('contactForm').addEventListener('submit', function(event) {
       var name = document.getElementById('name').value;
       var email = document.getElementById('email').value;
       var message = document.getElementById('message').value;
       if (!name || !email || !message) {
           event.preventDefault();
           alert('Por favor, complete todos los campos.');
       }
   });
   ```

5. **Proyectos y habilidades**
   - **Sección de proyectos:** Se creó una galería de proyectos utilizando las tarjetas (`<div class="card">`) de Bootstrap.
   - **Lista de habilidades:** Se enumeraron las habilidades relevantes en una lista.

   ```html
   <section id="skills">
       <h2 class="section-title">Habilidades</h2>
       <ul>
           <li>HTML</li>
           <li>CSS</li>
           <li>JavaScript</li>
           <li>Bootstrap</li>
       </ul>
   </section>
   ```

6. **Formulario de contacto**
   - **Formulario básico:** Se incluyó un formulario con campos para nombre, email y mensaje.
   - **Validación de campos:** Se implementó validación básica para asegurarse de que los campos no estén vacíos.

   ```html
   <section id="contact">
       <h2 class="section-title">Contacto</h2>
       <form id="contactForm">
           <div class="form-group">
               <label for="name">Nombre:</label>
               <input type="text" class="form-control" id="name" required>
           </div>
           <div class="form-group">
               <label for="email">Email:</label>
               <input type="email" class="form-control" id="email" required>
           </div>
           <div class="form-group">
               <label for="message">Mensaje:</label>
               <textarea class="form-control" id="message" rows="3" required></textarea>
           </div>
           <button type="submit" class="btn btn-primary">Enviar</button>
       </form>
   </section>
   ```

7. **Creatividad y originalidad**
   - **Elementos creativos:** Se incluyeron elementos visuales únicos y se aplicaron tecnologías aprendidas de manera innovadora.
   - **Uso innovador de tecnologías:** Se destacaron elementos visuales y funcionalidades únicas para hacer que el portafolio sea distintivo.

#### Instalación y Uso

1. **Clonar el repositorio:**
   ```bash
   git clone [URL del repositorio]
   ```

2. **Abrir el archivo HTML:**
   - Abrir `index.html` en un navegador web para visualizar el portafolio.

#### Dependencias

- **Bootstrap:** Se incluyó Bootstrap desde un CDN para facilitar la integración.
- **jQuery:** Se utilizó jQuery desde un CDN para simplificar la manipulación del DOM.

```html
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
```

