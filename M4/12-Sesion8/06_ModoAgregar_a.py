# Modo agregar
def modo_agregar():
    with open("nombres.txt", "a") as archivo:
        archivo.write("Bob \nCharlie \nDavid \naldo \nruth \ndaniela \nerick \nnatalia \ncarlos \n")
    print("Contenido agregado a 'nombres.txt'.")

modo_agregar()
