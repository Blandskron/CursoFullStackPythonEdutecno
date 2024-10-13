def guardar_datos():
    nombre = input("Ingrese su nombre: ")
    edad = input("Ingrese su edad: ")

    # Guardamos los datos en un archivo
    with open("datos_usuario.txt", "w") as archivo:
        archivo.write(f"Nombre: {nombre}\n")
        archivo.write(f"Edad: {edad}\n")

    print("Datos guardados en 'datos_usuario.txt'.")

guardar_datos()
