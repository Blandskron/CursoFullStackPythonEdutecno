def obtener_atributos():
    archivo = open("nombres.txt", "r")

    # Obtener y mostrar atributos del archivo
    print("Nombre del archivo:", archivo.name)
    print("Modo de apertura:", archivo.mode)
    print("¿Está cerrado?", archivo.closed)
    
    # Cerrar el archivo
    archivo.close()

obtener_atributos()
