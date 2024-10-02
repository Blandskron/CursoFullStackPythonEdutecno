# Definición de la clase Persona con métodos
class Persona:
    nombre = ''     # Atributo nombre
    escuela = ''    # Atributo escuela

    # Método que imprime el nombre de la persona
    def imprimir_nombre(self):  # El argumento 'self' se refiere a la instancia de la clase
        print(self.nombre)

    # Método que imprime la escuela de la persona
    def imprimir_escuela(self):
        print(self.escuela)

# Crear un objeto de la clase Persona
jorge = Persona()

# Asignación de valores a los atributos del objeto
jorge.nombre = 'Jorge'
jorge.escuela = 'Universidad de la vida'

# Llamar a los métodos para imprimir los atributos
jorge.imprimir_nombre()   # Salida: Jorge
jorge.imprimir_escuela()  # Salida: Universidad de la vida
