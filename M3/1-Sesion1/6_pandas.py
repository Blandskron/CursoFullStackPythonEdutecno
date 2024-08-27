import pandas as pd

# Crear un DataFrame
data = pd.DataFrame({
    'Nombre': ['Ana', 'Luis', 'Pedro'],
    'Edad': [23, 30, 25],
    'Ciudad': ['Santiago', 'Valparaíso', 'Antofagasta']
})

# Mostrar el DataFrame
print("DataFrame original:")
print(data)

# Filtrar datos
filtered_data = data[data['Edad'] > 25]
print("\nDatos filtrados (Edad > 25):")
print(filtered_data)
