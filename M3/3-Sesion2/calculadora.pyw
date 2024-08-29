import tkinter as tk
from tkinter import messagebox

# Función para actualizar la expresión en la pantalla
def click_button(item):
    global expression
    expression += str(item)
    input_text.set(expression)

# Función para evaluar la expresión y mostrar el resultado
def evaluate():
    try:
        global expression
        result = str(eval(expression))  # Evaluar la expresión
        input_text.set(result)
        expression = result  # Permitir realizar operaciones sobre el resultado
    except Exception as e:
        input_text.set("Error")
        expression = ""
        messagebox.showerror("Error", f"Ha ocurrido un error: {e}")

# Función para borrar la última entrada
def clear_last():
    global expression
    expression = expression[:-1]
    input_text.set(expression)

# Función para borrar toda la expresión
def clear_all():
    global expression
    expression = ""
    input_text.set("")

# Configuración de la ventana principal
window = tk.Tk()
window.title("Calculadora")
window.geometry("320x400")
window.resizable(0, 0)

# Variable para mantener la expresión
expression = ""
input_text = tk.StringVar()

# Crear la pantalla de la calculadora
input_frame = tk.Frame(window, width=312, height=50, bd=0, highlightbackground="black", highlightcolor="black", highlightthickness=1)
input_frame.pack(side=tk.TOP)

input_field = tk.Entry(input_frame, font=('arial', 18, 'bold'), textvariable=input_text, width=50, bg="#eee", bd=0, justify=tk.RIGHT)
input_field.grid(row=0, column=0)
input_field.pack(ipady=10)  # Aumentar la altura del campo de entrada

# Crear el frame para los botones
buttons_frame = tk.Frame(window, width=312, height=272.5, bg="grey")
buttons_frame.pack()

# Botones
buttons = [
    ('7', 1, 0), ('8', 1, 1), ('9', 1, 2), ('/', 1, 3),
    ('4', 2, 0), ('5', 2, 1), ('6', 2, 2), ('*', 2, 3),
    ('1', 3, 0), ('2', 3, 1), ('3', 3, 2), ('-', 3, 3),
    ('0', 4, 0), ('.', 4, 1), ('+', 4, 2), ('=', 4, 3),
    ('C', 5, 0), ('CE', 5, 1)
]

# Agregar botones al frame
for (text, row, col) in buttons:
    if text == '=':
        btn = tk.Button(buttons_frame, text=text, width=10, height=3, bd=0, bg="#eee", cursor="hand2",
                        command=evaluate)
    elif text == 'C':
        btn = tk.Button(buttons_frame, text=text, width=10, height=3, bd=0, bg="#f00", cursor="hand2",
                        command=clear_last)
    elif text == 'CE':
        btn = tk.Button(buttons_frame, text=text, width=10, height=3, bd=0, bg="#f00", cursor="hand2",
                        command=clear_all)
    else:
        btn = tk.Button(buttons_frame, text=text, width=10, height=3, bd=0, bg="#fff", cursor="hand2",
                        command=lambda t=text: click_button(t))
    
    btn.grid(row=row, column=col, padx=1, pady=1)

# Iniciar la aplicación
window.mainloop()
