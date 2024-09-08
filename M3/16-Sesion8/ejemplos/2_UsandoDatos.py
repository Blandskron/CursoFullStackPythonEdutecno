# Las estructuras de datos se utilizan para introducir, procesar, mantener y recuperar información.
# Ejemplo simple de una lista
mi_lista = [1, 2, 3]

# Ejemplo de un diccionario
mi_diccionario = {"clave": "valor"}

# Introducción de datos (añadir elementos a la lista)
mi_lista.append(4)

# Procesamiento de datos (sumar elementos en una lista)
suma = sum(mi_lista)
print(f"Suma de los elementos de la lista: {suma}")

# Mantenimiento de datos (ordenar una lista)
mi_lista.sort()
print(f"Lista ordenada: {mi_lista}")

# Recuperación de datos (acceder a un elemento del diccionario)
valor_clave = mi_diccionario.get("clave")
print(f"Valor de la clave 'clave': {valor_clave}")
