# Definición de un método en una clase
class Vehiculo:
    ruedas = 4

    def desplazamiento(self):
        print(f"El vehículo se está desplazando sobre {self.ruedas} ruedas.")  # Método que describe el comportamiento del vehículo

class Alumno:
    materias = 5

    def materia(self):
        print(f"El alumno tiene {self.materias} materias.")
        