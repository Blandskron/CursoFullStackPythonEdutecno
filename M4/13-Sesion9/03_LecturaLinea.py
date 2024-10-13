def lectura_linea():
    try:
        with open("mi_archivo.txt", "r") as archivo:
            linea = archivo.readline()  # Lee la primera línea
            print("Primera línea del archivo:", linea.strip())  # Eliminar saltos de línea
    except FileNotFoundError:
        print("Error: El archivo no existe.")

lectura_linea()
