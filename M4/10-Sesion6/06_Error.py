# Si no sabemos qué tipo de excepción puede ocurrir, podemos usar una excepción genérica.

try:
    resultado = 10 / 0
except:
    print("Ocurrió un error, pero no sabemos cuál.")
