# Ingredientes para hacer sándwiches
ingredientes = ["pan", "jamón", "queso", "mayonesa"]

# Hacer el mismo sándwich 5 veces
for i in range(5):
    print(f"Sándwich {i + 1}:")
    for ingrediente in ingredientes:
        print(f"Agregar {ingrediente}")
    print("Cerrar sándwich\n")
