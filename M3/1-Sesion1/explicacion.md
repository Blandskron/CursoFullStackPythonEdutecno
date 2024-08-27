### README: Ejercicios de Librerías para Python

Este proyecto contiene una serie de ejemplos prácticos utilizando diversas librerías de Python. Cada ejemplo está diseñado para ilustrar diferentes aspectos y capacidades de estas librerías, y puede ser ejecutado en Google Colab.

#### **Requisitos**
- Acceso a Google Colab (https://colab.research.google.com/)
- Conexión a internet

#### **Instrucciones**
1. Abre Google Colab en tu navegador web.
2. Crea un nuevo cuaderno (notebook).
3. Copia y pega el código de cada ejemplo en una celda separada y ejecútalo.
4. Sigue las explicaciones de cada sección para entender cómo funciona el código.

#### **Ejemplos Incluidos**

1. **Matplotlib: Crear un gráfico de línea simple**
   - **Archivo**: `matplotlib_line_plot.py`
   - **Descripción**: Este ejemplo muestra cómo utilizar Matplotlib para crear un gráfico de línea simple. Se grafican los valores de dos listas (`x` e `y`), con etiquetas y un título.
   - **Código**:
   ```python
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
   ```

2. **Seaborn: Visualizar datos estadísticos con un gráfico de dispersión**
   - **Archivo**: `seaborn_scatter_plot.py`
   - **Descripción**: Este ejemplo utiliza Seaborn para crear un gráfico de dispersión, mostrando cómo visualizar relaciones entre dos variables en un DataFrame.
   - **Código**:
   ```python
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
   ```

3. **Bokeh: Crear un gráfico interactivo**
   - **Archivo**: `bokeh_interactive_plot.py`
   - **Descripción**: Utiliza Bokeh para crear un gráfico interactivo que puede visualizarse directamente en el navegador.
   - **Código**:
   ```python
   from bokeh.plotting import figure, show
   from bokeh.io import output_notebook

   output_notebook()  # Para mostrar el gráfico en el notebook

   # Crear un gráfico interactivo
   p = figure(title="Gráfico Interactivo con Bokeh", x_axis_label='X', y_axis_label='Y')
   p.line([1, 2, 3, 4, 5], [2, 3, 5, 7, 11], line_width=2, legend_label='Línea', color='blue')

   # Mostrar gráfico
   show(p)
   ```

4. **NumPy: Operaciones básicas con arrays**
   - **Archivo**: `numpy_operations.py`
   - **Descripción**: Muestra cómo realizar operaciones matemáticas básicas utilizando arrays de NumPy.
   - **Código**:
   ```python
   import numpy as np

   # Crear arrays
   a = np.array([1, 2, 3, 4, 5])
   b = np.array([10, 20, 30, 40, 50])

   # Operaciones básicas
   suma = a + b
   producto = a * b
   promedio = np.mean(a)

   print("Suma:", suma)
   print("Producto:", producto)
   print("Promedio de a:", promedio)
   ```

5. **SciPy: Resolver una ecuación diferencial simple**
   - **Archivo**: `scipy_ode.py`
   - **Descripción**: Ejemplo de uso de SciPy para resolver una ecuación diferencial simple utilizando la función `odeint`.
   - **Código**:
   ```python
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
   ```

6. **Pandas: Manipulación de datos con DataFrames**
   - **Archivo**: `pandas_dataframe.py`
   - **Descripción**: Demuestra cómo crear, filtrar y manipular datos en un DataFrame utilizando la librería Pandas.
   - **Código**:
   ```python
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
   ```

7. **Numba: Optimización de funciones con JIT**
   - **Archivo**: `numba_jit.py`
   - **Descripción**: Este ejemplo muestra cómo utilizar Numba para optimizar funciones en Python mediante la compilación Just-In-Time (JIT).
   - **Código**:
   ```python
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
   ```

8. **Scikit-Learn: Clasificación con un modelo sencillo**
   - **Archivo**: `scikit_learn_classification.py`
   - **Descripción**: Un ejemplo simple de clasificación utilizando Scikit-Learn para entrenar un modelo de bosque aleatorio (`RandomForestClassifier`) con el conjunto de datos `Iris`.
   - **Código**:
   ```python
   from sklearn.datasets import load_iris
   from sklearn.model_selection import train_test_split
   from sklearn.ensemble import RandomForestClassifier
   from sklearn.metrics import accuracy_score

   # Cargar datos
   data = load_iris()
   X = data.data
   y = data.target

   # Dividir datos en entrenamiento y prueba
   X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3, random_state=42)

   # Crear y entrenar el clasificador
   clf = RandomForestClassifier(n_estimators=100)
   clf.fit(X_train, y_train)

   # Hacer predicciones
   y_pred = clf.predict(X_test)

   # Evaluar el modelo
   print("Precisión del modelo:", accuracy_score(y_test, y_pred))
   ```

9. **TensorFlow: Construir y entrenar un modelo de regresión lineal simple**
    - **Archivo**: `tensorflow_linear_regression.py`
    - **Descripción**: Este ejemplo muestra cómo usar TensorFlow para construir y entrenar un modelo de regresión lineal simple. Utiliza datos generados para predecir el valor de `y` a partir de `x`.
    - **Código**:
    ```python
    import tensorflow as tf
    import numpy as np
    import matplotlib.pyplot as plt

    # Generar datos de ejemplo
    np.random.seed(42)
    x = np.random.rand(100).astype(np.float32)
    y = 2 * x + 1 + np.random.normal(scale=0.1, size=100)  # y = 2x + 1 + ruido

    # Construir el modelo de regresión lineal
    model = tf.keras.Sequential([
        tf.keras.layers.Dense(units=1, input_shape=[1])
    ])

    # Compilar el modelo
    model.compile(optimizer='sgd', loss='mean_squared_error')

    # Entrenar el modelo
    history = model.fit(x, y, epochs=100, verbose=0)

    # Predecir valores utilizando el modelo entrenado
    y_pred = model.predict(x)

    # Graficar resultados
    plt.scatter(x, y, label='Datos Originales')
    plt.plot(x, y_pred, color='red', label='Línea de Regresión')
    plt.xlabel('x')
    plt.ylabel('y')
    plt.title('Regresión Lineal con TensorFlow')
    plt.legend()
    plt.show()
    ```

    ### **Explicación**:
    - **Generación de datos**: Se crean datos de ejemplo utilizando una relación lineal con ruido aleatorio.
    - **Modelo de regresión lineal**: Se utiliza `tf.keras.Sequential` para crear un modelo simple de regresión lineal.
    - **Entrenamiento del modelo**: El modelo se entrena durante 100 épocas utilizando el optimizador SGD (descenso de gradiente estocástico) y el error cuadrático medio como función de pérdida.
    - **Predicción**: Se predicen los valores de `y` utilizando el modelo entrenado.
    - **Visualización**: Se grafican los datos originales y la línea de regresión resultante para visualizar el ajuste del modelo.

#### **Ejecutar en Google Colab**
1. Copia el código de cada sección en una celda en Google Colab.
2. Ejecuta la celda para ver el resultado.
3. Asegúrate de que todas las librerías estén instaladas en tu entorno de Colab. Puedes instalar cualquier librería faltante con el siguiente comando en una celda de Colab:
   ```python
   !pip install nombre_de_la_libreria
   ```

### **Conclusión**
Este README proporciona una guía básica para ejecutar los ejemplos de código en Google Colab, explorando diversas librerías populares de Python. Cada ejemplo está diseñado para ser simple y efectivo, ayudando a entender mejor el uso de estas herramientas en diferentes contextos de desarrollo.