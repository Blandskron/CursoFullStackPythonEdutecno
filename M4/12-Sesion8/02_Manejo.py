import os

# Abrimos un archivo y mostramos su descriptor
archivo = open("datos_usuario.txt", "r")
print("Descriptor de archivo:", archivo.fileno())  # Mostrar el descriptor de archivo

# Aseguramos cerrar el archivo
archivo.close()
