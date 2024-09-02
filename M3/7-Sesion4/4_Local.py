# Variable global
mensaje = "Hola desde el scope global"

def saludar():
    # Variable local
    mensaje = "Hola desde el scope local"
    print(mensaje)  # Salida: Hola desde el scope local

saludar()
print(mensaje)  # Salida: Hola desde el scope global
