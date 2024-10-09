# Clase base Persona
class Persona:
    def __init__(self, numero_identificacion, nombre, apellido):
        self.numero_identificacion = numero_identificacion
        self.nombre = nombre
        self.apellido = apellido
    
    def obtener_datos(self):
        return f"ID: {self.numero_identificacion}, Nombre: {self.nombre} {self.apellido}"

# Subclase Estudiante que hereda de Persona
class Estudiante(Persona):
    def __init__(self, numero_identificacion, nombre, apellido, codigo_alumno, matricula):
        super().__init__(numero_identificacion, nombre, apellido)
        self.codigo_alumno = codigo_alumno
        self.matricula = matricula
    
    def obtener_datos(self):
        datos_persona = super().obtener_datos()
        return f"{datos_persona}, Código alumno: {self.codigo_alumno}, Matrícula: {self.matricula}"

# Subclase Profesor que hereda de Persona
class Profesor(Persona):
    def __init__(self, numero_identificacion, nombre, apellido, materia, salario):
        super().__init__(numero_identificacion, nombre, apellido)
        self.materia = materia
        self.salario = salario
    
    def obtener_datos(self):
        datos_persona = super().obtener_datos()
        return f"{datos_persona}, Materia: {self.materia}, Salario: {self.salario}"

# Ejemplo de uso
estudiante = Estudiante("001", "Ana", "García", "A123", "Matriculado")
profesor = Profesor("002", "Luis", "Martínez", "Matemáticas", 3000)

print(estudiante.obtener_datos())
print(profesor.obtener_datos())
