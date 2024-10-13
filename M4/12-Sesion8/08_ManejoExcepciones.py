def manejo_excepciones():
    try:
        with open("archivo_inexistente.txt", "r") as archivo:
            contenido = archivo.read()
    except FileNotFoundError:
        print("Error: No se encontró el archivo.")

manejo_excepciones()
