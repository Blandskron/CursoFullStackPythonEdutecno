"""
Alumnos
1- Lista Inicial (Original)
2- Copia de Lista
3- Interactuar con el usuario
4- Metodos - Eliminar y Agregar
"""

Curso_Python_2024 = [
    "ALDO FREZ",
    "BASTIÁN ARAYA",
    "CAMILA GONZÁLEZ",
    "CHRISTIAN LÓPEZ",
    "DANIEL UGALDE",
    "DANIELA MIRANDA",
    "DIEGO GONZÁLEZ",
    "EDGARD VELÁSQUEZ",
    "ERICK MILLA",
    "FERNANDO QUEZADA",
    "FRANCISCO JIMÉNEZ",
    "GASTÓN IGLESIAS",
    "IGNACIO ARTEAGA",
    "IGNACIO SEPÚLVEDA",
    "MAXIMILIANO LUKSIC",
    "NATALIA MEZA",
    "PERSIDA AGUILERA",
    "RODRIGO PÉNDOLA",
    "RUTH QUILAMÁN",
    "SOLANGE CASTILLO",
    "CARLOS VASQUEZ",
    "CARLOS CÁRDENAS",
    "JUAN BARRIENTOS",
    "ALLAN ACOSTA",
    "FERNANDO DE LA BARRA"
]

def agregar(n, a):
    nombre = n
    apellido = a
    nombreCompleto = nombre + " " + apellido
    Curso_Python_2024v2.append(nombreCompleto)
    print(f"El alumno {nombreCompleto} fue ingresado exitosamente")
    print(Curso_Python_2024v2.index(nombreCompleto))

def eliminar():
    pass


Curso_Python_2024v2 = Curso_Python_2024.copy()
accion = int(input("Que accion desea realizar \n 1-Agregar \n 2-Eliminar \n 3-Editar \n 4-Salir \n"))

if accion == 1:
    name = input("Ingrese nombre alumno: \n ")
    lastName = input("Ingrese apellido alumno: \n ")
    agregar(name, lastName)
elif accion == 2:
    eliminar()
    """
    Solucion 1
    for i, nombre in enumerate(Curso_Python_2024v2, start=1):
        print(i, " ", nombre)
    numero = int(input("Ingrese el numero del alumno en la lista que desea eliminar: "))
    eliminado = Curso_Python_2024v2.pop(numero -1)
    print(f"El alumno eliminado es '{eliminado}' ")

    Solucion 2
    nombre = input("Ingrese el alumno que desea eliminar: ")
    if nombre in Curso_Python_2024v2:
        Curso_Python_2024v2.remove(nombre)
        print(f"Elemento '{nombre}' eliminado de la lista de alumnos.")
    else:
        print(f"El elemento '{nombre}' no se encuentra en la lista de alumnos.")
    """
elif accion == 3:
    #insert
    pass
elif accion == 4:
    pass
else:
    print("Accion no valida")
