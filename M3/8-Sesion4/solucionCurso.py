"""
Tengo 3 cajas
        True                 True               True y True = True
Caja1 - Tornillos    Caja2 - Tuercas    Caja3 - tuercas y tornillos
       Not True             Not True            Not True
       False                  False                False
No Tiene Tornillos - No tiene Tuercas - No tiene tuercas y tornillos

Primera afirmacion
abriendo cualquier caja puedo saber el contenido de las otras cajas

Segunda afirmacion
niguna caja tiene lo que dice

Tercera afirmacion
sigue existiendo el mismo contenido

Cuarta afirmacion
ninguna caja esta vacia

caja1 No tornillos - tenemos 2 opciones (tuercas) o (tuercas y tornillos)
caja2 No tuerca - tenemos 2 opciones (tornillos) o (tuercas y tornillos)
caja3 No tuercas y tornillos - tenemos 2 opciones (tuercas) o (tornillos)
"""
"""
#Contenido ordenado
caja1 != "tornillos"
caja2 != "tuercas"
caja3 != "tuercas y tornillos"
#Contenido desordenado
"""

pregunta = input("que caja quieres abrir: caja1 \n caja2 \n caja3 \n ")

if pregunta == "caja1":
  caja1 = input("Esta caja no tiene tornillos cual encontraste:")
  if caja1 != "tornillos":
    if caja1 == "tuercas":
      print(f"caja1 = tuercas - caja2 = tuercas y tornillos - caja3 = tornillos")
    elif caja1 == "tuercas y tornillos":
      print("caja1 = tuercas y tornillos - caja2 = tuercas - caja3 = tornillos")
  else:
    print("esta caja no puede tener tornillos")
elif pregunta == "caja2":
  caja2 = input("Esta caja no tiene tuercas que encontraste:")
  if caja2 != "tuercas":
    if caja2 == "tornillos":
      print(f"caja1 = tuercas y tornillos - caja2 = tornillos - caja3 = tuercas")
    elif caja2 == "tuercas y tornillos":
      print("caja1 = tuercas - caja2 = tuercas y tornillos - caja3 = tornillos")
  else:
    print("esta caja no puede tener tornillos")
elif pregunta == "caja3":
  caja3 = input("Esta caja no tiene turcas y tornillos que encontraste:")
  if caja3 != "tuercas y tornillos":
    if caja3 == "tuercas":
      print(f"caja1 = tuercas - caja2 = tuercas y tornillos - caja3 = tuercas")
    elif caja3 == "tornillos":
      print("caja1 = tuercas - caja2 = tuercas y tornillos - caja3 = tornillos")
  else:
    print("esta caja no puede tener tornillos")
else:
  print("caja no encontrada")
  