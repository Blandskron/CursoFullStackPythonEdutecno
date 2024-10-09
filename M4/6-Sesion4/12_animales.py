# Clase base Animal
class Animal:
    def __init__(self, nombre):
        self.nombre = nombre
    
    def sonido(self):
        return "Sonido de animal"

# Subclase Perro que hereda de Animal
class Perro(Animal):
    def sonido(self):
        return "Guau!"

# Subclase Gato que hereda de Animal
class Gato(Animal):
    def sonido(self):
        return "Miau!"

# Ejemplo de uso
perro = Perro("Rex")
gato = Gato("Misi")

print(f"{perro.nombre} dice: {perro.sonido()}")
print(f"{gato.nombre} dice: {gato.sonido()}")
