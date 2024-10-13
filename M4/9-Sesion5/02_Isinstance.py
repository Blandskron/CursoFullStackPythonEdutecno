# Clase base
class Empleado:
    pass

# Subclases de Empleado
class Ingeniero(Empleado):
    pass

class Diseñador(Empleado):
    pass

# Verificar instancias
persona1 = Ingeniero()
persona2 = Diseñador()

print(isinstance(persona1, Empleado))  # True
print(isinstance(persona2, Empleado))  # True
print(isinstance(persona1, Ingeniero)) # True
print(isinstance(persona1, Diseñador)) # False