import os

# Abrimos un archivo y mostramos su descriptor
archivo = open("people_data.txt", "r")
print("Descriptor de archivo:", archivo.fileno())  # Mostrar el descriptor de archivo

# Aseguramos cerrar el archivo
archivo.close()

# Lista de nombres
nombres = ['Bob', 'Charlie', 'David', 'aldo', 'ruth', 'daniela', 'erick', 'natalia', 'carlos']

# Abrimos el archivo en modo de escritura
with open('nombres.txt', 'w') as archivo:
    # Añadimos un salto de línea a cada nombre y escribimos en el archivo
    archivo.writelines([nombre + '\n' for nombre in nombres])
