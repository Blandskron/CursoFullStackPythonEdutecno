class Perro:
    def __init__(self, nombre, edad):
        self.nombre = nombre
        self.edad = edad

    def ladrar(self):
        return f"{self.nombre} dice: ¡Guau!"

# Crear un objeto
mi_perro = Perro("Rex", 5)
print(mi_perro.ladrar())  # Rex dice: ¡Guau!

# Manipular un atributo
mi_perro.edad = 6
print(f"{mi_perro.nombre} tiene {mi_perro.edad} años.")  # Rex tiene 6 años.
