# Verificar tipos básicos
print(isinstance(4, int))  # True
print(isinstance(4, str))  # False

# Usar `isinstance()` con tuplas
print(isinstance(5, (int, str)))  # True

# Clase personalizada
class Circulo:
    def __init__(self, radio):
        self.radio = radio

mi_circulo = Circulo(3)

# Verificar si mi_circulo es de tipo Circulo
print(isinstance(mi_circulo, Circulo))  # True

# Herencia y isinstance
class CirculoColoreado(Circulo):
    def __init__(self, radio, color):
        super().__init__(radio)
        self.color = color

circulo_azul = CirculoColoreado(5, "azul")
print(isinstance(circulo_azul, CirculoColoreado))  # True
print(isinstance(circulo_azul, Circulo))           # True (ya que hereda de Circulo)
