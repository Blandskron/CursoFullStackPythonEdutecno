import os

def renombrar_archivo():
    nuevo = input("ingrese el nuevo nombre: ")
    old_name = "nombres.txt"
    # new_name = f"{nuevo}.txt"

    # Error de sintaxis, porque aqui pase una cadena de texto y no 2 paraMETROS
    # os.rename(f"{old_name}, {new_name}.txt") 
    # parametros  1         2 
    # os.rename(old_name, new_name)  # Renombrar archivo
    os.rename(old_name, f"{nuevo}.txt")
    print(f"Archivo renombrado de '{old_name}' a '{nuevo}.txt'.")

renombrar_archivo()
