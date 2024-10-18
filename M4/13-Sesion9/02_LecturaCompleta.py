def lectura_completa():
    try:
        with open("nombres.txt", "r") as archivo:
            contenido = archivo.read()  # Lee todo el contenido del archivo
            print("Contenido del archivo:\n", contenido)
            print("Nombre del archivo:", archivo.name)
            print("Modo de apertura:", archivo.mode)
            print("¿Está cerrado?", archivo.closed)
    
    except FileNotFoundError:
        print("Error: El archivo no existe.")

lectura_completa()
