usuario = input("Ingresa tu nombre de usuario: ")
if usuario.lower() == "admin":
    print("Acceso concedido. ¡Hola Admin!")
else:
    print(f"Acceso denegado. ¡Hola, {usuario}!")
