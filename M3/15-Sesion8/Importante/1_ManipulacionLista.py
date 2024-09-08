# Crear una lista
mi_lista = [10, 20, 30, 40, 50]

# Agregar elementos a la lista
mi_lista.append(60)  # Agregar al final
mi_lista.insert(2, 25)  # Insertar en una posición específica
print("Lista después de agregar elementos:", mi_lista)

# Eliminar elementos de la lista
mi_lista.remove(40)  # Eliminar por valor
elemento_eliminado = mi_lista.pop()  # Eliminar el último elemento
print(f"Elemento eliminado: {elemento_eliminado}")
print("Lista después de eliminar elementos:", mi_lista)

# Ordenar la lista
mi_lista.sort()  # Ordenar de menor a mayor
print("Lista ordenada:", mi_lista)

mi_lista.reverse()  # Invertir el orden de la lista
print("Lista en orden inverso:", mi_lista)

# Encontrar la longitud de la lista
print("Longitud de la lista:", len(mi_lista))

# Buscar un elemento en la lista
print("Índice de 25:", mi_lista.index(25))  # Buscar el índice de un valor
print("¿30 está en la lista?", 30 in mi_lista)  # Comprobar si un valor está en la lista

# Contar las veces que un valor aparece en la lista
mi_lista.append(10)
print("Cantidad de veces que 10 aparece en la lista:", mi_lista.count(10))

# Copiar la lista
nueva_lista = mi_lista.copy()  # Crear una copia de la lista
print("Nueva lista copiada:", nueva_lista)

# Limpiar la lista
mi_lista.clear()  # Vaciar la lista
print("Lista después de ser vaciada:", mi_lista)
