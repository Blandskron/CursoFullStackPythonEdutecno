# Función que suma dos números
def sumar(a, b):
    return a + b

# Función que resta dos números
def restar(a, b):
    return a - b

# Función que multiplica dos números
def multiplicar(a, b):
    return a * b

# Función que divide dos números (con validación para evitar división por cero)
def dividir(a, b):
    if b == 0:
        return "Error: División por cero no permitida"
    return a / b

# Función que regresa el resultado de todas las operaciones en una tupla
def operaciones(a, b):
    suma = sumar(a, b)
    resta = restar(a, b)
    multiplicacion = multiplicar(a, b)
    division = dividir(a, b)
    return (suma, resta, multiplicacion, division)

# Función para almacenar los resultados en un diccionario
def almacenar_en_diccionario(a, b):
    # Obtener los resultados en forma de tupla
    resultados = operaciones(a, b)
    
    # Crear el diccionario con las claves y valores correspondientes
    diccionario_resultados = {
        "Suma": resultados[0],
        "Resta": resultados[1],
        "Multiplicación": resultados[2],
        "División": resultados[3]
    }
    
    return diccionario_resultados

# Ejemplo de uso
a = float(input("Introduce el primer número: "))
b = float(input("Introduce el segundo número: "))

# Llamar a la función para almacenar resultados en el diccionario
resultados_diccionario = almacenar_en_diccionario(a, b)

# Imprimir el diccionario con los resultados
print("\nResultados almacenados en el diccionario:")
for operacion, resultado in resultados_diccionario.items():
    print(f"{operacion}: {resultado}")
