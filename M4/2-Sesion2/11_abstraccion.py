# La abstracción permite centrarse en los detalles esenciales y ocultar los irrelevantes.
# El encapsulamiento oculta los detalles internos de un objeto, protegiendo los datos.

class Banco:
    # Encapsulamiento: El atributo __saldo es privado
    def __init__(self):
        self.__saldo = 0  # Atributo privado
    
    # Método para depositar dinero
    def depositar(self, monto):
        self.__saldo += monto
    
    # Método para ver el saldo, que muestra el estado actual del objeto
    def ver_saldo(self):
        return self.__saldo

# Creación de una cuenta de banco y acceso controlado al saldo (encapsulación)
cuenta = Banco()
cuenta.depositar(100)  # Depositar dinero
print(cuenta.ver_saldo())  # Mostrar el saldo sin acceso directo al atributo __saldo
