# Clases base
class Computadora:
    def ejecutar_programa(self):
        print("Ejecutando programa.")

class TelefonoInteligente:
    def hacer_llamada(self):
        print("Haciendo una llamada.")

# Clase que hereda de ambas
class DispositivoInteligente(Computadora, TelefonoInteligente):
    def funciones(self):
        self.ejecutar_programa()
        self.hacer_llamada()

disp = DispositivoInteligente()
disp.funciones()
