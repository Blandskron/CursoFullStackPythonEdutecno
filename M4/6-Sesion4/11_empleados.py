# Clase base Empleado
class Empleado:
    def __init__(self, nombre, apellido, salario):
        self.nombre = nombre
        self.apellido = apellido
        self.salario = salario
    
    def obtener_datos(self):
        return f"{self.nombre} {self.apellido}, Salario: {self.salario}"

# Subclase Desarrollador que hereda de Empleado
class Desarrollador(Empleado):
    def __init__(self, nombre, apellido, salario, lenguaje):
        super().__init__(nombre, apellido, salario)
        self.lenguaje = lenguaje
    
    def obtener_datos(self):
        datos_empleado = super().obtener_datos()
        return f"{datos_empleado}, Lenguaje: {self.lenguaje}"

# Subclase Gerente que hereda de Empleado
class Gerente(Empleado):
    def __init__(self, nombre, apellido, salario, departamento):
        super().__init__(nombre, apellido, salario)
        self.departamento = departamento
    
    def obtener_datos(self):
        datos_empleado = super().obtener_datos()
        return f"{datos_empleado}, Departamento: {self.departamento}"

# Ejemplo de uso
desarrollador = Desarrollador("María", "Fernández", 4000, "Python")
gerente = Gerente("José", "López", 6000, "IT")

print(desarrollador.obtener_datos())
print(gerente.obtener_datos())
