# Modo lectura y escritura
def modo_lectura_escritura():
    with open("nuevo_archivo.txt", "r+") as archivo:
        contenido = archivo.read()
        print("Contenido original del archivo:\n", contenido)
        archivo.write("Este contenido fue añadido después de leer.\n")

modo_lectura_escritura()
