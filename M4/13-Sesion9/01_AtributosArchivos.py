def obtener_atributos():
    archivo = open("mi_archivo.txt", "r")  # Asegúrate de que el archivo exista

    # Obtener y mostrar atributos del archivo
    print("Nombre del archivo:", archivo.name)
    print("Modo de apertura:", archivo.mode)
    print("¿Está cerrado?", archivo.closed)
    
    # Cerrar el archivo
    archivo.close()

obtener_atributos()
