# Crear un diccionario
mi_diccionario = {"nombre": "Carlos", "edad": 30, "ciudad": "Madrid"}

# Agregar o actualizar elementos
mi_diccionario["profesion"] = "Ingeniero"  # Agregar nueva clave-valor
mi_diccionario["edad"] = 31  # Actualizar el valor de una clave existente
print("Diccionario después de agregar/actualizar:", mi_diccionario)

# Acceder a un valor
print("Edad:", mi_diccionario["edad"])  # Acceder al valor de una clave

# Eliminar un elemento
del mi_diccionario["ciudad"]  # Eliminar una clave-valor
profesion = mi_diccionario.pop("profesion")  # Eliminar y devolver el valor de una clave
print(f"Profesión eliminada: {profesion}")
print("Diccionario después de eliminar elementos:", mi_diccionario)

# Obtener solo las claves o los valores
claves = mi_diccionario.keys()  # Obtener todas las claves
valores = mi_diccionario.values()  # Obtener todos los valores
print("Claves del diccionario:", claves)
print("Valores del diccionario:", valores)

# Iterar sobre el diccionario
for clave, valor in mi_diccionario.items():
    print(f"{clave}: {valor}")

# Copiar un diccionario
nuevo_diccionario = mi_diccionario.copy()  # Crear una copia del diccionario
print("Nuevo diccionario copiado:", nuevo_diccionario)

# Limpiar el diccionario
mi_diccionario.clear()  # Vaciar el diccionario
print("Diccionario después de ser vaciado:", mi_diccionario)
