# Verificar con tuplas de clases
variable1 = 42
variable2 = "Hola"

print(isinstance(variable1, (int, float, str)))  # True, ya que es int
print(isinstance(variable2, (int, float, str)))  # True, ya que es str

# Estructura de tuplas recursiva
print(isinstance(variable1, ((int, str), (float, bool))))  # True
print(isinstance(variable2, ((complex, str), (float, bool)))) # True