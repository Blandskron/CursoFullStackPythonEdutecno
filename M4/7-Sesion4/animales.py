class Animal:
    def __init__(self, especie, desplazamiento, nacimiento):
        self.especie = especie
        self.desplazamineto = desplazamiento
        self.nacimiento = nacimiento

    def alimentacion():
        pass

class Mamifero(Animal):
    def __init__(self, especie, desplazamiento, nacimiento, amamantan):
        super().__init__(especie, desplazamiento, nacimiento)
        self.amamantan = amamantan

    def alimentacion(self):
        return f"Soy un {self.especie} mi moviemto es {self.desplazamineto} mi naciento es por {self.nacimiento} mi de alimentacion es {self.amamantan}"

class Reptiles(Animal):
    def __init__(self, especie, desplazamiento, nacimiento, exotermia):
        super().__init__(especie, desplazamiento, nacimiento)
        self.exotermia = exotermia

    def alimentacion(self):
        return f"Soy un {self.especie} mi moviemto es {self.desplazamineto} mi naciento es por {self.nacimiento} mi de alimentacion es omnivora, mi caracteristica exclusiva es {self.exotermia}"

class Anfibios(Animal):
    def __init__(self, especie, desplazamiento, nacimiento, metamorfosis):
        super().__init__(especie, desplazamiento, nacimiento)
        self.metamorfosis = metamorfosis

    def alimentacion(self):
        return f"Soy un {self.especie} mi moviemto es {self.desplazamineto} mi naciento es por {self.nacimiento} mi de alimentacion es carnivoro, mi caracteristica especial es {self.metamorfosis}"

class Aves(Animal):
    def __init__(self, especie, desplazamiento, nacimiento, plumaje):
        super().__init__(especie, desplazamiento, nacimiento)
        self.plumaje = plumaje

    def alimentacion(self):
        return f"Soy un {self.especie} mi moviemto es {self.desplazamineto} mi naciento es por {self.nacimiento} mi de alimentacion es omnivoros, mi caracteristica especial es {self.plumaje}"

class Peces(Animal):
    def __init__(self, especie, desplazamiento, nacimiento, branquias):
        super().__init__(especie, desplazamiento, nacimiento)
        self.branquias = branquias

    def alimentacion(self):
        return f"Soy un {self.especie} mi moviemto es {self.desplazamineto} mi naciento es por {self.nacimiento} mi de alimentacion es omnivoros, mi caracteristica especial es {self.branquias}"

leon = Mamifero("felino", "caminar en 4 patas", "crias vivas", "lactar")
cocodrilo = Reptiles("reptil", "caminar y nadar", "huevos", "la exotermina")
rana = Anfibios("ranidae", "saltar y nadar", "huevos", "de piriguin a rana")
pelicano = Aves("ave", "vuela", "huevos", "plumas")
pez_payaso = Peces("peces", "nada", "huevos", "tengo branquias")

def alimentar(animal):
    print(animal.alimentacion())

animales = [leon, cocodrilo, rana, pelicano, pez_payaso]

for animal in animales:
    print("Animal")
    alimentar(animal)
