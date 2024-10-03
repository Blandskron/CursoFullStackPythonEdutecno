# Definimos la clase Animal que representa las características y comportamientos comunes a todos los animales.
class Animal:
    # Constructor de la clase que inicializa los atributos de un animal
    def __init__(self, nombre, raza, edad, peso):
        self.nombre = nombre  # Atributo: nombre del animal
        self.raza = raza      # Atributo: raza del animal
        self.edad = edad      # Atributo: edad del animal
        self.peso = peso      # Atributo: peso del animal
    
    # Método que simula el comportamiento de comer
    def comer(self):
        print(f"{self.nombre} está comiendo.")
    
    # Método que simula el comportamiento de caminar
    def caminar(self):
        print(f"{self.nombre} está caminando.")
    
    # Método que simula el comportamiento de dormir
    def dormir(self):
        print(f"{self.nombre} está durmiendo.")

# Creamos dos objetos (instancias) de la clase Animal: un perro y un gato.

# Instancia del perro
perro = Animal(nombre="Brando", raza="San Bernardo", edad=3, peso=30)

# Instancia del gato
gato = Animal(nombre="Roll", raza="Persa", edad=4, peso=3)

# Usamos los métodos de cada objeto
perro.comer()   # Llamamos al método comer para el perro
perro.caminar() # Llamamos al método caminar para el perro
perro.dormir()  # Llamamos al método dormir para el perro

gato.comer()    # Llamamos al método comer para el gato
gato.caminar()  # Llamamos al método caminar para el gato
gato.dormir()   # Llamamos al método dormir para el gato
