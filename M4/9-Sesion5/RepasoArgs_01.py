class Animal:
    def __init__(self, *args):
        self.name = args[0]
        self.age = args[1]
        print(f'Animal: Nombre: {self.name}, Edad: {self.age}')

class Dog(Animal):
    def __init__(self, *args):
        super().__init__(*args)  # Pasa los argumentos a la clase base
        print(f'Perro: {self.name}, {self.age}')

# Crear instancia de Dog
perro = Dog("Firulais", 5, 5, "amigo")
