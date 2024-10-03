# Los atributos son las características que tiene una clase.
# Aquí la clase Persona tiene atributos como nombre y edad.

class Persona:
    # Constructor que inicializa los atributos de la persona
    def __init__(self, nombre, edad):
        self.nombre = nombre  # Atributo nombre
        self.edad = edad      # Atributo edad

# El estado de un objeto está determinado por los valores actuales de sus atributos.
# Aquí, el estado de la persona está definido por el nombre y la edad.

persona1 = Persona("Ana", 25)
print(f"Estado de la persona: Nombre = {persona1.nombre}, Edad = {persona1.edad}")

# El atributo es la propiedad de la clase (nombre, edad).
# El estado es el valor actual de esos atributos en una instancia específica.

persona1.nombre = "Ana"  # El atributo es nombre
# El estado es Nombre = Ana en este momento
