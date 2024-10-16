# Esto deja el archivo abierto si ocurre un error
for line in open("people_data.txt", encoding="utf-8"):
    print(line, end="")

# El archivo se cierra automáticamente al final del bloque `with`, incluso si ocurre un error
with open("mi_archivo.txt", encoding="utf-8") as f:
    for line in f:
        print(line, end="")
