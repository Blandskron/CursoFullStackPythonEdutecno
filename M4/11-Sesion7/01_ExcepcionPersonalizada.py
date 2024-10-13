# Definición de una excepción personalizada
class MyError(Exception):
    def __init__(self, value):
        self.value = value

    def __str__(self):
        return repr(self.value)

# Uso de la excepción personalizada
try:
    raise MyError(3 * 2)  # Lanzamos la excepción personalizada con el valor 6
except MyError as error:
    print(f"Ocurrió una nueva excepción: {error.value}")
