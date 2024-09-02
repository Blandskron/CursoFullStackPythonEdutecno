# Usando métodos dentro de clases con correcta indentación y comentarios
class Calculadora:
    def __init__(self):
        """Inicializa la calculadora con un resultado en 0"""
        self.resultado = 0

    def sumar(self, valor):
        """Suma un valor al resultado actual"""
        self.resultado += valor

calc = Calculadora()
calc.sumar(10)
print("Resultado:", calc.resultado)
