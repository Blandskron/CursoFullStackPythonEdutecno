import tkinter as tk
from tkinter import filedialog, messagebox
import os
import time

# Función para abrir un archivo
def open_file():
    filepath = filedialog.askopenfilename(defaultextension=".txt",
                                          filetypes=[("Text Files", "*.txt"), ("All Files", "*.*")])
    if not filepath:
        return
    try:
        with open(filepath, "r") as input_file:
            text = input_file.read()
            text_area.delete(1.0, tk.END)
            text_area.insert(tk.END, text)
            window.title(f"Editor de Texto - {os.path.basename(filepath)}")
        log_action(f"Archivo abierto: {filepath}")
    except Exception as e:
        log_action(f"Error al abrir el archivo: {e}")
        messagebox.showerror("Error", f"No se pudo abrir el archivo: {e}")

# Función para guardar el archivo actual
def save_file():
    filepath = filedialog.asksaveasfilename(defaultextension=".txt",
                                            filetypes=[("Text Files", "*.txt"), ("All Files", "*.*")])
    if not filepath:
        return
    try:
        with open(filepath, "w") as output_file:
            text = text_area.get(1.0, tk.END)
            output_file.write(text)
            window.title(f"Editor de Texto - {os.path.basename(filepath)}")
        log_action(f"Archivo guardado: {filepath}")
    except Exception as e:
        log_action(f"Error al guardar el archivo: {e}")
        messagebox.showerror("Error", f"No se pudo guardar el archivo: {e}")

# Función para registrar las acciones del usuario en un archivo de log
def log_action(action):
    with open("editor_log.txt", "a") as log_file:
        log_file.write(f"{time.strftime('%Y-%m-%d %H:%M:%S')} - {action}\n")

# Crear la ventana principal
window = tk.Tk()
window.title("Editor de Texto")

# Crear el área de texto
text_area = tk.Text(window, wrap='word', undo=True)
text_area.pack(expand=1, fill='both')

# Crear un menú de opciones
menu_bar = tk.Menu(window)
file_menu = tk.Menu(menu_bar, tearoff=0)
file_menu.add_command(label="Abrir", command=open_file)
file_menu.add_command(label="Guardar", command=save_file)
file_menu.add_separator()
file_menu.add_command(label="Salir", command=window.quit)
menu_bar.add_cascade(label="Archivo", menu=file_menu)

window.config(menu=menu_bar)

# Iniciar la aplicación
window.mainloop()
