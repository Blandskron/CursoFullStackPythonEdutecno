# Clase padre
class Animal:
    def __init__(self, nombre):
        self.nombre = nombre
    
    def hacer_sonido(self):
        pass  # Método vacío que será sobrescrito por las subclases

# Clase hija que hereda de Animal
class Perro(Animal):
    def hacer_sonido(self):
        return f"{self.nombre} dice: Guau"

# Otra clase hija que hereda de Animal
class Gato(Animal):
    def hacer_sonido(self):
        return f"{self.nombre} dice: Miau"

# Creación de objetos de las clases hijas
perro = Perro("Firulais")
gato = Gato("Misi")

# Uso de los métodos heredados y sobrescritos
print(perro.hacer_sonido())  # Firulais dice: Guau
print(gato.hacer_sonido())   # Misi dice: Miau
