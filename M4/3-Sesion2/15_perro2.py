class Perro:
    def __init__(self, raza, hablar="Guau", nombre="Sin Nombre", edad=0):
        self.__raza = raza  # Atributo privado e inmutable
        self.__hablar = hablar  # Atributo privado e inmutable
        self.nombre = nombre  # Atributo modificable
        self.edad = edad  # Atributo modificable

    # Método get para obtener la raza
    def get_raza(self):
        return f"La raza del perro es: {self.__raza}"

    # Método get para obtener el sonido del ladrido
    def get_hablar(self):
        return f"El perro de raza {self.__raza} dice: {self.__hablar}"

    # Método para obtener el nombre
    def get_nombre(self):
        return f"El nombre del perro es: {self.nombre}"

    # Método para establecer un nuevo nombre
    def set_nombre(self, nuevo_nombre):
        self.nombre = nuevo_nombre
        print(f"Se ha cambiado el nombre a: {self.nombre}")

    # Método para obtener la edad
    def get_edad(self):
        return f"La edad del perro es: {self.edad} años"

    # Método para establecer una nueva edad
    def set_edad(self, nueva_edad):
        self.edad = nueva_edad
        print(f"Se ha cambiado la edad a: {self.edad} años")

# Crear tres instancias de perros con diferentes razas, nombres y edades
perro1 = Perro("Labrador", nombre="Max", edad=3)
perro2 = Perro("Bulldog", "Woof", "Bella", 5)
perro3 = Perro("Golden Retriever", nombre="Charlie", edad=2)

# Mostrar la información de cada perro
print(perro1.get_raza())
print(perro1.get_nombre())
print(perro1.get_edad())
print(perro1.get_hablar())

print(perro2.get_raza())
print(perro2.get_nombre())
print(perro2.get_edad())
print(perro2.get_hablar())

print(perro3.get_raza())
print(perro3.get_nombre())
print(perro3.get_edad())
print(perro3.get_hablar())

# Modificar el nombre y la edad de perro1
perro1.set_nombre("Rocky")
perro1.set_edad(4)

# Mostrar los cambios
print(perro1.get_nombre())
print(perro1.get_edad())
