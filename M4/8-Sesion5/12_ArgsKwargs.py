def funcion_completa(*args, **kwargs):
    print("Argumentos posicionales:", args)
    print("Argumentos con nombre:", kwargs)

funcion_completa(1, 2, 3, nombre="Ana", edad=30)
