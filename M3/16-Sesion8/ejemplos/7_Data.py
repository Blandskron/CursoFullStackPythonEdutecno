# Crear una lista
mi_lista = ["a", "b", "c"]

# Crear una tupla
mi_tupla = (1, 2, 3)

# Crear un set
mi_set = {10, 20, 30}

# Crear un diccionario
mi_diccionario = {"clave1": "valor1", "clave2": "valor2"}

# Acceder a un elemento de una lista
print(mi_lista[0])  # Primer elemento

# Acceder a un valor en un diccionario
print(mi_diccionario["clave1"])

# Contar elementos en una lista, tupla, set y diccionario
print(len(mi_lista))  # Listas
print(len(mi_tupla))  # Tuplas
print(len(mi_set))    # Sets
print(len(mi_diccionario))  # Diccionarios

# Iterar sobre una lista
for item in mi_lista:
    print(item)

# Iterar sobre un diccionario (clave, valor)
for clave, valor in mi_diccionario.items():
    print(f"{clave}: {valor}")

# Insertar en una lista
mi_lista.append("d")
print(mi_lista)

# Borrar un elemento de una lista
mi_lista.remove("b")
print(mi_lista)

# Agregar a un set
mi_set.add(40)
print(mi_set)

# Eliminar de un set
mi_set.remove(10)
print(mi_set)

# Insertar un par en un diccionario
mi_diccionario["clave3"] = "valor3"
print(mi_diccionario)

# Borrar una clave en un diccionario
del mi_diccionario["clave1"]
print(mi_diccionario)
