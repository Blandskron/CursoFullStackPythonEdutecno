### Código de Ejemplo para la Terminal:
```bash
# Paso 1: Inicializar un nuevo repositorio de Git
git init

# Paso 2: Agregar archivos al área de preparación (staging area)
git add .

# Paso 3: Realizar un commit con un mensaje descriptivo
git commit -m "Initial commit - Proyecto iniciado con archivos básicos"

# Paso 4: Crear una nueva rama para trabajar en una característica específica
git branch nueva-caracteristica

# Paso 5: Cambiar a la rama recién creada
git checkout nueva-caracteristica

# Paso 6: Hacer cambios en los archivos, luego agregarlos y hacer commit
# (Imagina que realizas cambios en algún archivo del proyecto)
git add .
git commit -m "Añadida nueva funcionalidad en la rama nueva-caracteristica"

# Paso 7: Cambiar de nuevo a la rama principal (main)
git checkout main

# Paso 8: Fusionar (merge) los cambios de la nueva rama en la rama principal
git merge nueva-caracteristica

# Paso 9: Eliminar la rama que ya no es necesaria
git branch -d nueva-caracteristica
```

### Explicación de cada paso:

1. **Inicializar un repositorio (`git init`)**: Este comando crea un nuevo repositorio de Git en tu proyecto.
2. **Agregar archivos (`git add .`)**: Añade todos los archivos del proyecto al área de preparación.
3. **Hacer un commit (`git commit -m "Mensaje"`)**: Guarda el estado de los archivos en un commit con un mensaje que describe los cambios realizados.
4. **Crear una nueva rama (`git branch nueva-caracteristica`)**: Crea una nueva rama llamada `nueva-caracteristica` para trabajar en una nueva funcionalidad sin afectar la versión estable del proyecto.
5. **Cambiar a la nueva rama (`git checkout nueva-caracteristica`)**: Cambia el contexto a la nueva rama creada.
6. **Hacer cambios, agregar y hacer commit**: Después de realizar cambios en los archivos, se vuelven a agregar y a guardar en un nuevo commit.
7. **Cambiar de nuevo a la rama principal (`git checkout main`)**: Regresa a la rama principal (`main` o `master`).
8. **Fusionar (`git merge`)**: Combina los cambios de la nueva rama en la rama principal.
9. **Eliminar la rama (`git branch -d nueva-caracteristica`)**: Una vez que los cambios están fusionados, se puede eliminar la rama que ya no es necesaria.
