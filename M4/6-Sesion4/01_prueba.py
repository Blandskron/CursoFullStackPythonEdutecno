# Superclase común
class Vehiculo:
    def mover(self):
        pass  # Este método será sobrescrito por las subclases

# Subclases con diferentes implementaciones del método mover
class Coche(Vehiculo):
    def mover(self):
        print("El coche está conduciendo")

class Moto(Vehiculo):
    def mover(self):
        print("La moto está acelerando")

class Autobus(Vehiculo):
    def mover(self):
        print("El autobús está en marcha")

# Uso del polimorfismo
def mover_vehiculo(vehiculo):
    vehiculo.mover()

# Creación de objetos
coche = Coche()
moto = Moto()
autobus = Autobus()

# Diccionario de vehículos disponibles
vehiculos = {
    'coche': coche,
    'moto': moto,
    'autobus': autobus
}

# Preguntamos al usuario qué vehículo desea mover
pregunta = input("¿Qué vehículo quiere mover (coche, moto, autobus)?: ")

# Verificamos si el nombre ingresado existe en el diccionario
if pregunta in vehiculos:
    vehiculo = vehiculos[pregunta]  # Accedemos al vehículo correspondiente
    mover_vehiculo(vehiculo)
else:
    print("Vehículo no reconocido.")
