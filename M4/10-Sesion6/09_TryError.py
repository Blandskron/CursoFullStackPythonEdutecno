def excepciones_comunes():
    # ZeroDivisionError: Intentar dividir por cero
    try:
        print(1 / 0)
    except ZeroDivisionError:
        print("Error: No se puede dividir por cero.")

    # IndexError: Intentar acceder a un índice que no existe en una lista
    try:
        lista = [1, 2, 3]
        print(lista[5])
    except IndexError:
        print("Error: Índice fuera de rango.")

    # KeyError: Intentar acceder a una clave que no existe en un diccionario
    try:
        diccionario = {'nombre': 'Python'}
        print(diccionario['edad'])
    except KeyError:
        print("Error: La clave no existe en el diccionario.")

    # FileNotFoundError: Intentar abrir un archivo que no existe
    try:
        with open("archivo_que_no_existe.txt", "r") as file:
            contenido = file.read()
    except FileNotFoundError:
        print("Error: El archivo no existe.")

    # ValueError: Intentar convertir un tipo incorrecto
    try:
        numero = int("no es un número")
    except ValueError:
        print("Error: Valor no puede ser convertido a un número.")

    # TypeError: Operación inválida entre tipos
    try:
        resultado = "2" + 2
    except TypeError:
        print("Error: No se puede sumar una cadena con un número.")

    # AttributeError: Intentar acceder a un atributo que no existe
    try:
        texto = "Hola"
        print(texto.no_existe)
    except AttributeError:
        print("Error: El objeto no tiene ese atributo.")

    # ImportError: Intentar importar un módulo que no existe
    try:
        import modulo_inexistente
    except ImportError:
        print("Error: El módulo no existe.")

    # NameError: Intentar usar una variable que no ha sido definida
    try:
        print(variable_inexistente)
    except NameError:
        print("Error: Variable no definida.")

    # OverflowError: Intentar realizar un cálculo que excede el límite
    try:
        import math
        print(math.exp(1000))  # Excede el límite de representación de float
    except OverflowError:
        print("Error: Cálculo excede el límite permitido.")

    # IOError (OSError en Python 3): Error al realizar una operación de entrada/salida
    try:
        with open("/ruta/archivo_inexistente.txt", "r") as file:
            contenido = file.read()
    except OSError:
        print("Error: Problema con el archivo o ruta.")

    # RuntimeError: Error general que ocurre en tiempo de ejecución
    try:
        raise RuntimeError("Este es un error en tiempo de ejecución.")
    except RuntimeError as e:
        print(f"Error: {e}")

    # RecursionError: Exceso de recursión
    try:
        def recursiva():
            return recursiva()
        recursiva()
    except RecursionError:
        print("Error: Exceso de recursión.")

    # AssertionError: Fallo en una afirmación
    try:
        assert 1 == 2, "Uno no es igual a dos"
    except AssertionError as e:
        print(f"Error: {e}")

    # KeyboardInterrupt: Captura cuando se interrumpe el programa manualmente
    try:
        while True:
            pass  # Bucle infinito
    except KeyboardInterrupt:
        print("Error: Interrupción manual del programa (Ctrl+C).")

    # Exception: Captura cualquier otra excepción genérica
    try:
        raise Exception("Excepción genérica.")
    except Exception as e:
        print(f"Error: {e}")

# Llamar a la función que demuestra las excepciones comunes
excepciones_comunes()
