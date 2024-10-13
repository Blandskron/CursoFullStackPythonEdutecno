# Modo lectura
def modo_lectura():
    try:
        with open("datos_usuario.txt", "r") as archivo:
            contenido = archivo.read()
            print("Contenido del archivo en modo lectura:\n", contenido)
    except FileNotFoundError:
        print("Error: El archivo no existe.")

modo_lectura()
