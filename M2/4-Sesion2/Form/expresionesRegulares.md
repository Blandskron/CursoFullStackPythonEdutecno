# Expresiones Regulares

## Introducción

Las expresiones regulares, a menudo abreviadas como regex o regexp, son secuencias de caracteres que forman un patrón de búsqueda. Se utilizan principalmente para encontrar coincidencias dentro de textos, validar formatos específicos y realizar sustituciones. Las expresiones regulares son una herramienta poderosa en la programación y se pueden usar en diversos lenguajes, incluyendo Python, JavaScript, Java, y muchos otros.

## ¿Qué son las Expresiones Regulares?

Una expresión regular es una cadena de texto que define un patrón de búsqueda. Este patrón se utiliza para encontrar coincidencias en otros textos o para realizar operaciones como búsqueda y reemplazo. Las expresiones regulares pueden ser simples o complejas, dependiendo de los requerimientos específicos de la búsqueda.

### Ejemplo Simple

Un ejemplo básico de una expresión regular es `abc`, que coincide exactamente con la secuencia de caracteres "abc" en un texto.

### Ejemplo Avanzado

Las expresiones regulares también pueden contener metacaracteres y operadores especiales para definir patrones más complejos. Por ejemplo, `\d{3}-\d{2}-\d{4}` es una expresión regular que coincide con el formato de un número de seguro social en Estados Unidos, que tiene el formato "123-45-6789".

## Componentes Básicos de las Expresiones Regulares

- **Literales**: Son los caracteres simples que se buscan tal cual en el texto. Ejemplo: `cat` busca la palabra "cat".
- **Metacaracteres**: Son caracteres especiales que tienen un significado especial en las expresiones regulares. Algunos de los más comunes son:
  - `.`: Coincide con cualquier carácter.
  - `^`: Indica el inicio de una línea.
  - `$`: Indica el final de una línea.
  - `*`: Coincide con cero o más repeticiones del carácter o grupo anterior.
  - `+`: Coincide con una o más repeticiones del carácter o grupo anterior.
  - `?`: Coincide con cero o una repetición del carácter o grupo anterior.
  - `{n}`: Coincide con exactamente n repeticiones del carácter o grupo anterior.
  - `[ ]`: Define un conjunto de caracteres, y coincide con cualquiera de ellos.
  - `( )`: Define un grupo de caracteres o una subexpresión.

## Usos Comunes

1. **Validación de Entrada**: Verificar si una cadena sigue un formato específico, como correos electrónicos, números de teléfono, etc.
2. **Búsqueda y Reemplazo**: Encontrar y reemplazar texto en documentos o archivos.
3. **Extracción de Datos**: Extraer información específica de textos grandes, como fechas, URLs, números, etc.
4. **Análisis de Datos**: Procesamiento y análisis de texto en grandes volúmenes de datos.

## Ejemplos Prácticos

### Ejemplo 1: Validación de Email

Expresión regular: `^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$`

Esta expresión verifica si una cadena de texto tiene el formato de un correo electrónico.

### Ejemplo 2: Búsqueda de Números de Teléfono

Expresión regular: `\(\d{3}\) \d{3}-\d{4}`

Esta expresión busca números de teléfono en el formato "(123) 456-7890".

## Conclusión

Las expresiones regulares son una herramienta versátil y poderosa en la programación. Con ellas, puedes realizar tareas complejas de procesamiento de texto con una sintaxis compacta y eficiente. Dominar las expresiones regulares te permitirá manejar datos de texto de manera efectiva y eficiente.
