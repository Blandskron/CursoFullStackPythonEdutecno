def cerrar_archivo():
    archivo = open("mi_archivo.txt", "r")  # Abre el archivo
    print("¿Está cerrado antes de cerrar?", archivo.closed)  # Debe ser False
    
    archivo.close()  # Cerrar el archivo
    print("¿Está cerrado después de cerrar?", archivo.closed)  # Debe ser True

cerrar_archivo()
