# Crear un set
mi_set = {1, 2, 3, 4, 5}

# Agregar elementos
mi_set.add(6)  # Agregar un nuevo elemento
mi_set.update([7, 8, 9])  # Agregar múltiples elementos
print("Set después de agregar elementos:", mi_set)

# Eliminar elementos
mi_set.remove(3)  # Eliminar un elemento específico
mi_set.discard(10)  # Intentar eliminar un elemento que no existe (sin error)
print("Set después de eliminar elementos:", mi_set)

# Operaciones de conjuntos
otro_set = {5, 6, 7, 8}
union_set = mi_set.union(otro_set)  # Unión de sets
interseccion_set = mi_set.intersection(otro_set)  # Intersección de sets
diferencia_set = mi_set.difference(otro_set)  # Diferencia de sets

print("Unión de sets:", union_set)
print("Intersección de sets:", interseccion_set)
print("Diferencia de sets:", diferencia_set)

# Comprobar si un elemento está en el set
print("¿1 está en el set?", 1 in mi_set)

# Copiar el set
nuevo_set = mi_set.copy()  # Crear una copia del set
print("Nuevo set copiado:", nuevo_set)

# Limpiar el set
mi_set.clear()  # Vaciar el set
print("Set después de ser vaciado:", mi_set)
