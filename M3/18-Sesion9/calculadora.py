# Función para registrar el nombre y apellido del usuario
def registrar_usuario(nombre, apellido):
    # Función anidada para mostrar el nombre completo
    def mostrar_nombre_completo():
        print(f"Usuario: {nombre} {apellido}")
    
    # Llamar a la función anidada
    mostrar_nombre_completo()

# Función recursiva para calcular el factorial
def calcular_factorial(numero):
    if numero == 1:
        return 1
    else:
        return numero * calcular_factorial(numero - 1)

# Función principal que utiliza ambas funciones
def calcular_factorial_usuario(nombre, apellido, numero):
    # Registrar el usuario
    registrar_usuario(nombre=nombre, apellido=apellido)
    
    # Calcular el factorial
    resultado = calcular_factorial(numero)
    print(f"El factorial de {numero} es: {resultado}")

# Llamada a la función principal con parámetros usando nombres
calcular_factorial_usuario(nombre="Juan", apellido="Pérez", numero=5)

# Se puede llamar con los parámetros en otro orden gracias al uso de nombres
calcular_factorial_usuario(apellido="López", nombre="Ana", numero=4)
