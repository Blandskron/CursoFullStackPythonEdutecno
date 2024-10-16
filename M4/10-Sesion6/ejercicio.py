# AttributeError: Intentar acceder a un atributo que no existe
try:
    # Definimos una clase básica llamada Persona
    class Persona:
        def __init__(self, nombre, edad):
            self.nombre = nombre  # Atributo nombre
            self.edad = edad  # Atributo edad

        # Método para presentar a la persona
        def presentarse(self):
            return f"Hola, soy {self.nombre} y tengo {self.edad} años."

    nombre = input("Ingrese su nombre: ")
    edad = int(input("Ingrese su edad: "))

    # Creamos una instancia de la clase Persona
    persona1 = Persona(nombre, edad)

    dato = input("Que dato quiere conocer: ")
    if dato == "nombre":
        print(persona1.nombre)
    elif dato == "edad":
        print(persona1.edad)
    else:
        print(persona1.dato)
except AttributeError:
    print("Error: El objeto no tiene ese atributo.")