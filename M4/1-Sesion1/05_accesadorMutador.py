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

class Alumno:
    def __init__(self, nombre, curso):
        self.nombre = nombre
        self.curso = curso
        self.__materia = 0

    def get_materia(self):
        return self.__materia

    def set_materia(self, materia):
        self.__materia = materia

    def get_nombre(self):
        return self.nombre

    def set_nombre(self, nombre):
        self.nombre = nombre
    
"""
# Crear un objeto y acceder/mutar atributos
mi_carro = Vehiculo('Rojo', 50)
mi_auto = Vehiculo('negro', 30)
print(mi_carro.get_color())  # Imprime el color inicial
mi_carro.set_color('Blanco')  # Cambia el color del vehículo
print(mi_carro.get_color())  # Imprime el nuevo color
"""

alumno1 = Alumno('Alejandro', '4 Medio')
print(alumno1.nombre, alumno1.curso)
print(alumno1.get_materia())
alumno1.set_materia(5)
print(alumno1.get_materia())
print(alumno1.get_nombre())
alumno1.set_nombre('rodrigo')
print(alumno1.get_nombre())

