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

# Usamos la misma función para mover diferentes tipos de vehículos
mover_vehiculo(coche)   # El coche está conduciendo
mover_vehiculo(moto)    # La moto está acelerando
mover_vehiculo(autobus) # El autobús está en marcha
