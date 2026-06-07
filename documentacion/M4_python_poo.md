# Módulo 4: Programación Orientada a Objetos (POO) y Manejo de Archivos

Este módulo profundiza en el paradigma de programación orientada a objetos en Python, capacitando al estudiante para modelar sistemas de software complejos, estructurar código de forma modular, manejar errores y excepciones en tiempo de ejecución, y manipular archivos del sistema de forma segura.

---

## 📌 Temario y Contenido Clave

### 1. Pilares de la Programación Orientada a Objetos (Sesiones 1 - 3)
Modelado del mundo real a través del código:
- **Clases y Objetos**: La clase es el "molde" o plantilla (atributos y métodos) y el objeto o instancia es la entidad concreta.
- **Constructor (`__init__`)**: Método inicializador de atributos al instanciar un objeto.
- **Encapsulación**: Ocultamiento de la representación interna de un objeto. Uso de convenciones (guión bajo `_variable` o doble guión bajo `__variable`) y decoradores `@property` para definir **Getters y Setters**.
- **Composición y Colaboración**: Relaciones donde una clase contiene o utiliza instancias de otra clase para cumplir tareas complejas (ej. la relación entre un `Curso` y sus `Alumnos`).

### 2. Herencia y Polimorfismo Avanzado (Sesiones 4 - 5)
- **Herencia Simple y Múltiple**: Capacidad de una clase hija para heredar atributos y métodos de una o varias clases padres.
- **MRO (Method Resolution Order)**: Algoritmo C3 que utiliza Python para determinar el orden en que se buscan los métodos en casos de herencia múltiple.
- **Polimorfismo**: Capacidad de diferentes clases para implementar métodos con el mismo nombre pero comportamientos distintos.
- **Sobrecarga de Métodos**: Implementación flexible de métodos usando argumentos comodín:
  - `*args`: Captura parámetros posicionales adicionales como una tupla.
  - `**kwargs`: Captura parámetros nombrados adicionales como un diccionario.
- **Verificación**: Uso de `isinstance(objeto, Clase)` para corroborar la jerarquía de un elemento en tiempo de ejecución.

### 3. Manejo de Excepciones Robustas (Sesiones 6 - 7)
Mecanismos para capturar y controlar errores de ejecución sin interrumpir la experiencia del usuario:
- **Bloque `try-except`**: Sección de código propensa a errores protegida para capturar excepciones específicas (ej. `ZeroDivisionError`, `ValueError`).
- **Bloque `finally`**: Código que siempre se ejecutará al final del bloque `try-except`, ideal para liberar recursos o cerrar conexiones.
- **Excepciones Personalizadas**: Creación de clases que heredan de la clase base `Exception` para capturar errores de lógica de negocio específicos del dominio de la aplicación.

### 4. Manipulación del Sistema de Archivos (I/O) (Sesiones 8 - 9)
Lectura y escritura de datos persistentes en el disco duro:
- **Modos de Apertura**:
  - `'r'`: Modo lectura (por defecto).
  - `'w'`: Modo escritura (sobreescribe o crea el archivo).
  - `'a'`: Modo anexar (agrega contenido al final sin borrar).
  - `'r+'`: Modo lectura y escritura.
- **Gestión de Recursos (`with open`)**: Uso de manejadores de contexto (Context Managers) para garantizar que el archivo se cierre automáticamente tras el bloque de ejecución, incluso si ocurre un error.
- **Codificaciones**: Declaración de tipos de encoding (`utf-8`, `iso-8859-1`) para evitar la rotura de caracteres especiales y tildes.

---

## 💻 Ejemplos Prácticos de Código

### Ejemplo 1: Encapsulamiento y Métodos en Python
```python
class CuentaBancaria:
    def __init__(self, titular, saldo_inicial):
        self.titular = titular
        self.__saldo = saldo_inicial  # Atributo privado

    @property
    def saldo(self):
        """Getter para acceder de forma segura al saldo"""
        return self.__saldo

    def depositar(self, monto):
        if monto > 0:
            self.__saldo += monto
            print(f"Depósito exitoso. Nuevo saldo: {self.__saldo}")
        else:
            raise ValueError("El monto a depositar debe ser positivo.")
```

### Ejemplo 2: Lectura Segura de Archivos con Excepciones
```python
def leer_archivo_seguro(ruta):
    try:
        with open(ruta, 'r', encoding='utf-8') as archivo:
            contenido = archivo.read()
            return contenido
    except FileNotFoundError:
        print(f"Error: El archivo en '{ruta}' no fue encontrado.")
    except Exception as e:
        print(f"Ocurrió un error inesperado: {e}")
    return None
```
