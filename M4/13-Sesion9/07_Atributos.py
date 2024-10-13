def atributos_archivo():
    with open("mi_archivo.txt", "r", encoding="utf-8") as archivo:
        print("Nombre del archivo:", archivo.name)
        print("Modo de apertura:", archivo.mode)
        print("¿Está cerrado?", archivo.closed)
        print("Codificación del archivo:", archivo.encoding)
        
        # Leer el contenido
        contenido = archivo.read()
        print("Contenido del archivo:\n", contenido)

atributos_archivo()
