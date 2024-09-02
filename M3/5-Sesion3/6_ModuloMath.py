import math  # Importamos el módulo math, que contiene funciones matemáticas avanzadas

# Suma (Operación básica, no necesita el módulo math)
a = 10
b = 5
print("Suma: ", a + b)  # Imprime la suma de a y b, resultado: 15

# Resta (Operación básica, no necesita el módulo math)
print("Resta: ", a - b)  # Imprime la resta de a y b, resultado: 5

# Multiplicación (Operación básica, no necesita el módulo math)
print("Multiplicación: ", a * b)  # Imprime la multiplicación de a y b, resultado: 50

# División (Operación básica, no necesita el módulo math)
print("División: ", a / b)  # Imprime la división de a entre b, resultado: 2.0

# División entera con math.floor (equivalente a //, útil cuando queremos la parte entera)
# math.floor() redondea hacia abajo el resultado de la división
print("División entera con math.floor: ", math.floor(a / b))  # Imprime la parte entera de la división, resultado: 2

# Módulo (Operación básica, no necesita el módulo math)
# El operador % nos da el resto de la división entre dos números
print("Módulo: ", a % b)  # Imprime el resto de la división de a entre b, resultado: 0

# Potencia con math.pow (otra manera de elevar un número a otro)
# math.pow(a, b) eleva a a la potencia de b, similar a a ** b
print("Potencia con math.pow: ", math.pow(a, b))  # Imprime a elevado a b, resultado: 100000.0

# Raíz cuadrada con math.sqrt (una operación matemática común)
# math.sqrt(x) calcula la raíz cuadrada de x
print("Raíz cuadrada de a con math.sqrt: ", math.sqrt(a))  # Imprime la raíz cuadrada de a, resultado: 3.16...

# Valor absoluto con math.fabs (otra operación útil para números negativos)
# math.fabs(x) devuelve el valor absoluto de x, siempre como un número flotante
c = -10
print("Valor absoluto de c con math.fabs: ", math.fabs(c))  # Imprime el valor absoluto de c, resultado: 10.0
