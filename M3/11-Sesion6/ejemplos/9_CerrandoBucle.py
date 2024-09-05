# Usando break para detener un bucle cuando se encuentra un número específico
for i in range(10):
    if i == 7:
        print("Número encontrado, deteniendo el bucle.")
        break
    print(i)
