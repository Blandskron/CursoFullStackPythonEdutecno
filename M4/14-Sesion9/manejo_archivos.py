# Ejemplo de Manejo de Archivos en Python

## 1. Apertura en Modo Lectura

### a. Obteniendo Atributos de un Archivo

def obtener_atributos():
    archivo = open("mi_archivo.txt", "r")  # Asegúrate de que el archivo exista

    # Obtener y mostrar atributos del archivo
    print("Nombre del archivo:", archivo.name)
    print("Modo de apertura:", archivo.mode)
    print("¿Está cerrado?", archivo.closed)
    
    # Cerrar el archivo
    archivo.close()

obtener_atributos()

### b. Lectura Completa del Archivo

def lectura_completa():
    try:
        with open("mi_archivo.txt", "r") as archivo:
            contenido = archivo.read()  # Lee todo el contenido del archivo
            print("Contenido del archivo:\n", contenido)
    except FileNotFoundError:
        print("Error: El archivo no existe.")

lectura_completa()

### c. Lectura de una Línea

def lectura_linea():
    try:
        with open("mi_archivo.txt", "r") as archivo:
            linea = archivo.readline()  # Lee la primera línea
            print("Primera línea del archivo:", linea.strip())  # Eliminar saltos de línea
    except FileNotFoundError:
        print("Error: El archivo no existe.")

lectura_linea()

## 2. Apertura en Modalidad Escritura

### a. Escribiendo en el Archivo

def escribir_archivo():
    with open("nuevo_archivo.txt", "w") as archivo:
        archivo.write("Este es un nuevo archivo creado en modo escritura.\n")
        archivo.write("Aquí se pueden agregar más líneas de texto.\n")
    print("Contenido escrito en 'nuevo_archivo.txt'.")

escribir_archivo()

### b. Modificando el Nombre (Renombrar un Archivo)

import os

def renombrar_archivo():
    old_name = "nuevo_archivo.txt"
    new_name = "archivo_modificado.txt"

    os.rename(old_name, new_name)  # Renombrar archivo
    print(f"Archivo renombrado de '{old_name}' a '{new_name}'.")

renombrar_archivo()

### c. Cerrando Archivo

def cerrar_archivo():
    archivo = open("mi_archivo.txt", "r")  # Abre el archivo
    print("¿Está cerrado antes de cerrar?", archivo.closed)  # Debe ser False
    
    archivo.close()  # Cerrar el archivo
    print("¿Está cerrado después de cerrar?", archivo.closed)  # Debe ser True

cerrar_archivo()

## 3. Atributos del Archivo

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
