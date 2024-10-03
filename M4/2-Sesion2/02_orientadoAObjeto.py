# La Programación Orientada a Objetos (POO) se basa en clases y objetos.
# Aquí creamos una clase Persona que contiene atributos (nombre y edad) y métodos (saludar).

class Persona:
    # Constructor para inicializar los atributos de la clase
    def __init__(self, nombre, edad):
        self.nombre = nombre  # Atributo nombre
        self.edad = edad      # Atributo edad
    
    # Método que devuelve un saludo
    def saludar(self):
        return f"Hola, me llamo {self.nombre} y tengo {self.edad} años."

# Creación de un objeto Persona
persona = Persona("Juan", 30)
print(persona.saludar())  # Llamada al método del objeto
