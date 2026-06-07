# 🎓 Curso Desarrollo Full Stack Python - Edutecno (2024)

¡Bienvenido al repositorio oficial del **Curso de Desarrollo Full Stack Python** dictado por **Edutecno**! Este repositorio contiene todo el material práctico, ejercicios guiados, desafíos semanales y plantillas de código utilizados a lo largo del bootcamp para formar desarrolladores de software Full Stack.

---

## 🛠️ Tecnologías Utilizadas

Para facilitar el aprendizaje y la especialización, el curso emplea un stack tecnológico de vanguardia:

![Python](https://img.shields.io/badge/python-3670A0?style=for-the-badge&logo=python&logoColor=ffdd54)
![FastAPI](https://img.shields.io/badge/FastAPI-005571?style=for-the-badge&logo=fastapi)
![PostgreSQL](https://img.shields.io/badge/postgresql-%23316192.svg?style=for-the-badge&logo=postgresql&logoColor=white)
![SQLite](https://img.shields.io/badge/sqlite-%2307405e.svg?style=for-the-badge&logo=sqlite&logoColor=white)
![JavaScript](https://img.shields.io/badge/javascript-%23323330.svg?style=for-the-badge&logo=javascript&logoColor=%23F7DF1E)
![jQuery](https://img.shields.io/badge/jquery-%230769AD.svg?style=for-the-badge&logo=jquery&logoColor=white)
![Bootstrap](https://img.shields.io/badge/bootstrap-%238511FA.svg?style=for-the-badge&logo=bootstrap&logoColor=white)
![HTML5](https://img.shields.io/badge/html5-%23E34F26.svg?style=for-the-badge&logo=html5&logoColor=white)
![CSS3](https://img.shields.io/badge/css3-%231572B6.svg?style=for-the-badge&logo=css3&logoColor=white)
![Git](https://img.shields.io/badge/git-%23F05033.svg?style=for-the-badge&logo=git&logoColor=white)

---

## 📂 Estructura del Repositorio

El repositorio está organizado de forma modular. Cada carpeta (`M1` a `M5`) representa un módulo temático del bootcamp:

```bash
CursoFullStackPythonEdutecno/
├── M1/                 # Habilidades Blandas, Ética y Roles en TI
├── M2/                 # Fundamentos Frontend (HTML, CSS, JS, Bootstrap, jQuery) y Git
├── M3/                 # Fundamentos de Python Backend (Bottle, Flask, FastAPI)
├── M4/                 # Programación Orientada a Objetos (POO) y Manejo de Archivos
├── M5/                 # Bases de Datos Relacionales y SQL (PostgreSQL, Triggers)
├── documentacion/      # 📚 NUEVA DOCUMENTACIÓN DETALLADA DEL CURSO
├── seleccion.py        # Script para sorteos y asignación de roles en dinámicas
├── requirements.txt    # Lista de dependencias del proyecto
└── README.md           # Guía principal de inicio
```

---

## 📚 Documentación de Módulos (Índice Rápido)

Hemos creado una **documentación detallada paso a paso** para cada sección del bootcamp. Puedes acceder a las guías de estudio haciendo clic en los enlaces a continuación:

> [!NOTE]
> Para ver el índice completo, accede a la [Página Principal de la Documentación](file:///c:/Users/BlandskronNotebook/Documents/updatesGitHubs/CursoFullStackPythonEdutecno/documentacion/README.md).

*   **Módulo 1**: [Habilidades Blandas, Ética y Roles en TI](file:///c:/Users/BlandskronNotebook/Documents/updatesGitHubs/CursoFullStackPythonEdutecno/documentacion/M1_habilidades_blandas.md)
*   **Módulo 2**: [Frontend (HTML, CSS, JS, Bootstrap, jQuery) y Git](file:///c:/Users/BlandskronNotebook/Documents/updatesGitHubs/CursoFullStackPythonEdutecno/documentacion/M2_frontend_git.md)
*   **Módulo 3**: [Fundamentos de Programación en Python](file:///c:/Users/BlandskronNotebook/Documents/updatesGitHubs/CursoFullStackPythonEdutecno/documentacion/M3_python_basico.md)
*   **Módulo 4**: [POO en Python y Manejo de Archivos](file:///c:/Users/BlandskronNotebook/Documents/updatesGitHubs/CursoFullStackPythonEdutecno/documentacion/M4_python_poo.md)
*   **Módulo 5**: [Bases de Datos Relacionales y SQL](file:///c:/Users/BlandskronNotebook/Documents/updatesGitHubs/CursoFullStackPythonEdutecno/documentacion/M5_bases_datos.md)

---

## 🚀 Instalación y Configuración del Entorno Local

Para ejecutar los scripts de Python, levantar los servidores web de desarrollo (como FastAPI o Flask) y probar las actividades locales, sigue estos pasos:

### 1. Clonar el repositorio
```bash
git clone https://github.com/tu-usuario/CursoFullStackPythonEdutecno.git
cd CursoFullStackPythonEdutecno
```

### 2. Crear y activar un entorno virtual (Virtual Environment)
Se recomienda aislar las dependencias del proyecto para evitar conflictos globales en tu sistema operativo:

*   **En Windows (PowerShell):**
    ```powershell
    python -m venv venv
    .\venv\Scripts\Activate.ps1
    ```
*   **En macOS/Linux:**
    ```bash
    python3 -m venv venv
    source venv/bin/activate
    ```

### 3. Instalar las dependencias del curso
Con el entorno virtual activado, instala todas las librerías necesarias especificadas en el archivo `requirements.txt`:
```bash
pip install -r requirements.txt
```

### 4. Probar la configuración
Puedes probar el entorno ejecutando el script `seleccion.py` ubicado en la raíz, el cual realiza una selección aleatoria de personas para dinámicas grupales:
```bash
python seleccion.py
```

---

## ✍️ Créditos y Licencia
Este repositorio es de carácter educativo y ha sido creado con fines formativos para el programa de desarrollo Full Stack de **Edutecno** (Año 2024).