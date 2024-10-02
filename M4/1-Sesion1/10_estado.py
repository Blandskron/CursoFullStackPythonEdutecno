# Los métodos son las funciones definidas dentro de una clase que permiten realizar acciones con los objetos.

class Animal:
    # Método que define el comportamiento del objeto al hablar
    def hablar(self):
        return "El animal hace un sonido"

# El comportamiento de un objeto está determinado por lo que los métodos permiten que el objeto haga.
# En este caso, el método hablar define el comportamiento del objeto Animal.

perro = Animal()
print(perro.hablar())  # El objeto perro puede hacer el comportamiento definido en el método hablar

# El método es una función definida en la clase.
# El comportamiento es lo que ocurre cuando el método se ejecuta.

# Método
class Animal:
    def hablar(self):
        return "El animal hace un sonido"  # Comportamiento
