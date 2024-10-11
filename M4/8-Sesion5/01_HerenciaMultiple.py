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