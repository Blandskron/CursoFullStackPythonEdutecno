# Definición de la clase Persona
class Persona:
    def __init__(self, nombre, apellidos, sexo, edad, estatura, peso):
        self.nombre = nombre          # Atributo para el nombre
        self.apellidos = apellidos    # Atributo para los apellidos
        self.sexo = sexo              # Atributo para el sexo
        self.edad = edad              # Atributo para la edad
        self.estatura = estatura      # Atributo para la estatura
        self.peso = peso              # Atributo para el peso

    # Métodos Get
    def get_nombre(self):
        return self.nombre

    def get_apellidos(self):
        return self.apellidos

    def get_sexo(self):
        return self.sexo

    def get_edad(self):
        return self.edad

    def get_estatura(self):
        return self.estatura

    def get_peso(self):
        return self.peso

    # Métodos Set
    def set_nombre(self, nombre):
        self.nombre = nombre

    def set_apellidos(self, apellidos):
        self.apellidos = apellidos

    def set_sexo(self, sexo):
        self.sexo = sexo

    def set_edad(self, edad):
        self.edad = edad

    def set_estatura(self, estatura):
        self.estatura = estatura

    def set_peso(self, peso):
        self.peso = peso

    # Método para mostrar la información de la persona
    def mostrar_informacion(self):
        print(f"Nombre: {self.nombre} {self.apellidos}")
        print(f"Sexo: {self.sexo}")
        print(f"Edad: {self.edad} años")
        print(f"Estatura: {self.estatura} mts")
        print(f"Peso: {self.peso} Kg")
        print("---------------")  # Separador para claridad visual

# Crear objetos de la clase Persona
persona_1 = Persona("Pedro", "Vivas", "Masculino", 20, 1.78, 68)  # Instancia de Persona 1
persona_2 = Persona("Juan", "Camargo", "Masculino", 18, 1.8, 75)  # Instancia de Persona 2

# Mostrar información inicial de las personas
print("Información inicial:")
persona_1.mostrar_informacion()
persona_2.mostrar_informacion()

# Modificar la edad de persona_1 a 21 años
persona_1.set_edad(21)

# Modificar el apellido de persona_2 a Santiago
persona_2.set_apellidos("Santiago")

# Mostrar información actualizada
print("Información actualizada:")
persona_1.mostrar_informacion()
persona_2.mostrar_informacion()
