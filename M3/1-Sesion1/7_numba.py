from numba import jit
import numpy as np
import time

# Función para optimizar
@jit(nopython=True)
def suma_array(array):
    total = 0
    for i in range(len(array)):
        total += array[i]
    return total

# Crear un array grande
arr = np.arange(1000000)

# Medir el tiempo de ejecución
start = time.time()
result = suma_array(arr)
end = time.time()

print("Resultado de la suma:", result)
print("Tiempo de ejecución:", end - start)
