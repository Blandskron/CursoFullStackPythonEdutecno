def lectura_completa():
    try:
        with open("mi_archivo.txt", "r") as archivo:
            contenido = archivo.read()  # Lee todo el contenido del archivo
            print("Contenido del archivo:\n", contenido)
    except FileNotFoundError:
        print("Error: El archivo no existe.")

lectura_completa()
