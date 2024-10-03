# Clase base o "superclase" que representa un miembro de la escuela.
class MiembroDeEscuela:
    # Constructor para inicializar los atributos comunes
    def __init__(self, nombre, edad, sexo):
        self.nombre = nombre  # Atributo común: nombre del miembro
        self.edad = edad      # Atributo común: edad del miembro
        self.sexo = sexo      # Atributo común: sexo del miembro (M o F)
    
    # Método que imprime el género basado en el sexo
    def imprimir_genero(self):
        if self.sexo == 'M':
            print(f"{self.nombre} es masculino")
        elif self.sexo == 'F':
            print(f"{self.nombre} es femenino")
        else:
            print(f"Sexo no especificado para {self.nombre}")

    # Método común para obtener la edad
    def obtener_edad(self):
        return self.edad

# Clase Estudiante, que hereda de MiembroDeEscuela
class Estudiante(MiembroDeEscuela):
    # Constructor que hereda atributos de MiembroDeEscuela y añade los propios de Estudiante
    def __init__(self, nombre, edad, sexo, curso):
        super().__init__(nombre, edad, sexo)  # Llamada al constructor de la clase padre
        self.curso = curso  # Atributo específico de Estudiante: curso que está tomando
    
    # Método específico para el estudiante que paga matrícula
    def pagar_matricula(self):
        print(f"{self.nombre} ha pagado la matrícula del curso {self.curso}.")
    
    # Sobrescribimos el método para imprimir el género específico de niños/niñas
    def imprimir_genero(self):
        if self.sexo == 'M':
            print(f"{self.nombre} es un niño")
        elif self.sexo == 'F':
            print(f"{self.nombre} es una niña")
        else:
            print(f"Sexo no especificado para {self.nombre}")

# Clase Profesor, que hereda de MiembroDeEscuela
class Profesor(MiembroDeEscuela):
    # Constructor que hereda atributos de MiembroDeEscuela y añade los propios de Profesor
    def __init__(self, nombre, edad, sexo, salario_anual, cursos_impartidos):
        super().__init__(nombre, edad, sexo)  # Llamada al constructor de la clase padre
        self.salario_anual = salario_anual  # Atributo específico de Profesor: salario anual
        self.cursos_impartidos = cursos_impartidos  # Atributo específico de Profesor: cursos impartidos
    
    # Método específico para que el profesor consulte su salario anual
    def consultar_salario_anual(self):
        print(f"El salario anual de {self.nombre} es de {self.salario_anual}.")

    # Método para mostrar los cursos que imparte el profesor
    def mostrar_cursos(self):
        print(f"{self.nombre} imparte los siguientes cursos: {', '.join(self.cursos_impartidos)}")

# Ejemplo de creación de objetos (instancias) y uso de la jerarquía de clases
estudiante1 = Estudiante("Ana", 10, "F", "Matemáticas")
estudiante1.imprimir_genero()  # Este método está sobrescrito para imprimir 'niña'
estudiante1.pagar_matricula()  # Acción específica del estudiante

profesor1 = Profesor("Carlos", 45, "M", 50000, ["Física", "Química"])
profesor1.imprimir_genero()  # Usa el método de la clase padre
profesor1.consultar_salario_anual()  # Acción específica del profesor
profesor1.mostrar_cursos()  # Mostrar los cursos que imparte el profesor
