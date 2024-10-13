def leer_archivo(nombre_archivo):
    try:
        # Abrimos el archivo en modo lectura
        with open(nombre_archivo, 'r') as f:
            # Leemos todas las líneas del archivo
            contenido = f.readlines()
            # Mostramos cada línea en la consola
            for linea in contenido:
                print(linea, end='')  # end='' evita líneas adicionales
    except FileNotFoundError:
        print(f"Error: El archivo '{nombre_archivo}' no existe.")
    except IOError:
        print("Error: No se pudo leer el archivo.")
    finally:
        print("\nAcciones de limpieza finalizadas.")

# Ruta del archivo (ajusta esta ruta según donde se encuentre tu archivo)
ruta_archivo = "mi_archivo.txt"

# Llamamos a la función para leer el archivo
leer_archivo(ruta_archivo)
