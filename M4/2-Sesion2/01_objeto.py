"""
clase y nombre
class Silla:
    definir los atributos que tiene una silla
    def __init__(self, nombre, patas, respaldo, color, material, reposabrazo):
        self.nombre = nombre
        self.patas = patas
        self.respaldo = respaldo
        self.color = color
        self.material = material
        self.reposabrazo = reposabrazo

creamos diferentes tipos de sillas
silla_playa = Silla("playa", 2, "inclinada", "multicolor", "fierro y tela", "No")
silla_reposera = Silla("reposera", 2, "recto", "cafe", "madera", "si")
silla_mecedora = Silla("mecedora", 4, "acolchado", "cafe Madera", "madera y mimbre", "si")
silla_oficina = Silla("oficina", 1, "reclinable", "negro", "plastico", "si")
silla_ergonomica = Silla("ergonomica", 1, "curvo", "negro", "plastico", "si")
silla_gamer = Silla("gamer", 8, "ajustable", "rojinegro", "cuerina", "si")
imprimimos las sillas que creamos
print(f"La silla se llama {silla_playa.nombre} y tiene {silla_playa.patas}")
"""
# Creacion de la clase silla
class Silla:
    # la definicion de los atributos que tiene una silla
    def __init__(self, nombre, patas, respaldo, color, material, reposabrazo, stock):
        self.nombre = nombre
        self.patas = patas
        self.respaldo = respaldo
        self.color = color
        self.material = material
        self.reposabrazo = reposabrazo
        self.stock = stock

    # getter and setter
    # obtener y modificar
    def modificar_stock(self, stock):
       self.stock = stock

silla1 = Silla("gamer", 5, "si", "negro", "material", "si", 10)
silla1.modificar_stock(-1)
# comenzamos a interactuar con el usuario para que cree una cantidad diferente de sillas
contador = int(input("Ingrese el numero de sillas que desea crear: "))
# le asignamos una numeracion a cada silla creada
numero = 0
# simulamos la creacion de una base de datos donde guardamos cada silla creada
lista_sillas = []
# solicitamos la informacion de cada silla solicitada por el usuario ejemplo el ciclo while
# se repetira la cantidad de veces que el usuario necesite
while contador > 0:
  # manejamos el breack del cilco while
  contador -= 1
  # enumerando cada silla creada
  numero += 1
  # asignando el numero por silla
  print(f"Silla creada {numero}")
  # dando los atributos a las sillas que estamos creando
  nombre = input("Ingrese el nombre de la silla: ")
  patas = int(input("Ingrese el numero de patas de la silla: "))
  respaldo = input("Ingrese si la silla tiene respaldo: ")
  color = input("Ingrese el color de la silla: ")
  material = input("Ingrese el material de la silla: ")
  reposabrazo = input("Ingrese si la silla tiene reposabrazo: ")
  # creando las sillas
  silla = Silla(nombre, patas, respaldo, color, material, reposabrazo)
  # Guardando las sillas en unas base de datos de ejemplo
  lista_sillas.append(silla)

# imprimiendo todas las sillas existentes en la base de datos
for silla in lista_sillas:
  print(f"Nombre: {silla.nombre}, Patas: {silla.patas}, Respaldo: {silla.respaldo}, Color: {silla.color}, Material: {silla.material}, Material: {silla.reposabrazo}")


# Creacion de la clase silla
class Silla:
    # la definicion de los atributos que tiene una silla
    def __init__(self, nombre, patas, respaldo, color, material, reposabrazo, stock):
        self.nombre = nombre
        self.patas = patas
        self.respaldo = respaldo
        self.color = color
        self.material = material
        self.reposabrazo = reposabrazo
        self.stock = stock

    # getter and setter
    # obtener
    def get_stock(self):
        return self.stock
    
    # modificar
    def modificar_stock(self, stock):
       self.stock = stock
       print(f"El stock de la silla {self.nombre} ha sido modificado a {self.stock}")

silla1 = Silla("gamer", 5, "si", "negro", "material", "si", 10)
silla1.get_stock()
silla1.modificar_stock(9)
silla1.get_stock()
silla1.modificar_stock(8)
silla1.get_stock()
silla1.modificar_stock(7)
