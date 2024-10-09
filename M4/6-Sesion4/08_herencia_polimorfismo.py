# Definición de la clase base Persona
class Persona:
    def __init__(self, nombre):
        self.nombre = nombre
    
    def movimiento(self):
        return f"{self.nombre} está caminando"

# Definición de la subclase Maratonista que hereda de Persona
class Maratonista(Persona):
    def movimiento(self):
        return f"{self.nombre} está trotando"

# Definición de la subclase Ciclista que hereda de Persona
class Ciclista(Persona):
    def movimiento(self):
        return f"{self.nombre} está rodando"

# Crear instancias de las clases
persona = Persona("Juan")
maratonista = Maratonista("Carlos")
ciclista = Ciclista("Ana")

# Imprimir los estados de movimiento de cada uno
print(persona.movimiento())      # Juan está caminando
print(maratonista.movimiento())  # Carlos está trotando
print(ciclista.movimiento())     # Ana está rodando
