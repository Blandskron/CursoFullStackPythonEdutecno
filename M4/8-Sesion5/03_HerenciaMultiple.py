# Clases base
class Volador:
    def volar(self):
        print("Este vehículo puede volar.")

class Conductor:
    def conducir(self):
        print("Este vehículo puede conducir.")

# Clase que hereda de ambas clases base
class VehiculoAutonomo(Volador, Conductor):
    def mostrar_habilidades(self):
        self.volar()
        self.conducir()

vehiculo = VehiculoAutonomo()
vehiculo.mostrar_habilidades()