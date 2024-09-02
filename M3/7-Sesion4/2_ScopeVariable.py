# Variable global
s = "Esta es una variable global"

def f():
    # Variable local
    s = "Esta es una variable local"
    print(s)  # Salida: Esta es una variable local

f()
print(s)  # Salida: Esta es una variable global
