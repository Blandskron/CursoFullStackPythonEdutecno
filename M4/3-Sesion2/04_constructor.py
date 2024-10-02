# Añadir el método constructor __init__
class Vehiculo:
    # El constructor inicializa los atributos del vehículo cuando se crea un objeto
    def __init__(self, modelo, marca, color, nro_puertas, kilometraje):
        self.modelo = modelo
        self.marca = marca
        self.color = color
        self.velocidad = 0  # La velocidad inicial es siempre 0
        self.nro_puertas = nro_puertas
        self.kilometraje = kilometraje
        self.arrancando = False  # El vehículo empieza apagado

# Crear instancias de la clase Vehiculo usando el constructor
obj_carro1 = Vehiculo('Duro', 'Toyota', 'Blanco', 2, 2000)
obj_carro2 = Vehiculo('Uno', 'Fiat', 'Gris', 5, 100000)

# Imprimir los atributos de los vehículos creados
print(f'Carro 1: {obj_carro1.marca}, {obj_carro1.modelo}, {obj_carro1.color}, {obj_carro1.kilometraje} km')
print(f'Carro 2: {obj_carro2.marca}, {obj_carro2.modelo}, {obj_carro2.color}, {obj_carro2.kilometraje} km')
