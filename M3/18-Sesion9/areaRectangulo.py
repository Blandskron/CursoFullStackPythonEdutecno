# Definir la función para calcular el área del rectángulo
def calcular_area_rectangulo(base, altura):
    # Validar que ambos parámetros sean números positivos
    if base <= 0 or altura <= 0:
        return "Error: La base y la altura deben ser números positivos."
    
    # Calcular el área del rectángulo
    area = base * altura
    return f"El área del rectángulo es: {area}"

# Ejemplo de uso
base = float(input("Introduce la base del rectángulo: "))
altura = float(input("Introduce la altura del rectángulo: "))

# Llamada a la función y mostrar el resultado
resultado = calcular_area_rectangulo(base, altura)
print(resultado)
