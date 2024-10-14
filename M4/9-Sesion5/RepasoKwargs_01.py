class Vehicle:
    def __init__(self, **kwargs):
        self.brand = kwargs.get('brand', 'Unknown')
        self.model = kwargs.get('model', 'Unknown')
        print(f'Vehículo: Marca: {self.brand}, Modelo: {self.model}')

class Car(Vehicle):
    def __init__(self, **kwargs):
        super().__init__(**kwargs)  # Pasa los kwargs a la clase base
        self.doors = kwargs.get('doors', 4)
        print(f'Coche: {self.brand}, {self.model}, Puertas: {self.doors}')

# Crear instancia de Car
coche = Car(brand="Toyota", model="Corolla")
