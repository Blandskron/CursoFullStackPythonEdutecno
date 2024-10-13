try:
    raise KeyboardInterrupt  # Simulamos una interrupción
finally:
    print("Goodbye, world!")  # Este mensaje siempre se imprimirá
