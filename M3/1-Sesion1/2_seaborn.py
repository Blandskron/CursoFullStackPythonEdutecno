import seaborn as sns
import matplotlib.pyplot as plt
import pandas as pd

# Crear un DataFrame con datos de ejemplo
data = pd.DataFrame({
    'X': [1, 2, 3, 4, 5],
    'Y': [2, 3, 5, 7, 11]
})

# Crear gráfico de dispersión
sns.scatterplot(data=data, x='X', y='Y')

# Etiquetas y título
plt.xlabel('X')
plt.ylabel('Y')
plt.title('Gráfico de Dispersión con Seaborn')

# Mostrar gráfico
plt.show()
