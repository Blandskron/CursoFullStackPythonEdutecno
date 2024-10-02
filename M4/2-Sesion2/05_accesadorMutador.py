# Métodos accesadores (getters) y mutadores (setters)
class Vehiculo:
    def __init__(self, color, aceleracion):
        self.__color = color  # Atributo privado (indicado por el doble guión bajo)
        self.aceleracion = aceleracion

    # Método accesador para obtener el color
    def get_color(self):
        return self.__color

    # Método mutador para cambiar el color
    def set_color(self, color):
        self.__color = color

# Crear un objeto y acceder/mutar atributos
mi_carro = Vehiculo('Rojo', 50)
print(mi_carro.get_color())  # Imprime el color inicial
mi_carro.set_color('Blanco')  # Cambia el color del vehículo
print(mi_carro.get_color())  # Imprime el nuevo color
