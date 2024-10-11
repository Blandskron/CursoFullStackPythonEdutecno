def mostrar_informacion(**kwargs):
    for clave, valor in kwargs.items():
        print(f"{clave}: {valor}")

mostrar_informacion(nombre="Juan", edad=25, ciudad="Madrid")
