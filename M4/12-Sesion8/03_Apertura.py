def leer_archivo():
    try:
        with open("nombres.txt", "r") as archivo:
            # Leer el archivo línea por línea
            for linea in archivo:
                print(linea, end='')  # Imprimir cada línea sin saltos de línea adicionales
    except FileNotFoundError:
        print("Error: El archivo 'datos_usuario.txt' no existe.")

leer_archivo()
