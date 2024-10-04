class Perro:
    def __init__(self, raza, hablar):
        self.__raza = raza  # Atributo privado
        self.__hablar = hablar  # Atributo que define el sonido al ladrar

    # Método set para establecer la raza
    def set_raza(self, raza):
        self.__raza = raza
        print(f"Se ha cambiado la raza a: {self.__raza}")

    # Método get para obtener la raza
    def get_raza(self):
        return f"La raza del perro es: {self.__raza}"

    # Método para ladrar
    def ladrar(self):
        return f"El perro de raza {self.__raza} dice: {self.__hablar}"

# Crear tres instancias de perros con diferentes razas
perro1 = Perro("Labrador", "Guau")
perro2 = Perro("Bulldog", "Miau")
perro3 = Perro("Golden Retriever", "Guau")

# Mostrar la raza de cada perro usando el método get
print(perro1.get_raza())
print(perro2.get_raza())
print(perro3.get_raza())

# Hacer que cada perro ladre
print(perro1.ladrar())
print(perro2.ladrar())
print(perro3.ladrar())

# Cambiar la raza de perro1 y mostrar el cambio
perro1.set_raza("miau")
print(perro1.get_raza())
print(perro1.ladrar())
