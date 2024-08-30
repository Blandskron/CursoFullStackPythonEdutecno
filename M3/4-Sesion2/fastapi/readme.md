# FastAPI Personas - Proyecto de Ejemplo

Este proyecto es un ejemplo simple de cómo usar **FastAPI** junto con **SQLAlchemy** para crear una API que gestione una base de datos de personas. Este proyecto tiene como objetivo mostrar a los alumnos la potencia y simplicidad de Python en el desarrollo de APIs modernas.

## Contenidos

1. [Requisitos](#requisitos)
2. [Instalación](#instalación)
3. [Estructura del Proyecto](#estructura-del-proyecto)
4. [Cómo Ejecutar la Aplicación](#cómo-ejecutar-la-aplicación)
5. [Uso de la API](#uso-de-la-api)
6. [Visualización de la Documentación Interactiva](#visualización-de-la-documentación-interactiva)
7. [Imágenes](#imágenes)
8. [Recursos Adicionales](#recursos-adicionales)

## Requisitos

- Python 3.7 o superior
- pip (gestor de paquetes de Python)
- Git (opcional, para clonar el repositorio)

## Instalación

1. **Clona el repositorio** (o descarga el código fuente directamente):

    ```bash
    git clone https://github.com/tu-usuario/fastapi-personas.git
    cd fastapi-personas
    ```

2. **Crea y activa un entorno virtual** (opcional pero recomendado):

    ```bash
    python -m venv env
    source env/bin/activate  # En Windows usa `env\Scripts\activate`
    ```

3. **Instala las dependencias necesarias**:

    ```bash
    pip install -r requirements.txt
    ```

4. **Configura la base de datos**: El proyecto utiliza SQLite por defecto. La base de datos se configurará automáticamente al iniciar la aplicación.

## Estructura del Proyecto

```plaintext
my_fastapi_project/
│
├── main.py
├── models.py
├── schemas.py
├── crud.py
├── database.py
├── routers/
│   └── people.py
└── __init__.py
```

- **main.py**: Punto de entrada de la aplicación FastAPI.
- **models.py**: Definición de los modelos de base de datos.
- **schemas.py**: Modelos Pydantic para la validación y serialización de datos.
- **crud.py**: Funciones para realizar operaciones CRUD.
- **database.py**: Configuración de la base de datos y creación de la sesión.
- **routers/people.py**: Contiene los endpoints relacionados con "Personas".

## Cómo Ejecutar la Aplicación

Para ejecutar la aplicación, usa el siguiente comando:

```bash
uvicorn main:app --reload
```

Esto iniciará el servidor de desarrollo en `http://127.0.0.1:8000`.

## Uso de la API

### Crear una Persona

Puedes enviar una solicitud `POST` a `/people/` con un cuerpo JSON como el siguiente:

```json
{
    "name": "John Doe",
    "age": 30,
    "email": "johndoe@example.com"
}
```

### Obtener la Lista de Personas

Envía una solicitud `GET` a `/people/` para obtener la lista de personas.

### Obtener una Persona por ID

Envía una solicitud `GET` a `/people/{id}` para obtener una persona específica por su ID.

## Visualización de la Documentación Interactiva

FastAPI genera automáticamente una documentación interactiva para tu API. Puedes acceder a ella en:

- **Swagger UI**: [http://127.0.0.1:8000/docs](http://127.0.0.1:8000/docs)
- **Redoc**: [http://127.0.0.1:8000/redoc](http://127.0.0.1:8000/redoc)

## Recursos Adicionales

- [Documentación oficial de FastAPI](https://fastapi.tiangolo.com/)
- [Documentación de SQLAlchemy](https://docs.sqlalchemy.org/)
