class Device:
    def __init__(self, **kwargs):
        pass

class Computer:
    def __init__(self, **kwargs):
        pass

class Laptop(Device, Computer):
    def __init__(self, **kwargs):
        Device.__init__(self, **kwargs)
        Computer.__init__(self, **kwargs)


# Crear instancia de Laptop
laptop = Laptop(brand="Dell", cpu="AMD", weight="1.5kg")

# Kwargs Dict { Clave = Valor }

# Args Tuple (1, 2, 3, 4, 5)
