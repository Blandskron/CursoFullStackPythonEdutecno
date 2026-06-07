# Módulo 2: Desarrollo Frontend y Control de Versiones (Git/GitHub)

Este módulo abarca el desarrollo de interfaces de usuario modernas, interactivas y adaptables (Responsive Design), junto con las herramientas indispensables para el control de versiones y el trabajo colaborativo en equipo.

---

## 📌 Temario y Contenido Clave

### 1. Maquetación con HTML5 Semántico (Sesiones 1 - 4)
- **Estructura Base**: Declaración de `<!DOCTYPE html>`, metaetiquetas configurables para SEO y accesibilidad (`charset`, `viewport`).
- **Semántica**: Uso de etiquetas estructurales (`<header>`, `<nav>`, `<main>`, `<section>`, `<article>`, `<aside>`, `<footer>`) en lugar de contenedores genéricos `<div>`, mejorando el SEO y la accesibilidad.
- **Formularios y Tablas**: Creación de tablas de datos complejas e interfaces de entrada de datos seguras con campos de validación (`email`, `number`, `pattern`).

### 2. Estilización con CSS3 Avanzado (Sesiones 5 - 7)
- **Métodos de Integración**: Inline, interno y externo (buenas prácticas).
- **CSS Reset**: Eliminación de estilos por defecto del navegador para lograr consistencia visual.
- **Modelos de Layout**:
  - **Flexbox**: Alineación unidimensional excelente para barras de navegación, botones y tarjetas.
  - **Grid Layout**: Diseño bidimensional ideal para estructuras de páginas completas.
- **Diseño Adaptable (Responsive Design)**:
  - Uso de **Media Queries** para aplicar estilos en diferentes resoluciones.
  - Filosofía **Mobile-First Design**: Escribir estilos para dispositivos móviles primero y luego escalar a pantallas de escritorio.

### 3. Bootstrap Framework (Sesiones 8 - 9)
- Integración de frameworks mediante CDN o archivos locales.
- Uso del sistema de rejilla flexible (Grid System) de 12 columnas.
- Implementación de componentes preconstruidos (botones, carruseles, barras de navegación, modales, alertas) para acelerar el desarrollo.

### 4. Fundamentos de JavaScript (JS) (Sesiones 10 - 12)
- Sintaxis, declaración de variables (`let`, `const`, `var`).
- Operadores aritméticos, lógicos y de comparación.
- Estructuras de control de flujo (`if`, `switch`, bucles `for`, `while`).
- Funciones declarativas y de tipo flecha (Arrow Functions).

### 5. Manipulación del DOM y jQuery (Sesiones 14 - 15)
- **Acceso a Elementos**: Selección por ID, clase o selectores CSS (`querySelector`).
- **Eventos**: Escucha y manejo de interacciones del usuario (`click`, `submit`, `change`).
- **jQuery**: Simplificación de la manipulación del árbol DOM, animaciones y alternancia de clases (por ejemplo, modo claro/oscuro).

### 6. JavaScript Asíncrono y Consumo de APIs (Sesión 13)
- Manejo de **Promesas** y sintaxis `async/await` para evitar el "callback hell".
- Uso de la **Fetch API** y AJAX para enviar y recibir datos JSON de servidores remotos.
- Simulación de peticiones **CRUD** completas (`GET`, `POST`, `PUT`, `DELETE`).

---

## 🛠️ Guía Rápida de Git y GitHub (Sesiones 16 - 17)

En el curso se utiliza Git para controlar el historial del código y GitHub para alojar los repositorios en la nube. A continuación se presentan los comandos clave enseñados:

```bash
# Inicializar un repositorio local
git init

# Clonar un repositorio remoto
git clone <url-del-repositorio>

# Añadir archivos al área de preparación (Staging Area)
git add .
# O añadir un archivo específico
git add archivo.html

# Confirmar cambios en el historial local
git commit -m "Descripción clara del cambio"

# Conectar el repositorio local con GitHub (solo la primera vez)
git remote add origin <url-del-repositorio-en-github>

# Subir los cambios a la rama principal (master/main)
git push -u origin master

# Descargar y fusionar los últimos cambios del servidor remoto
git pull origin master

# Crear una nueva rama para desarrollar una característica aislada
git checkout -b nombre-rama

# Eliminar una rama local
git branch -d nombre-rama
```

### GitHub Pages (Despliegue)
Despliegue automático de archivos estáticos (HTML, CSS, JS) creando una rama llamada `gh-pages` y subiéndola al servidor remoto:
```bash
git checkout -b gh-pages
git push origin gh-pages
```
> [!NOTE]
> Una vez hecho el push, GitHub pondrá a disposición tu página web bajo la URL: `https://<tu-usuario>.github.io/<tu-repositorio>/`.
