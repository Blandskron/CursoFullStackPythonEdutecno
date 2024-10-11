# Verificar con tuplas de clases
variable1 = 42
variable2 = "Hola"

# Cambiamos las clases en las tuplas para que los resultados sean False
print(isinstance(variable1, (float, complex, str)))  # False, ya que es int
print(isinstance(variable2, (float, int, list)))     # False, ya que es str

# Estructura de tuplas recursiva
print(isinstance(variable1, ((float, str), (complex, bool))))  # False
print(isinstance(variable2, ((complex, list), (float, bool)))) # False