# En programación estructurada, las funciones y los datos están separados.
# Aquí vemos cómo se calcula el área en programación estructurada.

# Función que calcula el área de un rectángulo en programación estructurada
def calcular_area_rectangulo(base, altura):
    return base * altura

# En POO, agrupamos datos y comportamiento en objetos.
class Rectangulo:
    # Constructor que inicializa los atributos del rectángulo
    def __init__(self, base, altura):
        self.base = base      # Atributo base del rectángulo
        self.altura = altura  # Atributo altura del rectángulo
    
    # Método que calcula el área del rectángulo
    def calcular_area(self):
        return self.base * self.altura

# Creación de un objeto Rectangulo y uso del método
rect = Rectangulo(4, 5)
print(rect.calcular_area())  # Llamada al método de la clase
