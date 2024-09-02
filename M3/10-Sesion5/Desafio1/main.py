def operadores_logicos(a, b):
    print(f"Operadores lógicos para {a} y {b}:")
    print(f"{a} and {b}: {a and b}")
    print(f"{a} or {b}: {a or b}")
    print(f"not {a}: {not a}")
    print("-" * 40)

def operadores_comparacion(x, y):
    print(f"Operadores de comparación para {x} y {y}:")
    print(f"{x} > {y}: {x > y}")
    print(f"{x} < {y}: {x < y}")
    print(f"{x} == {y}: {x == y}")
    print(f"{x} != {y}: {x != y}")
    print(f"{x} >= {y}: {x >= y}")
    print(f"{x} <= {y}: {x <= y}")
    print("-" * 40)

def comparaciones_entre_tipos(a, b):
    print(f"Comparando tipos entre {a} y {b}:")
    print(f"Tipo de {a}: {type(a)}")
    print(f"Tipo de {b}: {type(b)}")
    print(f"Son del mismo tipo: {type(a) == type(b)}")
    print("-" * 40)

def conversiones_implicitas():
    a = 1
    b = 2.5
    print("Antes de la conversión implícita:")
    print(f"Tipo de a: {type(a)}, Tipo de b: {type(b)}")
    
    a = a + b  # Conversión implícita de entero a flotante
    
    print("Después de la conversión implícita:")
    print(f"Tipo de a: {type(a)}")  # Ahora a es de tipo float
    print("-" * 40)

def manipular_objetos():
    nombre = "Bastian"
    edad = 17
    print(f"Hola, me llamo {nombre} y tengo {edad} años.")
    
    edad = 20  # Modificando la variable
    print(f"Ahora tengo {edad} años.")
    print("-" * 40)

def ejemplo_if_else(num):
    if num > 0:
        print(f"{num} es un número positivo.")
    elif num == 0:
        print(f"{num} es cero.")
    else:
        print(f"{num} es un número negativo.")
    print("-" * 40)

def ejemplo_for_else(lista):
    for elemento in lista:
        print(f"Elemento: {elemento}")
    else:
        print("No quedan elementos en la lista.")
    print("-" * 40)

def ejemplo_while(num):
    while num > 0:
        print(f"Contando: {num}")
        num -= 1
    print("Fin del bucle while.")
    print("-" * 40)

def ejemplo_break_continue():
    for i in range(10):
        if i == 5:
            print("Se encontró el número 5, usando break.")
            break
        if i % 2 == 0:
            continue  # Saltar los números pares
        print(f"Número impar: {i}")
    print("-" * 40)

def main():
    # Operadores
    operadores_logicos(True, False)
    operadores_comparacion(10, 20)
    comparaciones_entre_tipos(10, 10.5)
    
    # Conversiones implícitas
    conversiones_implicitas()
    
    # Manipular variables y atributos
    manipular_objetos()
    
    # Control de flujo
    ejemplo_if_else(-5)
    ejemplo_for_else([1, 2, 3])
    ejemplo_while(3)
    ejemplo_break_continue()

if __name__ == "__main__":
    main()
