# Crear una tupla
mi_tupla = (10, 20, 30, 40, 50)

# Acceder a un elemento de la tupla
print("Elemento en el índice 2:", mi_tupla[2])

# Obtener la longitud de la tupla
print("Longitud de la tupla:", len(mi_tupla))

# Contar cuántas veces aparece un valor en la tupla
print("Cantidad de veces que 30 aparece en la tupla:", mi_tupla.count(30))

# Obtener el índice de un valor en la tupla
print("Índice de 40:", mi_tupla.index(40))

# Iterar sobre los elementos de la tupla
for elemento in mi_tupla:
    print(elemento)

# Convertir la tupla en una lista (si necesitas modificarla)
lista_desde_tupla = list(mi_tupla)
lista_desde_tupla.append(60)
print("Lista modificada desde la tupla:", lista_desde_tupla)
