# Resolver el contenido de las cajas
def resolver_contenido_cajas():
    # Asumimos que Caja 3 no tiene tuercas y tornillos
    # Dado que ninguna caja tiene lo que dice, empezamos asumiendo el contenido contrario
    # Caja 3 puede tener solo tornillos o solo tuercas (no ambos)
    
    # Posibles contenidos iniciales
    opciones = {
        "Caja1": ["tornillos", "tuercas y tornillos"],
        "Caja2": ["tuercas", "tuercas y tornillos"],
        "Caja3": ["tornillos", "tuercas"]
    }
    
    # Caja 3 no puede tener "tuercas y tornillos", por lo tanto debe tener solo tornillos o solo tuercas
    # Si Caja 3 tiene tornillos, resolvemos el resto
    if "tornillos" in opciones["Caja3"]:
        opciones["Caja3"] = "tornillos"
        # Si Caja 3 tiene tornillos, Caja 1 no puede tener tornillos, entonces Caja 1 debe tener tuercas y tornillos
        opciones["Caja1"] = "tuercas y tornillos"
        # Si Caja 1 tiene tuercas y tornillos, entonces Caja 2 solo puede tener tuercas
        opciones["Caja2"] = "tuercas"
    else:
        # Si Caja 3 tiene tuercas, resolvemos de manera inversa
        opciones["Caja3"] = "tuercas"
        # Si Caja 3 tiene tuercas, Caja 2 no puede tener tuercas, así que Caja 2 debe tener tornillos
        opciones["Caja2"] = "tornillos"
        # Y Caja 1 debe tener tuercas y tornillos
        opciones["Caja1"] = "tuercas y tornillos"
    
    # Devolvemos la solución final
    return opciones

# Ejecutar la función
contenido_resuelto = resolver_contenido_cajas()

# Mostrar la solución
for caja, contenido in contenido_resuelto.items():
    print(f"{caja} contiene: {contenido}")
