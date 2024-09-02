# Uso de break
for num in range(1, 10):
    if num == 5:
        break
    print(num)  # Imprimirá números del 1 al 4

print("Break terminado")

# Uso de continue
for num in range(1, 10):
    if num == 5:
        continue
    print(num)  # Saltará el número 5
