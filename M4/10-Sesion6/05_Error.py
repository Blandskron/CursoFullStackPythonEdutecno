# Podemos capturar múltiples excepciones en un mismo bloque try.
# En este ejemplo, intentamos abrir un archivo que no existe y también manejar una división por cero.

try:
    with open('archivo_que_no_existe.txt', 'r') as file:
        contenido = file.read()
    resultado = 10 / 0
except FileNotFoundError:
    print("Error: El archivo no fue encontrado, verifica que el archivo exista")
except ZeroDivisionError:
    print("Error: No se puede dividir por cero.")
except Exception as e:
    # Captura cualquier otra excepción
    print(f"Error inesperado: {e}")
