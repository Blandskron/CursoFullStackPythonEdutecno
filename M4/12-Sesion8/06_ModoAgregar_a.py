# Modo agregar
def modo_agregar():
    with open("nuevo_archivo.txt", "a") as archivo:
        archivo.write("Se ha añadido una nueva línea.\n")
    print("Contenido agregado a 'nuevo_archivo.txt'.")

modo_agregar()
