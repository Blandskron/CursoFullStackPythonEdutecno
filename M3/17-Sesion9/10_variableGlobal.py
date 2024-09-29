x = 20  # Variable global

def modificar_global():
    global x
    x = 30  # Modifica la variable global
    print(f"Variable global modificada: {x}")

modificar_global()
print(f"Valor de la variable global fuera de la función: {x}")
