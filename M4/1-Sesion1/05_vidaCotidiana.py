# La POO se puede aplicar a la vida cotidiana. Por ejemplo, podemos representar un coche.
# Un coche tiene atributos como marca y modelo, y métodos como arrancar.

class Vehiculo:
    # Constructor que inicializa los atributos de un vehículo
    def __init__(self, marca, modelo):
        self.marca = marca  # Atributo marca
        self.modelo = modelo  # Atributo modelo
    
    # Método que simula el arranque del vehículo
    def arrancar(self):
        print(f"El {self.marca} {self.modelo} está arrancando.")

# Creación de un objeto Vehiculo
mi_coche = Vehiculo("Tesla", "Model S")
mi_coche.arrancar()  # Llamada al método del objeto
