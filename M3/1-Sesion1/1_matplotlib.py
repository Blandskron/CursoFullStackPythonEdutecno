import matplotlib.pyplot as plt

# Datos para el gráfico
x = [1, 2, 3, 4, 5]
y = [2, 3, 5, 7, 11]

# Crear gráfico de línea
plt.plot(x, y, marker='o')

# Etiquetas y título
plt.xlabel('X')
plt.ylabel('Y')
plt.title('Gráfico de Línea con Matplotlib')

# Mostrar gráfico
plt.show()
