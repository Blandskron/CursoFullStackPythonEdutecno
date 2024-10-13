# Modo escritura
def modo_escritura():
    with open("nuevo_archivo.txt", "w") as archivo:
        archivo.write("Este es un nuevo archivo.\n")
        archivo.write("Solo se puede escribir en este modo.\n")
    print("Archivo 'nuevo_archivo.txt' creado y contenido escrito.")

modo_escritura()
