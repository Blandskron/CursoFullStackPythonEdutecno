from matematica.suma import suma
from matematica.resta import resta
from matematica.multiplicacion import multiplicacion
from matematica.divison import division, entera, modulo
from matematica.potencia import potencia

print("Calculadora Básica")
usuario = int(input("Seleccione una opcion\n 1-Suma\n 2-resta\n 3-multiplicacion\n 4-divisiones\n 5-potencia: "))

if usuario == 1:
    a = float(input("Ingresa el primer número: "))
    b = float(input("Ingresa el segundo número: "))
    print(suma(a, b))
elif usuario == 2:
    a = float(input("Ingresa el número a restar: "))
    b = float(input("Ingresa el número que se restará: "))
    print(resta(a, b))
elif usuario == 3:
    a = float(input("Ingresa el primer número: "))
    b = float(input("Ingresa el segundo número: "))
    print(multiplicacion(a, b))
elif usuario == 4:
    tipoDivision = input("Seleccione una opcion\n 1-division\n 2-entera\n 3-modulo: ")
    if tipoDivision.lower() == "division":
        a = float(input("Ingresa el dividendo: "))
        b = float(input("Ingresa el divisor: "))
        print(division(a, b))
    elif tipoDivision.lower() == "entera":
        a = float(input("Ingresa el dividendo: "))
        b = float(input("Ingresa el divisor: "))
        print(entera(a, b))
    elif tipoDivision.lower() == "modulo":
        a = float(input("Ingresa el dividendo: "))
        b = float(input("Ingresa el divisor: "))
        print(modulo(a, b))
    else:
        print("Opción no válida")
elif usuario == 5:
    a = float(input("Ingresa el base: "))
    b = float(input("Ingresa el exponente: "))
    print(potencia(a, b))
else:
    print("Opción no válida")

