### Paso a Paso:

1. **Crear un directorio y un archivo vacío:**
   ```bash
   mkdir mi_directorio
   cd mi_directorio
   touch mi_archivo.txt
   ```

2. **Inicializar un repositorio de Git en el directorio:**
   ```bash
   git init
   ```

3. **Ver el estado de los archivos en el repositorio:**
   ```bash
   git status
   ```

4. **Agregar el archivo al área de preparación y realizar un commit:**
   ```bash
   git add mi_archivo.txt
   git commit -m "mi primer commit"
   ```

5. **Mostrar el historial de commits realizados:**
   ```bash
   git log
   ```

6. **Realizar un cambio en el archivo `mi_archivo.txt` y mostrar el estado de Git:**
   - Edita el archivo `mi_archivo.txt` y agrega algo de texto, por ejemplo, "Hola! soy un cambio".
   ```bash
   git status
   ```

7. **Mostrar las diferencias entre el estado actual y el anterior:**
   ```bash
   git diff
   ```

8. **Agregar los cambios al área de preparación y realizar un segundo commit:**
   ```bash
   git add mi_archivo.txt
   git commit -m "este es mi segundo commit"
   ```

9. **Mostrar el historial de commits nuevamente:**
   ```bash
   git log
   ```

10. **Realizar otro cambio en el archivo, revisar las diferencias y restaurar el estado anterior:**
    - Edita nuevamente `mi_archivo.txt` y agrega más texto, por ejemplo, "Este es otro cambio realizado".
    ```bash
    git diff
    git restore mi_archivo.txt
    ```

11. **Mostrar el contenido del archivo desde la consola:**
    ```bash
    cat mi_archivo.txt
    ```

12. **Finalmente, muestra un listado de los commits realizados:**
    ```bash
    git log
    ```