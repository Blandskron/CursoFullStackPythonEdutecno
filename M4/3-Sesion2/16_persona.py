import random

# Función para generar un RUT aleatorio
def generar_rut():
    numero = random.randint(10000000, 25000000)  # Genera un número de RUT entre 10 y 25 millones
    digito_verificador = random.choice('0123456789K')  # Elige un dígito verificador aleatorio
    return f"{numero}-{digito_verificador}"

class Persona:
    def __init__(self, nombre, edad):
        self.__nombre = nombre  # Atributo privado para el nombre
        self.__edad = edad  # Atributo privado para la edad
        self.__rut = generar_rut()  # El RUT se genera al crear la instancia, es inmutable

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

    # Método Get para obtener el RUT
    def get_rut(self):
        return self.__rut

# Crear una instancia de la clase Persona
persona = Persona("Pedro", 20)

# Obtener y mostrar los atributos usando los métodos Get
print("Nombre:", persona.get_nombre())  # Salida: Nombre: Pedro
print("Edad:", persona.get_edad())  # Salida: Edad: 20
print("RUT:", persona.get_rut())  # Salida: RUT generado aleatoriamente

# Modificar los atributos usando los métodos Set
persona.set_nombre("Juan")
persona.set_edad(21)

# Mostrar los atributos después de la modificación
print("Nombre actualizado:", persona.get_nombre())  # Salida: Nombre actualizado: Juan
print("Edad actualizada:", persona.get_edad())  # Salida: Edad actualizada: 21

# Intentar establecer una edad negativa
persona.set_edad(-5)  # Salida: La edad no puede ser negativa.
