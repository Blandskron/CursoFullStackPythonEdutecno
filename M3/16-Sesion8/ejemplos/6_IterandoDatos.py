# Si se requiere secuencia y modificación, usamos una lista
lista_compras = ["Leche", "Pan", "Huevos"]

# Si los datos no deben cambiar, usamos una tupla
dias_semana = ("lunes", "martes", "miércoles")

# Si solo importan los valores únicos, usamos un set
set_colores = {"rojo", "verde", "azul", "verde"}

# Si necesitamos pares clave-valor, usamos un diccionario
informacion_usuario = {"nombre": "Ana", "edad": 28}

# Iterar una lista
for item in lista_compras:
    print(item)

# Iterar un diccionario (pares clave-valor)
for clave, valor in informacion_usuario.items():
    print(f"{clave}: {valor}")

# Iterar una lista
for item in lista_compras:
    print(item)

# Iterar un diccionario (pares clave-valor)
for clave, valor in informacion_usuario.items():
    print(f"{clave}: {valor}")
