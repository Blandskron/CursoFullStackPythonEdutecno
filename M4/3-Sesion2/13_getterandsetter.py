class Estudiante:
    def __init__(self, nombre, edad):
        self.__nombre = nombre  # Atributo privado para el nombre
        self.__edad = edad      # Atributo privado para la edad

    # Método Get para obtener el nombre
    def get_nombre(self):
        return self.__nombre

    # Método Set para modificar el nombre
    def set_nombre(self, nombre):
        self.__nombre = nombre

    # Método Get para obtener la edad
    def get_edad(self):
        return self.__edad

    # Método Set para modificar la edad
    def set_edad(self, edad):
        if edad >= 0:  # Validar que la edad no sea negativa
            self.__edad = edad
        else:
            print("La edad no puede ser negativa.")

# Crear una instancia de la clase Estudiante
estudiante = Estudiante("Pedro", 20)

# Obtener y mostrar los atributos usando los métodos Get
print("Nombre:", estudiante.get_nombre())  # Salida: Nombre: Pedro
print("Edad:", estudiante.get_edad())      # Salida: Edad: 20

# Modificar los atributos usando los métodos Set
estudiante.set_nombre("Juan")
estudiante.set_edad(21)

# Mostrar los atributos después de la modificación
print("Nombre actualizado:", estudiante.get_nombre())  # Salida: Nombre actualizado: Juan
print("Edad actualizada:", estudiante.get_edad())      # Salida: Edad actualizada: 21

# Intentar establecer una edad negativa
estudiante.set_edad(-5)  # Salida: La edad no puede ser negativa.
