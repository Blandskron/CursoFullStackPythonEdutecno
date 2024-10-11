# Clase base
class Animal:
    def sonido(self):
        print("Sonido de animal")

# Subclase que sobrescribe el método sonido
class Perro(Animal):
    def sonido(self):
        print("Guau guau")

# Instancia de Perro
mi_perro = Perro()
mi_perro.sonido()  # Esto llamará al método sobrescrito en la clase Perro