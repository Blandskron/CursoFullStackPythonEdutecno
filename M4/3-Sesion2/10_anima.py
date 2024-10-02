# Definición de la clase Animal
class Animal:
    def __init__(self, nombre, raza, edad, peso):
        self.nombre = nombre  # Atributo para el nombre del animal
        self.raza = raza      # Atributo para la raza del animal
        self.edad = edad      # Atributo para la edad del animal
        self.peso = peso      # Atributo para el peso del animal

    # Método para imprimir la información del animal
    def mostrar_informacion(self):
        print(f"Nombre: {self.nombre}")
        print(f"Raza: {self.raza}")
        print(f"Edad: {self.edad} años")
        print(f"Peso: {self.peso} kg")
        print("---------------")  # Separador para claridad visual

# Creación de la instancia del caballo
caballo = Animal(nombre="Zeus", raza="Pura sangre", edad=5, peso=450)

# Creación de la instancia del león
leon = Animal(nombre="Boulder", raza="Atlas", edad=10, peso=130)

# Mostrar la información de ambos animales
caballo.mostrar_informacion()  # Muestra la información del caballo
leon.mostrar_informacion()      # Muestra la información del león
