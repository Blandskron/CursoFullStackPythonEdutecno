from bokeh.plotting import figure, show
from bokeh.io import output_notebook

output_notebook()  # Para mostrar el gráfico en el notebook

# Crear un gráfico interactivo
p = figure(title="Gráfico Interactivo con Bokeh", x_axis_label='X', y_axis_label='Y')
p.line([1, 2, 3, 4, 5], [2, 3, 5, 7, 11], line_width=2, legend_label='Línea', color='blue')

# Mostrar gráfico
show(p)
