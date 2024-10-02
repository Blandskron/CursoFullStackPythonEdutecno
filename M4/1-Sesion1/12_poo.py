# La Programación Orientada a Objetos (POO) permite estructurar el código en torno a "objetos" que agrupan datos y comportamiento.
# En lugar de centrarse solo en funciones y lógica, se centra en las relaciones entre objetos.

# Definimos una clase básica para ilustrar los principios de la POO.
class Persona:
    # Constructor que inicializa los atributos de la clase Persona
    def __init__(self, nombre, edad):
        self.nombre = nombre  # Atributo de la clase Persona
        self.__edad = edad    # Atributo privado (encapsulado), no accesible directamente
    
    # Método público para acceder al atributo privado (encapsulamiento)
    def obtener_edad(self):
        return self.__edad
    
    # Método público para cambiar el valor de un atributo privado
    def establecer_edad(self, nueva_edad):
        if nueva_edad > 0:  # Validación para evitar edades negativas
            self.__edad = nueva_edad
        else:
            print("La edad no puede ser negativa.")
    
    # Método que describe el comportamiento de una persona
    def saludar(self):
        print(f"Hola, mi nombre es {self.nombre} y tengo {self.__edad} años.")

# Aquí implementamos una subclase de Persona para demostrar la herencia.
# Estudiante es una especialización de Persona.
class Estudiante(Persona):
    def __init__(self, nombre, edad, curso):
        super().__init__(nombre, edad)  # Llamada al constructor de la clase padre (Persona)
        self.curso = curso  # Atributo adicional específico de Estudiante
    
    # Método que muestra el curso que toma el estudiante
    def mostrar_curso(self):
        print(f"{self.nombre} está inscrito en el curso: {self.curso}.")

# Subclase Profesor que también hereda de Persona, demostrando la reutilización de código y polimorfismo
class Profesor(Persona):
    def __init__(self, nombre, edad, salario):
        super().__init__(nombre, edad)  # Herencia de los atributos de la clase padre (Persona)
        self.salario = salario  # Atributo específico de Profesor
    
    # Método específico de Profesor que muestra el salario
    def mostrar_salario(self):
        print(f"El salario de {self.nombre} es de {self.salario}.")

# Creamos objetos (instancias) de las clases para demostrar su uso
estudiante1 = Estudiante("Ana", 20, "Matemáticas")
profesor1 = Profesor("Carlos", 45, 50000)

# Demostración de encapsulamiento: solo se puede acceder a los atributos privados a través de métodos
print(f"La edad de {estudiante1.nombre} es {estudiante1.obtener_edad()} años.")  # Acceso controlado a la edad

# Cambiamos el valor del atributo encapsulado usando un método específico
estudiante1.establecer_edad(21)  # Cambiamos la edad usando un método público
estudiante1.saludar()  # El método saludar muestra el nombre y la edad actualizada

# Demostración de herencia y polimorfismo
estudiante1.mostrar_curso()  # Método específico del estudiante
profesor1.mostrar_salario()  # Método específico del profesor

# Ambos objetos pueden usar el método heredado 'saludar' de la clase Persona
profesor1.saludar()  # Este método fue heredado de Persona
