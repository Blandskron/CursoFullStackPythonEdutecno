"""
á se escribe como &aacute;
é se escribe como &eacute;
í se escribe como &iacute;
ó se escribe como &oacute;
ú se escribe como &uacute;
ñ se escribe como &ntilde;
Á se escribe como &Aacute;
É se escribe como &Eacute;
Í se escribe como &Iacute;
Ó se escribe como &Oacute;
Ú se escribe como &Uacute;
Ñ se escribe como &Ntilde;
¿ se escribe como &iquest;
¡ se escribe como &iexcl;
"""
def escribir_archivo():
    with open("nuevo_archivo_utf-8.txt", "w", encoding='utf-8') as archivo:
        archivo.write("Este es un nuevo archivo creado en modo escritura.\n")
        archivo.write(f"Aquí se pueden agregar más líneas de texto.\n")
    print("Contenido escrito en 'nuevo_archivo.txt'.")

escribir_archivo()
