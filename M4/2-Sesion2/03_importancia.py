# La POO permite crear código reutilizable y organizado.
# Aquí demostramos cómo se reutiliza el método descripcion en varios objetos.

class Vehiculo:
    # Constructor que inicializa los atributos del vehículo
    def __init__(self, marca, modelo):
        self.marca = marca  # Atributo marca del vehículo
        self.modelo = modelo  # Atributo modelo del vehículo
    
    # Método que describe el vehículo
    def descripcion(self):
        return f"Vehículo: {self.marca} {self.modelo}"

# Creación de dos objetos Vehiculo
vehiculo1 = Vehiculo("Toyota", "Corolla")
vehiculo2 = Vehiculo("Ford", "Fiesta")

# Uso del mismo método en diferentes instancias
print(vehiculo1.descripcion())  # Reutilización del método
print(vehiculo2.descripcion())
