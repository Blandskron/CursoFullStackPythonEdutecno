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
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Curriculum Vitae</title>
</head>
<body>

    <h1 style="text-align:center;">Bill Mollison</h1>

    <hr>
    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptas dolore cum ab eum esse deleniti, nobis in recusandae
        delectus quidem at soluta earum sunt optio magni numquam debitis libero. Fugiat? Lorem ipsum dolor sit amet consectetur
        exercitationem sapiente accusamus ab odit sed nam quo, fugit nihil! Perspiciatis odio dolorum esse magni provident, eos culpa neque!</p>
    <hr>

    <p> <b>NOMBRE:</b> Bruce Charles Mollison</p>
    <p> <strong>FECHA DE NACIMIENTO:</strong> 04/ mayo /1928</p>
    <p><b>TELEFONO:</b> 123456789</p>
    <p><b>DNI:</b> 123456789</p>

    <h2>ANTECEDENTES ACADÉMICOS</h2>

    <ul>
        <li>Universidad de Tasmania</li>
    </ul>

    <h2>ANTECEDENTES LABORALES</h2>

    <ul>
        <li> <i>SCIRO:</i> Biólogo</li>
        <li><i>Universidad de Tasmania:</i> Desarrollador de la unidad de psicología ambiental</li>
    </ul>

    <h2>LOGROS</h2>

    <ul>
        <li> <i>Permaculture One:</i> Lanzamiento del libro en 1974 con los principios del concepto de la permacultura</li>
        <li><i>Right Livelihood Award:</i> Recibimiento del reconocimiento ambiental en 1981</li>
        <li><i>Instituto de Permacultura:</i> Establecido en 1979</li>
        <li><i>Premio Nacional Senior de Australia e Icono Australiano del Milenio:</i> Reconocimiento adquirido en 2010</li>
    </ul>

    <p style="text-align: center;">Para tener más información puedes dirigirte a <a href="https://www.permacultura-es.org/">Permacultura.org</a> </p>
</body>
</html>
```

## Paso 2: Explicación de las Secciones del Código HTML

1. **Encabezado del HTML (`<head>`)**:
   - Define los metadatos del documento y establece el título de la página.
   - Incluye la meta etiqueta `viewport` para la compatibilidad con dispositivos móviles.

2. **Cuerpo del HTML (`<body>`)**:
   - Contiene todo el contenido visible de la página.

3. **Título Principal (`<h1>`)**:
   - Centra el nombre "Bill Mollison" utilizando el atributo `style`.

4. **Separador Horizontal (`<hr>`)**:
   - Utiliza la etiqueta `<hr>` para crear una línea horizontal que separa las secciones.

5. **Párrafo de Introducción (`<p>`)**:
   - Describe brevemente quién es Bill Mollison utilizando texto ficticio.

6. **Datos Personales**:
   - Utiliza etiquetas de párrafo (`<p>`) para listar información personal como nombre, fecha de nacimiento, teléfono y DNI.
   - Usa las etiquetas `<b>` y `<strong>` para poner en negrita ciertos términos.

7. **Antecedentes Académicos**:
   - Utiliza un encabezado (`<h2>`) para el título de la sección.
   - Lista la información académica dentro de una lista no ordenada (`<ul>`).

8. **Antecedentes Laborales**:
   - Utiliza un encabezado (`<h2>`) para el título de la sección.
   - Lista la experiencia laboral dentro de una lista no ordenada (`<ul>`).
   - Usa la etiqueta `<i>` para poner en cursiva el nombre de las organizaciones.

9. **Logros**:
   - Utiliza un encabezado (`<h2>`) para el título de la sección.
   - Lista los logros dentro de una lista no ordenada (`<ul>`).
   - Usa la etiqueta `<i>` para poner en cursiva el nombre de los logros y reconocimientos.

10. **Enlace**:
    - Proporciona un enlace a un sitio web relevante utilizando la etiqueta `<a>`.
    - Centra el texto utilizando el atributo `style`.

## Paso 3: Visualizar el Proyecto

1. **Abrir el archivo HTML**:
   - Abre el archivo `index.html` en tu navegador web para visualizar tu currículum vitae.

## Conclusión

Siguiendo estos pasos, habrás creado un currículum vitae simple utilizando HTML. Puedes personalizar la información y los estilos según tus necesidades. ¡Disfruta creando tu currículum y muestra tus habilidades al mundo!