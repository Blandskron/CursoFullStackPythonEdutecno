from multipledispatch import dispatch  # Importación del decorador para sobrecarga de métodos

# Definición de funciones sobrecargadas usando dispatch
class Calculadora:
    @dispatch(int, int)
    def sumar(self, a, b):
        return a + b  # Suma de dos enteros

    @dispatch(int, int, int)
    def sumar(self, a, b, c):
        return a + b + c  # Suma de tres enteros

# Uso de las funciones sobrecargadas
calc = Calculadora()
print(calc.sumar(2, 3))  # Llama a la función que suma dos números
print(calc.sumar(1, 2, 3))  # Llama a la función que suma tres números
