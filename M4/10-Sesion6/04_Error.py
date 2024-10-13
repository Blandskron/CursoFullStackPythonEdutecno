# El manejo de excepciones en Python se realiza con los bloques try/except.
# Vamos a capturar una excepción de división por cero.

dividendo = 5
divisor = 0

try:
    cociente = dividendo / divisor  # Esto lanza un ZeroDivisionError
except ZeroDivisionError:
    print("Error: No se puede dividir por cero.")
