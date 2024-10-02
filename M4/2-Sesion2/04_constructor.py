# El método constructor se utiliza para inicializar los atributos de la clase
class Vehiculo:
    def __init__(self, color, aceleracion):
        self.color = color  # Atributo color inicializado en el constructor
        self.aceleracion = aceleracion  # Atributo aceleración inicializado en el constructor
        self.velocidad = 0  # Atributo con un valor por defecto
