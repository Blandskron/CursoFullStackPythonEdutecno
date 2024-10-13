# Esto deja el archivo abierto si ocurre un error
for line in open("mi_archivo.txt"):
    print(line, end="")

# El archivo se cierra automáticamente al final del bloque `with`, incluso si ocurre un error
with open("mi_archivo.txt") as f:
    for line in f:
        print(line, end="")
