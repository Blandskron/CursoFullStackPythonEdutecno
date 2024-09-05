# Determinar el estado de agua según su temperatura
temperatura_agua = 50

if temperatura_agua <= 0:
    print("El agua está congelada.")
elif temperatura_agua > 0 and temperatura_agua < 100:
    print("El agua está en estado líquido.")
else:
    print("El agua está en estado gaseoso (vapor).")
