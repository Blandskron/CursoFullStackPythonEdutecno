# Definición de las clases base
class Clase1:
    def saludo(self):
        print("Hola desde Clase1")

class Clase2:
    def despedida(self):
        print("Adiós desde Clase2")

# Clase que hereda de Clase1 y Clase2
class Clase3(Clase1, Clase2):
    pass

# Crear una instancia de Clase3
objeto = Clase3()
objeto.saludo()    # Llama al método de Clase1
objeto.despedida() # Llama al método de Clase2

class ClaseA:
    def __init__(self, atributo_a):
        self.atributo_a = atributo_a

class ClaseB:
    def __init__(self, atributo_b):
        self.atributo_b = atributo_b

class ClaseHija(ClaseA, ClaseB):
    def __init__(self, atributo_a, atributo_b):
        ClaseA.__init__(self, atributo_a)
        ClaseB.__init__(self, atributo_b)

# Creando un objeto de la clase hija
objeto_hija = ClaseHija("valor_a", "valor_b")

print(objeto_hija.atributo_a)  # Imprime: valor_a
print(objeto_hija.atributo_b)  # Imprime: valor_b

class ClaseC:
    def __init__(self, atributo_c, *args, **kwargs):
        super().__init__(*args, **kwargs)  # Llama al siguiente en el MRO
        self.atributo_c = atributo_c

class ClaseD:
    def __init__(self, atributo_d, *args, **kwargs):
        super().__init__(*args, **kwargs)  # Llama al siguiente en el MRO
        self.atributo_d = atributo_d

class ClaseHijo(ClaseC, ClaseD):
    def __init__(self, atributo_c, atributo_d):
        # Llama a ambos constructores utilizando super() que sigue el MRO
        super().__init__(atributo_c, atributo_d)

# Creando un objeto de ClaseHijo
objeto_hijo = ClaseHijo("valor_c", "valor_d")

print(objeto_hijo.atributo_c)  # Imprime: valor_c
print(objeto_hijo.atributo_d)  # Imprime: valor_d
