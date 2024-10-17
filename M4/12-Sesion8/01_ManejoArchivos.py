def guardar_datos():
    loquesea = input("Ingrese lo que quiera: ")
    mascosas = input("Ingrese mas cosas: ")
    nombredelarchivo = "soy_un_archivo"
    # Guardamos los datos en un archivo
    with open(f"{nombredelarchivo}.txt", "w") as archivo:
        archivo.write(f"info1: {loquesea}\n")
        archivo.write(f"info2: {mascosas}\n")

    print(f"Datos guardados en '{nombredelarchivo}.txt'.")

guardar_datos()
