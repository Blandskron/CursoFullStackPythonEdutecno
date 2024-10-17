def guardar_datos():
    producto = input("Ingrese lo que quiera: ")
    precio = input("Ingrese mas cosas: ")

    # Guardamos los datos en un archivo
    with open("base_datos.txt", "w") as archivo:
        archivo.write(f"Producto: {producto}\nPrecio: {precio}\n")


    print(f"Datos guardados en 'base_datos.txt'.")

def modo_agregar():
    producto = input("Ingrese lo que quiera: ")
    precio = input("Ingrese mas cosas: ")
    with open("base_datos.txt", "a") as archivo:
        archivo.write(f"Producto: {producto}\nPrecio: {precio}\n")
    print("Contenido agregado a 'base_datos.txt'.")

def modo_lectura():
    try:
        with open("base_datos.txt", "r") as archivo:
            contenido = archivo.read()
            print("Contenido del archivo en modo lectura:\n", contenido)
    except FileNotFoundError:
        print("Error: El archivo no existe.")


accion = int(input("Que quiere hacer \n1-Guardar un dato (puede sobreescribir) \n2-Agregar un dato (sin sobreescribir) \n3-Consultar productos en base de datos: "))

if accion == 1:
    guardar_datos()
elif accion == 2:
    modo_agregar()
elif accion == 3:
    modo_lectura()
else:
    print("accion fallida salir")
