def escribir_archivo():
    with open("nuevo_archivo.txt", "w") as archivo:
        archivo.write("Este es un nuevo archivo creado en modo escritura.\n")
        archivo.write("Aquí se pueden agregar más líneas de texto.\n")
    print("Contenido escrito en 'nuevo_archivo.txt'.")

escribir_archivo()
