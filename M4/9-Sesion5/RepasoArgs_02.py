
class Animal:
    def __init__(self, *args):
        self.name = args[0]
        self.age = args[1]
        print(f'Animal: Nombre: {self.name}, Edad: {self.age}')

class Dog(Animal):
    def __init__(self, *args):
        super().__init__(*args)  # Pasa los primeros argumentos a la clase base
        # Simplemente accede a los valores adicionales cuando los necesites
        print(f'Valores adicionales en Dog: {args[2:]}')

# Crear instancia de Dog
perro = Dog("Firulais", 5, 25, "amigo", "oso", "Leon")
