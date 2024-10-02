# La Orientación a Objetos (POO) es un paradigma de programación que organiza el código
# en torno a objetos, que contienen datos y comportamiento.
# Un objeto es una instancia de una clase que agrupa datos (atributos) y funcionalidades (métodos).

class Ejemplo:
    # Constructor de la clase que inicializa un atributo
    def __init__(self, valor):
        self.valor = valor  # Atributo del objeto
    
    # Método que muestra el valor del atributo
    def mostrar_valor(self):
        print(f"El valor es: {self.valor}")

# Creación de un objeto o instancia de la clase Ejemplo
objeto = Ejemplo(10)
objeto.mostrar_valor()  # Llamada al método del objeto
