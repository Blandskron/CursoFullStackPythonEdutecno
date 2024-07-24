# README: Crear un Portafolio HTML

Este documento proporciona una guía paso a paso para crear un archivo HTML que constituye un portafolio personal. Asegúrate de seguir cada paso cuidadosamente para lograr el resultado deseado.

## Requisitos Previos
- Conocimientos básicos de HTML y CSS.
- Editor de texto (ej. Visual Studio Code, Sublime Text).
- Navegador web para visualizar los cambios (ej. Google Chrome, Firefox).

## Estructura del Proyecto
Crea la siguiente estructura de carpetas y archivos para organizar tu proyecto:

```
/proyecto-portafolio
    ├── /assets
    │   ├── /css
    │   │   └── style.css
    │   ├── /img
    │   │   ├── Proyecto1.png
    │   │   ├── proyecto2.avif
    │   │   ├── Proyecto3.jpg
    │   │   └── logotipo-de-github.png
    │   └── /js
    │       └── script.js
    └── index.html
```

## Paso 1: Crear el Archivo HTML

1. Abre tu editor de texto y crea un archivo llamado `index.html`.
2. Agrega la estructura básica del HTML:

```html
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="assets/css/style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <title>Mi Portafolio</title>
</head>
<body>
    <!-- Encabezado del portafolio -->
    <header>
        <h1>Sophia Smith</h1>
        <p>Desarrollador Frontend</p>
    </header>

    <!-- Sección sobre mí -->
    <section id="about">
        <h2>Sobre Mí</h2>
        <p>¡Hola! Soy un apasionada desarrollador frontend con un amor por la creación visual y la funcionalidad intuitiva. Mi fascinación por el diseño web y la tecnología me lleva a explorar continuamente nuevas tendencias y herramientas. Con habilidades sólidas en HTML, CSS, y JavaScript, transformo ideas en experiencias interactivas y atractivas. Mi enfoque meticuloso y creativo se combina con un deseo constante de aprendizaje. Cuando no estoy codificando, me encontrarás disfrutando de la combinación perfecta de café y código. ¡Estoy emocionada por la oportunidad de compartir mi viaje de desarrollo frontend contigo!</p>
    </section>

    <!-- Sección de proyectos -->
    <section id="projects">
        <h2>Proyectos</h2>
        <div class="row row-cols-1 row-cols-md-3 g-4">
            <div class="col">
              <div class="card h-100">
                <img src="assets/img/Proyecto1.png" class="card-img-top" alt="proyecto1">
                <div class="card-body">
                  <h5 class="card-title">RESTORANT RESTÓ</h5>
                  <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur tincidunt, sem eget sollicitudin tempor, ante nibh finibus odio, eu dignissim sem.</p>
                  <div class="m-3 text-center">
                    <button class="html">HTML5</button>
                    <button class="css">CSS</button>
                    <button class="js">JS</button>
                    <button class="bootstrap">BOOTSTRAP</button>
                  </div>
                  <div class="text-center">
                    <img style="width: 15%;" src="assets/img/logotipo-de-github.png" alt="GitHub">
                  </div>
                </div>
              </div>
            </div>
            <div class="col">
              <div class="card h-100">
                <img src="assets/img/proyecto2.avif" class="card-img-top" alt="Pokemón">
                <div class="card-body">
                  <h5 class="card-title">POKEMÓN</h5>
                  <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur tincidunt, sem eget sollicitudin tempor, ante nibh finibus odio, eu dignissim sem.</p>
                    <div class="m-3 text-center">
                        <button class="html">HTML5</button>
                        <button class="css">CSS</button>
                        <button class="bootstrap">BOOTSTRAP</button>
                        <button class="vue">VUE JS</button>
                    </div>
                    <div class="text-center">
                        <img style="width: 15%;" src="assets/img/logotipo-de-github.png" alt="GitHub">
                    </div>
                </div>
              </div>
            </div>
            <div class="col">
              <div class="card h-100">
                <img src="assets/img/Proyecto3.jpg" class="card-img-top" alt="Blog">
                <div class="card-body">
                  <h5 class="card-title">BLOG PERSONAL</h5>
                  <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur tincidunt, sem eget sollicitudin tempor, ante nibh finibus odio, eu dignissim sem.</p>
                    <div class="m-3 text-center">
                        <button class="html">HTML5</button>
                        <button class="css">CSS</button>
                        <button class="bootstrap">BOOTSTRAP</button>
                    </div>
                    <div class="text-center">
                        <img style="width: 15%;" src="assets/img/logotipo-de-github.png" alt="GitHub">
                    </div>
                </div>
              </div>
            </div>
          </div>
    </section>

    <!-- Sección de contacto -->
    <section id="contact">
        <h2>Contacto</h2>
        <form>
          <div class="mb-3">
            <label for="name" class="form-label">Nombre</label>
            <input type="text" class="form-control" id="name" aria-describedby="emailHelp">
          </div>
          <div class="mb-3">
            <label for="correo" class="form-label">Correo</label>
            <input type="email" class="form-control" id="correo">
          </div>
          <div class="mb-3">
            <label for="exampleFormControlTextarea1" class="form-label">Detalles</label>
            <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
          </div>
          <button type="submit" class="btn btn-primary">Enviar</button>
        </form>
    </section>

    <!-- Pie de página -->
    <footer class="text-center">
        <p>&copy; 2024 Mi Portafolio</p>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    <script src="assets/js/script.js"></script>
</body>
</html>
```

## Paso 2: Crear el Archivo de Estilos CSS

1. Dentro de la carpeta `assets/css`, crea un archivo llamado `style.css`.
2. Agrega estilos básicos para el portafolio:

```css
body {    
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

header, nav, section, footer {
    padding: 20px;
    margin: 20px;
    border: 1px solid #ddd;
    border-radius: 8px;
}

#about{
    text-align: justify;
}


button {
    padding: 10px;
    background-color: #3498db;
    color: #fff;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}

.bootstrap{
    background-color: #6f42c1;
}
.html{
    background-color: #e34c26;
}
.css{
    background-color: #264de4;
}
.js{
    background-color: #F0DB4F;
    color: black;
}
.vue{
    background-color: #41B883;
}
```

## Paso 3: Agregar Imágenes

1. Dentro de la carpeta `assets/img`, agrega las siguientes imágenes con estos nombres:
   - Proyecto1.png
   - proyecto2.avif
   - Proyecto3.jpg
   - logotipo-de-github.png

## Paso 4: Agregar Script JavaScript

1. Dentro de la carpeta `assets/js`, crea un archivo llamado `script.js`.
2. Puedes agregar cualquier funcionalidad adicional con JavaScript si lo deseas.

```js
function validarCorreo() {
    var correo = document.getElementById('correo').value;

    // Expresión regular para validar el formato del correo electrónico
    var regexCorreo = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

    if (regexCorreo.test(correo)) {
        alert('Correo electrónico válido');
    } else {
        alert('Correo electrónico inválido');
    }
}
```

## Paso 5: Visualizar el Proyecto

1. Abre el archivo `index.html` en tu navegador web.
2. Verifica que todo se vea y funcione correctamente.

## Conclusión

Siguiendo estos pasos, habrás creado un portafolio personal utilizando HTML y CSS, con Bootstrap para estilos adicionales. Puedes personalizar este portafolio según tus necesidades y agregar más contenido o secciones según sea necesario.

¡Disfruta creando tu portafolio y muestra tu trabajo al mundo!
