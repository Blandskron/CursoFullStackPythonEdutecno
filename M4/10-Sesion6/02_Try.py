# Python tiene varios tipos de excepciones. Vamos a ver algunos ejemplos.

# ZeroDivisionError: Intentar dividir por 0
try:
    print(10 / 0)
except ZeroDivisionError:
    print("Error: División por cero.")

# NameError: Usar una variable no definida
try:
    print(variable_no_definida)
except NameError:
    print("Error: La variable no está definida.")

# TypeError: Operaciones con tipos incorrectos
try:
    print('2' + 2)  # No se puede sumar una cadena con un número
except TypeError:
    print("Error: No se pueden concatenar tipos diferentes.")
