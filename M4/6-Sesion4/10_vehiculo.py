# Clase base Vehiculo
class Vehiculo:
    def __init__(self, marca, modelo):
        self.marca = marca
        self.modelo = modelo
    
    def obtener_datos(self):
        return f"Marca: {self.marca}, Modelo: {self.modelo}"

# Subclase Coche que hereda de Vehiculo
class Coche(Vehiculo):
    def __init__(self, marca, modelo, puertas):
        super().__init__(marca, modelo)
        self.puertas = puertas
    
    def obtener_datos(self):
        datos_vehiculo = super().obtener_datos()
        return f"{datos_vehiculo}, Puertas: {self.puertas}"

# Subclase Bicicleta que hereda de Vehiculo
class Bicicleta(Vehiculo):
    def __init__(self, marca, modelo, tipo):
        super().__init__(marca, modelo)
        self.tipo = tipo
    
    def obtener_datos(self):
        datos_vehiculo = super().obtener_datos()
        return f"{datos_vehiculo}, Tipo: {self.tipo}"

# Ejemplo de uso
coche = Coche("Toyota", "Corolla", 4)
bicicleta = Bicicleta("Giant", "Escape", "Híbrida")

print(coche.obtener_datos())
print(bicicleta.obtener_datos())
