class Cliente():
    def __init__(self, nombre, saldo):
        self.nombre = nombre
        self.saldo = saldo

    def get_saldo(self):
        saldo = self.saldo
        return saldo
    
precio = 50000

def comprar(saldo, precio):
    if saldo < precio:
        raise MyError("Tu compra fue rechazada")
    else:
        print(f"Gracias por tu compra: {saldo - precio}")

juan = Cliente("juan", 2000)

# Definición de una excepción personalizada
class MyError(Exception):
    def __init__(self, value):
        self.value = value

    def __str__(self):
        return repr(self.value)

# Uso de la excepción personalizada
try:
    comprar(juan.saldo, precio)  # Lanzamos la excepción personalizada con el valor 6
except MyError as error:
    print(f"Ocurrió una nueva excepción: {error.value}")
