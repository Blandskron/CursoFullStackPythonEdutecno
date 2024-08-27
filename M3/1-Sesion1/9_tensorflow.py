import tensorflow as tf
from tensorflow.keras.models import Sequential
from tensorflow.keras.layers import Dense
import numpy as np

# Generar datos de ejemplo
X = np.random.rand(1000, 1)
y = X * 2 + 1

# Crear el modelo
model = Sequential([
    Dense(10, activation='relu', input_shape=(1,)),
    Dense(1)
])

# Compilar el modelo
model.compile(optimizer='adam', loss='mean_squared_error')

# Entrenar el modelo
model.fit(X, y, epochs=10)

# Hacer predicciones
predictions = model.predict(np.array([[0.5], [0.8]]))
print("Predicciones:", predictions)
