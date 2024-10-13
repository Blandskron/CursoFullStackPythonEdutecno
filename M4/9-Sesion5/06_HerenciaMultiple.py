class Device:
    def __init__(self, **kwargs):
        self.brand = kwargs.get('brand', 'Unknown')
        print(f'Dispositivo: Marca: {self.brand}')

class Computer:
    def __init__(self, **kwargs):
        self.cpu = kwargs.get('cpu', 'Intel')
        print(f'Computadora: CPU: {self.cpu}')

class Laptop(Device, Computer):
    def __init__(self, **kwargs):
        Device.__init__(self, **kwargs)
        Computer.__init__(self, **kwargs)
        self.weight = kwargs.get('weight', '2kg')
        print(f'Laptop: Peso: {self.weight}')

# Crear instancia de Laptop
laptop = Laptop(brand="Dell", cpu="AMD", weight="1.5kg")
