# Un diagrama de clases es una representación gráfica de la estructura de un sistema
# donde se muestran las clases, sus atributos, métodos y las relaciones entre ellas.
# Este tipo de diagrama se utiliza en el diseño orientado a objetos.

class Persona:
    """Clase que representa a una persona."""
    
    def __init__(self, nombre, edad):
        self.nombre = nombre  # Atributo: nombre de la persona
        self.edad = edad      # Atributo: edad de la persona
    
    def presentarse(self):
        """Método que permite a la persona presentarse."""
        return f"Hola, soy {self.nombre} y tengo {self.edad} años."

# Los diagramas de clases sirven para visualizar la arquitectura de un sistema,
# facilitando la comprensión de su estructura y relaciones.
# Esto ayuda a los desarrolladores a planificar y comunicar el diseño del software.

class Estudiante(Persona):
    """Clase que representa a un estudiante, heredando de Persona."""
    
    def __init__(self, nombre, edad, carrera):
        super().__init__(nombre, edad)  # Llama al constructor de la clase base
        self.carrera = carrera            # Atributo: carrera del estudiante
    
    def estudiar(self):
        """Método que representa el acto de estudiar."""
        return f"{self.nombre} está estudiando {self.carrera}."

# En la notación UML (Unified Modeling Language), un diagrama de clases
# se representa con rectángulos que contienen el nombre de la clase,
# atributos y métodos. Las relaciones se muestran mediante líneas y símbolos.

class Curso:
    """Clase que representa un curso en la escuela."""
    
    def __init__(self, nombre, creditos):
        self.nombre = nombre     # Atributo: nombre del curso
        self.creditos = creditos # Atributo: créditos del curso
    
    def info_curso(self):
        """Método que devuelve información sobre el curso."""
        return f"{self.nombre} tiene {self.creditos} créditos."

class Auto:
    """Clase que representa un automóvil."""
    
    def __init__(self, marca, modelo):
        self.marca = marca     # Atributo: marca del automóvil
        self.modelo = modelo   # Atributo: modelo del automóvil
    
    def arrancar(self):
        """Método que simula el arranque del automóvil."""
        return f"El {self.marca} {self.modelo} está arrancando."

# Las relaciones entre clases pueden ser de varios tipos:
# 1. Asociación: una clase utiliza otra (e.g., Estudiante y Curso)
# 2. Herencia: una clase extiende otra (e.g., Estudiante hereda de Persona)
# 3. Composición: una clase contiene a otra (e.g., Auto tiene un Motor)

class Motor:
    """Clase que representa un motor de automóvil."""
    
    def __init__(self, tipo):
        self.tipo = tipo  # Atributo: tipo de motor

class Auto:
    """Clase que representa un automóvil, compuesta por un Motor."""
    
    def __init__(self, marca, modelo, motor_tipo):
        self.marca = marca
        self.modelo = modelo
        self.motor = Motor(motor_tipo)  # Composición: Auto tiene un Motor

# Para leer un diagrama de clases, se debe identificar:
# - Clases: Representadas como rectángulos.
# - Atributos: Dentro de la clase, normalmente listados.
# - Métodos: También dentro de la clase, especificando su funcionalidad.
# - Relaciones: Líneas que conectan las clases, indicando herencia o asociación.

class Biblioteca:
    """Clase que representa una biblioteca."""
    
    def __init__(self, nombre):
        self.nombre = nombre  # Atributo: nombre de la biblioteca

class Libro:
    """Clase que representa un libro en la biblioteca."""
    
    def __init__(self, titulo):
        self.titulo = titulo  # Atributo: título del libro

# Al escribir un diagrama de clases, se debe seguir una estructura clara:
# - Iniciar con las clases y sus atributos.
# - Añadir métodos relevantes a cada clase.
# - Definir relaciones entre clases según la lógica del sistema.

class Usuario:
    """Clase que representa a un usuario en un sistema."""
    
    def __init__(self, username, password):
        self.username = username  # Atributo: nombre de usuario
        self.password = password  # Atributo: contraseña del usuario

    def login(self):
        """Método para simular el inicio de sesión."""
        return f"{self.username} ha iniciado sesión."

# Ejemplo completo que muestra una estructura simple de un sistema escolar.
class Escuela:
    """Clase que representa una escuela."""
    
    def __init__(self, nombre):
        self.nombre = nombre  # Atributo: nombre de la escuela
        self.estudiantes = []  # Lista para almacenar estudiantes
    
    def agregar_estudiante(self, estudiante):
        """Método para agregar un estudiante a la escuela."""
        self.estudiantes.append(estudiante)

# Creación de instancias para demostrar el funcionamiento
escuela = Escuela("Escuela Primaria")
estudiante1 = Estudiante("Juan", 10, "Matemáticas")
escuela.agregar_estudiante(estudiante1)

print(escuela.nombre)  # Salida: Escuela Primaria
print(estudiante1.presentarse())  # Salida: Hola, soy Juan y tengo 10 años.
