# La clase es la definición genérica.
# El objeto es una instancia concreta de esa clase.
# Aquí, Vehiculo es la clase, y mi_coche es una instancia (objeto) de esa clase.

class Vehiculo:
    # Constructor que define los atributos de la clase Vehiculo
    def __init__(self, marca, modelo):
        self.marca = marca  # Atributo marca
        self.modelo = modelo  # Atributo modelo

# Creación de un objeto de la clase Vehiculo
mi_coche = Vehiculo("Ford", "Focus")  # mi_coche es una instancia de la clase Vehiculo
