import random

# Lista de nombres proporcionada
nombres = [
    "ALDO ROBERTO FREZ VÁSQUEZ",
    "BASTIÁN FERNANDO ARAYA CHACÓN",
    "CHRISTIAN ANTONIO LÓPEZ FERNÁNDEZ",
    "DANIEL BERNARDO UGALDE MUÑOZ",
    "DANIELA CONSTANZA MIRANDA MARTÍNEZ",
    "DIEGO IGNACIO GONZÁLEZ BAEZA",
    "ERICK GUSTAVO MILLA CARRIZO",
    "FERNANDO ANDRÉS QUEZADA PUÑO",
    "FRANCISCO ANDRÉS JIMÉNEZ ALCÁNTARA",
    "GASTÓN GUILLERMO IGLESIAS ROJAS",
    "IGNACIO ANDRÉS SEPÚLVEDA CHACANA",
    "MAXIMILIANO FRANCISCO LUKSIC ROSALES",
    "NATALIA PAZ MEZA RAMOS",
    "PERSIDA FEBE AGUILERA GATICA",
    "RODRIGO ESTEBAN PÉNDOLA CORTEZ",
    "CARLOS ENRIQUE VASQUEZ COLIMILLA",
    "FERNANDO DE LA BARRA",
    "HECTOR VARGAS",
    "LUIS ABARCA",
    "MATIAS BUSTOS",
    "VICTOR ACUÑA",
    "DAMIAN SASIA"
]

# Selección aleatoria de 3 personas
seleccionados = random.sample(nombres, 3)

# Asignación de roles
actor_principal = seleccionados[0]
aportadores_ideas = seleccionados[1:]

# Resultados
print(actor_principal, aportadores_ideas)
