# Un objeto es una instancia de una clase. Es una representación concreta que tiene un estado (valores de sus atributos) y comportamiento (métodos).

class Ejemplo:
    # Constructor que inicializa un atributo del objeto
    def __init__(self, valor):
        self.valor = valor  # Atributo valor del objeto

# Creación de un objeto (instancia de la clase Ejemplo)
objeto = Ejemplo(10)
