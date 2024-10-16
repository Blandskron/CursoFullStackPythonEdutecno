def leer_archivo(nombre_archivo):
    try:
        with open("people_data.txt", "r", encoding="utf-8") as f:
            contenido = f.readlines()
            for linea in contenido:
                print(linea, end='')  # Imprime cada línea del archivo
    except FileNotFoundError:
        print(f"Error: El archivo '{nombre_archivo}' no existe.")
    except IOError:
        print("Error: No se pudo leer el archivo.")
    finally:
        print("\nAcciones de limpieza finalizadas.")

nombre_archivo = "people_data.txt"

leer_archivo(nombre_archivo)
