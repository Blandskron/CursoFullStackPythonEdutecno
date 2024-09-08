numero_secreto = 7
adivinanza = int(input("Adivina el número (1-10): "))
while adivinanza != numero_secreto:
    adivinanza = int(input("Inténtalo de nuevo: "))
print("¡Correcto!")
