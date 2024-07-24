# Crear un Curriculum Vitae en HTML

Este documento proporciona una guía paso a paso para crear un currículum vitae utilizando HTML. Asegúrate de seguir cada paso cuidadosamente para lograr el resultado deseado.

## Estructura del Proyecto
Crea la siguiente estructura de carpetas y archivos para organizar tu proyecto:

```
/mi-cv
    └── index.html
```

## Paso 1: Crear el Archivo HTML

1. **Abrir tu editor de texto**:
   - Puedes utilizar cualquier editor de texto, como Visual Studio Code, Sublime Text, o Notepad++.

2. **Crear un nuevo archivo**:
   - Nombra este archivo `index.html` y guárdalo en la carpeta `mi-cv`.

3. **Agregar la estructura básica del HTML**:
   - Copia y pega el siguiente código en tu archivo `index.html`.

```html
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <title>Curriculum Vitae</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        header {
            text-align: center;
            margin-bottom: 20px;
        }
        .section-title {
            color: #2c3e50;
            border-bottom: 2px solid #2c3e50;
            padding-bottom: 5px;
            margin-bottom: 15px;
        }
        .contact-info, .education, .experience, .achievements {
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <header>
        <h1>Juan Pérez</h1>
        <p><em>Desarrollador Web</em></p>
    </header>

    <section class="introduction">
        <h2 class="section-title">Introducción</h2>
        <p>Soy <strong>Juan Pérez</strong>, un desarrollador web con pasión por crear soluciones innovadoras y funcionales. Busco una oportunidad para aplicar mis habilidades y contribuir al éxito de una empresa dinámica. Ofrezco un sólido conocimiento en HTML, CSS, y JavaScript, así como una actitud proactiva y un compromiso constante con el aprendizaje y la mejora continua.</p>
    </section>

    <section class="contact-info">
        <h2 class="section-title">Datos Personales</h2>
        <ul>
            <li><strong>Nombre:</strong> Juan Pérez</li>
            <li><strong>Dirección:</strong> Calle Falsa 123, Ciudad, País</li>
            <li><strong>Teléfono:</strong> +123 456 7890</li>
            <li><strong>Email:</strong> juan.perez@example.com</li>
        </ul>
    </section>

    <section class="experience">
        <h2 class="section-title">Información Laboral</h2>
        <ul>
            <li><strong>Empresa XYZ</strong> - Desarrollador Web (2020 - Presente)
                <ul>
                    <li>Desarrollo y mantenimiento de sitios web responsivos.</li>
                    <li>Colaboración con equipos de diseño para implementar nuevas características.</li>
                    <li>Optimización de sitios web para mejorar la velocidad y el rendimiento.</li>
                </ul>
            </li>
            <li><strong>Empresa ABC</strong> - Asistente de Desarrollo (2018 - 2020)
                <ul>
                    <li>Soporte en el desarrollo de aplicaciones web internas.</li>
                    <li>Pruebas y depuración de código para asegurar la calidad.</li>
                </ul>
            </li>
        </ul>
    </section>

    <section class="education">
        <h2 class="section-title">Información Académica</h2>
        <ul>
            <li><strong>Universidad de la Ciudad</strong> - Licenciatura en Ingeniería de Software (2014 - 2018)</li>
            <li><strong>Instituto Tecnológico</strong> - Técnico en Desarrollo Web (2012 - 2014)</li>
        </ul>
    </section>

    <section class="achievements">
        <h2 class="section-title">Logros</h2>
        <ul>
            <li>Ganador del Premio al Mejor Proyecto de Desarrollo Web - Universidad de la Ciudad (2018)</li>
            <li>Certificación en Desarrollo Web por la Plataforma X (2020)</li>
        </ul>
    </section>

    <section class="links">
        <h2 class="section-title">Enlaces</h2>
        <p>Puedes encontrar más información en mi <a href="https://www.linkedin.com" target="_blank"><strong>perfil de LinkedIn</strong></a>.</p>
    </section>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>
```

## Paso 2: Explicación de las Secciones del Código HTML

1. **Encabezado del HTML (`<head>`)**:
   - Define los metadatos del documento y los enlaces a hojas de estilo externas (Bootstrap) y estilos internos.
   - Asegúrate de incluir la meta etiqueta `viewport` para la compatibilidad con dispositivos móviles.

2. **Cuerpo del HTML (`<body>`)**:
   - Contiene todo el contenido visible de la página.

3. **Encabezado del CV (`<header>`)**:
   - Incluye el nombre y el título profesional del individuo.
   - Se utiliza la etiqueta `<em>` para poner en cursiva el título profesional.

4. **Sección de Introducción (`<section class="introduction">`)**:
   - Proporciona una breve introducción sobre quién eres, qué buscas y qué puedes ofrecer.
   - Utiliza la etiqueta `<strong>` para poner en negrita tu nombre.

5. **Datos Personales (`<section class="contact-info">`)**:
   - Lista información personal relevante como nombre, dirección, teléfono y correo electrónico.

6. **Información Laboral (`<section class="experience">`)**:
   - Detalla la experiencia laboral, incluyendo puestos de trabajo anteriores y responsabilidades.
   - Utiliza listas anidadas (`<ul>` y `<li>`) para estructurar la información.

7. **Información Académica (`<section class="education">`)**:
   - Detalla la formación académica, incluyendo títulos y fechas.

8. **Logros (`<section class="achievements">`)**:
   - Lista logros destacados, premios y certificaciones.

9. **Enlaces (`<section class="links">`)**:
   - Proporciona un enlace a tu perfil de LinkedIn o cualquier otro sitio relevante.
   - Utiliza la etiqueta `<a>` para crear hipervínculos.

10. **Script de Bootstrap (`<script>`)**:
    - Incluye el script de Bootstrap para funcionalidad adicional.

## Paso 3: Visualizar el Proyecto

1. **Abrir el archivo HTML**:
   - Abre el archivo `index.html` en tu navegador web para visualizar tu currículum vitae.

## Conclusión

Siguiendo estos pasos, habrás creado un currículum vitae básico pero profesional utilizando HTML y Bootstrap. Puedes personalizar la información y los estilos según tus necesidades. ¡Disfruta creando tu currículum y muestra tus habilidades al mundo!