from scipy.integrate import odeint
import numpy as np
import matplotlib.pyplot as plt

# Definir la ecuación diferencial
def modelo(y, t):
    k = 0.3
    dydt = -k * y
    return dydt

# Condiciones iniciales
y0 = 5
t = np.linspace(0, 20, 100)

# Resolver la ecuación diferencial
sol = odeint(modelo, y0, t)

# Graficar la solución
plt.plot(t, sol)
plt.xlabel('Tiempo')
plt.ylabel('Valor')
plt.title('Solución de Ecuación Diferencial con SciPy')
plt.show()
