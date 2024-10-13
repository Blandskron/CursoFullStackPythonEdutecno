# Definimos una clase básica llamada Persona
class Persona:
    def __init__(self, nombre, edad):
        self.nombre = nombre  # Atributo nombre
        self.edad = edad  # Atributo edad

    # Método para presentar a la persona
    def presentarse(self):
        return f"Hola, soy {self.nombre} y tengo {self.edad} años."

# Definimos una función para sumar dos números
def sumar(a, b):
    return a + b

# Definimos una función que usa un diccionario para almacenar información
def manejar_diccionario():
    # Diccionario con información de un producto
    producto = {
        "nombre": "Laptop",
        "precio": 800,
        "stock": 10
    }
    
    # Accedemos a elementos del diccionario
    print(f"Producto: {producto['nombre']}, Precio: {producto['precio']}")
    
    # Modificamos el stock
    producto['stock'] -= 1  # Se vendió una unidad
    print(f"Stock actual: {producto['stock']}")

# Definimos una función que utiliza listas
def manejar_lista():
    # Lista de frutas
    frutas = ["manzana", "banana", "cereza", "durazno"]

    # Iteramos sobre la lista con un for
    for fruta in frutas:
        print(f"Fruta: {fruta}")

    # Añadimos una nueva fruta
    frutas.append("pera")
    print(f"Lista de frutas actualizada: {frutas}")

# Definimos una función que maneja conjuntos y tuplas
def manejar_conjunto_tupla():
    # Tupla con algunos números
    numeros_tupla = (1, 2, 3, 4, 5)

    # Conjunto con algunos números (no permite duplicados)
    numeros_conjunto = {1, 2, 3, 4, 4, 5, 6}

    # Accediendo a elementos de la tupla
    print(f"Primer número de la tupla: {numeros_tupla[0]}")

    # Verificamos si un número está en el conjunto
    if 3 in numeros_conjunto:
        print("El número 3 está en el conjunto.")
    else:
        print("El número 3 no está en el conjunto.")
    
    # Mostramos el conjunto (se eliminan duplicados automáticamente)
    print(f"Números en el conjunto: {numeros_conjunto}")

# Definimos una función que utiliza un bucle while y maneja excepciones
def manejar_while_try():
    contador = 5

    while contador > 0:
        try:
            # Intentamos dividir por un número ingresado por el usuario
            numero = int(input(f"Ingrese un número (quedan {contador} intentos): "))
            resultado = 10 / numero
            print(f"Resultado de 10 dividido por {numero} es {resultado}")
        except ZeroDivisionError:
            print("Error: No se puede dividir por cero.")
        except ValueError:
            print("Error: Debe ingresar un número entero.")
        finally:
            contador -= 1  # Restamos un intento

# Función principal que ejecuta todo el código
def main():
    # Creamos una instancia de la clase Persona
    persona1 = Persona("Carlos", 30)
    print(persona1.presentarse())

    # Usamos la función sumar
    suma = sumar(5, 7)
    print(f"Suma de 5 y 7 es: {suma}")

    # Llamamos a la función que maneja un diccionario
    manejar_diccionario()

    # Llamamos a la función que maneja una lista
    manejar_lista()

    # Llamamos a la función que maneja conjuntos y tuplas
    manejar_conjunto_tupla()

    # Llamamos a la función que utiliza un bucle while y try/except
    manejar_while_try()

# Llamamos a la función principal
if __name__ == "__main__":
    main()
