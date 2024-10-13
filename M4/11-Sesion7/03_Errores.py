def dividir(x, y):
    try:
        resultado = x / y
    except ZeroDivisionError:
        print("Error: División por cero.")
    else:
        print(f"El resultado es {resultado}")
    finally:
        print("Se ejecuta la cláusula finally.")

# Llamadas a la función
dividir(2, 1)  # Sin errores
dividir(2, 0)  # Error de división por cero
dividir("2", "1")  # Error de tipo
