# Definición de una excepción personalizada
class MyError(Exception):
    def __init__(self, value):
        self.value = value

    def __str__(self):
        return repr(self.value)

# Función para dividir dos números
def dividir(x, y):
    try:
        if y == 0:
            raise MyError("No se puede dividir por cero.")  # Usamos la excepción definida por el usuario
        resultado = x / y
    except MyError as e:
        print(f"Error: {e}")
    except TypeError:
        print("Error: Los tipos de datos no son válidos para la división.")
    else:
        print(f"El resultado de {x} / {y} es {resultado}.")
    finally:
        print("Ejecutando la cláusula finally...")

# Función para leer un archivo usando acciones de limpieza predefinidas
def leer_archivo(nombre_archivo):
    try:
        with open(nombre_archivo, 'r', encoding="utf-8") as f:
            contenido = f.readlines()
            for linea in contenido:
                print(linea, end='')  # Imprime cada línea del archivo
    except FileNotFoundError:
        print(f"Error: El archivo '{nombre_archivo}' no existe.")
    except IOError:
        print("Error: No se pudo leer el archivo.")
    finally:
        print("\nAcciones de limpieza finalizadas.")

# Ejecución del código
def main():
    # Prueba de la función dividir
    dividir(10, 2)       # División válida
    dividir(10, 0)       # División por cero (excepción personalizada)
    dividir(10, 'a')     # División con tipo incorrecto

    # Prueba de la función leer_archivo
    leer_archivo("people_data.txt")  # Leer archivo que hemos creado

if __name__ == "__main__":
    main()
