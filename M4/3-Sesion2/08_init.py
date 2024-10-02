# Definición de la clase Persona con un constructor
class Persona:
    # El método __init__ es el constructor de la clase
    def __init__(self, nombre, escuela):
        self.nombre = nombre      # Inicialización del atributo nombre
        self.escuela = escuela    # Inicialización del atributo escuela

    # Método que imprime el nombre de la persona
    def imprimir_nombre(self):
        print(self.nombre)

    # Método que imprime la escuela de la persona
    def imprimir_escuela(self):
        print(self.escuela)

# Crear una instancia de la clase Persona con valores iniciales
jorge = Persona('Jorge', 'Universidad de la vida')

# Llamar a los métodos para imprimir los atributos
jorge.imprimir_nombre()   # Salida: Jorge
jorge.imprimir_escuela()  # Salida: Universidad de la vida
