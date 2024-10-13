# Si vamos a capturar múltiples excepciones, es importante que las más específicas vayan primero.
# El siguiente código es incorrecto porque el except general está antes del específico.

# try:
#     resultado = 10 / 0
# except:
#     print("Ocurrió un error.")  # Este bloque es demasiado general
# except ZeroDivisionError:  # Este bloque no será alcanzado
#     print("Error: División por cero.")

# La versión correcta sería poner el except general al final.

try:
    resultado = 10 / 0
except ZeroDivisionError:
    print("Error: No se puede dividir por cero.")
except:
    print("Ocurrió algún otro error.")
