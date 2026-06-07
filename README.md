# 🎓 Curso de Desarrollo Full Stack Python (Autoinstrucción)

¡Bienvenido a la guía de estudio autodidacta para el **Curso de Desarrollo Full Stack Python**! Este repositorio está estructurado para que cualquier persona interesada de forma independiente pueda aprender y dominar el ciclo completo de desarrollo de aplicaciones web, desde maquetación básica hasta arquitectura backend y bases de datos relacionales.

Aquí encontrarás material estructurado por módulos, ejercicios guiados, desafíos y plantillas de código organizadas cronológicamente para acompañarte en tu ruta de aprendizaje de manera autónoma.

---

## 🛠️ Tecnologías Cubiertas en el Curso

Para facilitar el aprendizaje autónomo, el curso cubre y utiliza un conjunto completo de tecnologías modernas de desarrollo web:

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

El repositorio está organizado en 5 grandes bloques modulares de aprendizaje:

```bash
CursoFullStackPythonEdutecno/
├── M1/                 # Módulo 1: Fundamentos de Ingeniería y Roles de TI
├── M2/                 # Módulo 2: Frontend (HTML, CSS, JS, Bootstrap, jQuery) y Git
├── M3/                 # Módulo 3: Fundamentos de Backend en Python (Flask, FastAPI, etc.)
├── M4/                 # Módulo 4: Programación Orientada a Objetos (POO) y Archivos
├── M5/                 # Módulo 5: Modelado de Bases de Datos Relacionales y SQL
├── documentacion/      # 📚 Guías de estudio y explicaciones conceptuales detalladas
└── README.md           # Guía general de inicio
```

---

## 📚 Enlaces de Estudio y Guías de Aprendizaje

Para guiar tu estudio independiente, puedes acceder a las guías conceptuales y de ejercicios diseñadas para cada módulo:

> [!NOTE]
> Consulta la [Página Principal de la Documentación](file:///c:/Users/BlandskronNotebook/Documents/updatesGitHubs/CursoFullStackPythonEdutecno/documentacion/README.md) para tener un mapa completo de los temas.

*   **Módulo 1 (Ingeniería de Software)**: [Roles, Elevator Pitch y Ética en TI](file:///c:/Users/BlandskronNotebook/Documents/updatesGitHubs/CursoFullStackPythonEdutecno/documentacion/M1_habilidades_blandas.md)
*   **Módulo 2 (Frontend)**: [HTML5, CSS3, JS Interactividad y Git](file:///c:/Users/BlandskronNotebook/Documents/updatesGitHubs/CursoFullStackPythonEdutecno/documentacion/M2_frontend_git.md)
*   **Módulo 3 (Backend Base)**: [Programación en Python y microframeworks](file:///c:/Users/BlandskronNotebook/Documents/updatesGitHubs/CursoFullStackPythonEdutecno/documentacion/M3_python_basico.md)
*   **Módulo 4 (POO en Python)**: [Clases, Herencia, Excepciones e I/O de Archivos](file:///c:/Users/BlandskronNotebook/Documents/updatesGitHubs/CursoFullStackPythonEdutecno/documentacion/M4_python_poo.md)
*   **Módulo 5 (SQL y DB)**: [Modelado, SQL Avanzado y Conexiones Relacionales](file:///c:/Users/BlandskronNotebook/Documents/updatesGitHubs/CursoFullStackPythonEdutecno/documentacion/M5_bases_datos.md)

---

## 🚀 Cómo Configurar tu Entorno Local de Estudio

Para ejecutar las prácticas de los módulos Backend y bases de datos, sigue estas instrucciones:

### 1. Clonar el repositorio
```bash
git clone https://github.com/tu-usuario/CursoFullStackPythonEdutecno.git
cd CursoFullStackPythonEdutecno
```

### 2. Crear y activar tu entorno virtual de Python
Es altamente recomendable aislar tus paquetes para no interferir con tu instalación global del sistema operativo:

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

### 3. Instalar librerías requeridas
Puedes instalar las principales librerías utilizadas en los módulos backend (como Flask, FastAPI, SQLAlchemy y conectores de PostgreSQL) usando:
```bash
pip install fastapi uvicorn sqlalchemy psycopg2-binary Flask CherryPy bottle pyramid
```

### 4. Ejecución del código
Navega a la carpeta del ejercicio correspondiente dentro de los módulos y corre los scripts. Por ejemplo, para probar los archivos de POO del Módulo 4:
```bash
cd M4/2-Sesion2
python 13_animal.py
```

---

## ✍️ Créditos
Este repositorio es de carácter educativo y está diseñado para servir como un recurso abierto de autoaprendizaje en desarrollo web Full Stack con Python.