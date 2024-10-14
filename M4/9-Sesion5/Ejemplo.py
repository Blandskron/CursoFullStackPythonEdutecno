# Clase base
class Cliente:
    pass

# Subclases de Cliente
class Basico():
    pass

class Platinium(Cliente):
    def descuento5(self, totalCompra):
        self.descuento = totalCompra - 50000
        print(f"Tiene un 5% de descuento en el total de su compra {self.descuento}")

class Premium(Cliente):
    pass

# Verificar instancias
cliente1 = Basico()
cliente2 = Platinium()
cliente3 = Premium()
totalCompra = int(input("Ingresa el total de la compra: "))

print("Es CLiente:")
print(isinstance(cliente3, Cliente))  # True
print("Es un comprador Basico:")
print(isinstance(cliente3, Basico))  # True
print("Es un Cliente Platinium:")
print(isinstance(cliente3, Platinium)) # True
print("Es un CLiente Premium")
print(isinstance(cliente3, Premium)) # False

if isinstance(cliente2, Platinium) == True:
    cliente2.descuento5(totalCompra)
else:
    print("Es otro tipo de cliente")
