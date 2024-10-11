def mostrar_informacion(**kwargs):
    for clave, valor in kwargs.items():
        print(f"{clave}: {valor}")

def mostrar_keys(**kwargs):
    for clave in kwargs.keys():
        print(f"{clave}")

def mostrar_values(**kwargs):
    for valor in kwargs.values():
        print(f"{valor}")

mostrar_informacion(nombre="Juan", segundo_nombre="Andres", apellido="Perez", segundo_apellido="Perez", edad=25, ciudad="Madrid")

mostrar_keys(nombre="Juan", segundo_nombre="Andres", apellido="Perez", segundo_apellido="Perez", edad=25, ciudad="Madrid")

mostrar_values(nombre="Juan", segundo_nombre="Andres", apellido="Perez", segundo_apellido="Perez", edad=25, ciudad="Madrid")
