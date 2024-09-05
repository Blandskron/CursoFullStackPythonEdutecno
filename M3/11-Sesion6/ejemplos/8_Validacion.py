# Determinar si un estudiante puede participar en una competición dependiendo de su edad y puntaje
edad = 16
puntaje = 85

if edad >= 15:
    if puntaje >= 80:
        print("Puedes participar en la competición.")
    else:
        print("No tienes suficiente puntaje para participar.")
else:
    print("No cumples con la edad mínima para participar.")
