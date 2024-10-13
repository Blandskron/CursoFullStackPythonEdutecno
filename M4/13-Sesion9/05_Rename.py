import os

def renombrar_archivo():
    old_name = "nuevo_archivo.txt"
    new_name = "archivo_modificado.txt"

    os.rename(old_name, new_name)  # Renombrar archivo
    print(f"Archivo renombrado de '{old_name}' a '{new_name}'.")

renombrar_archivo()
