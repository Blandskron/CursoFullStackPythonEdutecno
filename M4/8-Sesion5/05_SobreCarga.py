class Calculadora:
    def suma(self, a, b, c=0):
        return a + b + c

calc = Calculadora()
# Uso de dos argumentos
print(calc.suma(1, 2))  # 3
# Uso de tres argumentos
print(calc.suma(1, 2, 3))  # 6
