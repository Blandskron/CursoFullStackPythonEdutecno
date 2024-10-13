# Las excepciones son errores que ocurren durante la ejecución del programa.
# En este ejemplo, intentamos dividir por 0, lo cual genera una excepción.

try:
    resultado = 1 / 0  # Esto genera una excepción
except ZeroDivisionError:
    print("Error: No se puede dividir por cero.")  # Manejo del error
