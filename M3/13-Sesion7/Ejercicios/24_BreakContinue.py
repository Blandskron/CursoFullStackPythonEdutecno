for i in range(1, 11):
    if i % 2 == 0:
        continue
    if i > 7:
        break
    print(f"Número impar menor a 8: {i}")
