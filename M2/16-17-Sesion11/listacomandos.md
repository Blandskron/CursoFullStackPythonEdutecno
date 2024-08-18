### Comandos Básicos
- **`git init`**: Inicializa un nuevo repositorio Git.
- **`git clone [url]`**: Clona un repositorio desde una URL a tu máquina local.
- **`git add [file]`**: Añade un archivo específico al área de preparación (staging area).
- **`git add .`**: Añade todos los archivos al área de preparación.
- **`git commit -m "mensaje"`**: Crea un commit con los archivos que están en el área de preparación, con un mensaje descriptivo.
- **`git status`**: Muestra el estado de los archivos en el directorio de trabajo y en el área de preparación.
- **`git log`**: Muestra un historial de commits.
- **`git log --oneline`**: Muestra un historial de commits de una forma más concisa, en una sola línea por commit.

### Comandos de Ramas (Branches)
- **`git branch`**: Muestra una lista de las ramas locales en el repositorio.
- **`git branch [nombre-rama]`**: Crea una nueva rama.
- **`git checkout [nombre-rama]`**: Cambia a una rama específica.
- **`git checkout -b [nombre-rama]`**: Crea y cambia a una nueva rama.
- **`git merge [nombre-rama]`**: Fusiona la rama especificada con la rama actual.
- **`git branch -d [nombre-rama]`**: Elimina una rama local.
- **`git branch -D [nombre-rama]`**: Elimina una rama local forzadamente.

### Comandos de Remotos (Remotes)
- **`git remote`**: Muestra los remotos configurados.
- **`git remote -v`**: Muestra las URLs para los remotos configurados.
- **`git remote add [nombre-remoto] [url]`**: Añade un remoto nuevo.
- **`git fetch [remoto]`**: Descarga datos de un remoto.
- **`git pull [remoto] [rama]`**: Descarga datos de un remoto y los fusiona con tu rama actual.
- **`git push [remoto] [rama]`**: Sube tus cambios al remoto especificado.

### Comandos de Control de Versiones
- **`git diff`**: Muestra las diferencias entre los cambios no confirmados y el último commit.
- **`git diff --staged`**: Muestra las diferencias entre los cambios en el área de preparación y el último commit.
- **`git reset [archivo]`**: Elimina un archivo del área de preparación, pero conserva los cambios en el directorio de trabajo.
- **`git reset --hard [commit]`**: Restablece el directorio de trabajo y el área de preparación al estado del commit especificado.
- **`git reset --soft [commit]`**: Restablece solo el área de preparación al estado del commit especificado, manteniendo los cambios en el directorio de trabajo.
- **`git checkout -- [archivo]`**: Descartar cambios en el directorio de trabajo para un archivo específico.

### Comandos de Configuración
- **`git config --global user.name "[nombre]"`**: Establece el nombre del usuario.
- **`git config --global user.email "[email]"`**: Establece el correo electrónico del usuario.
- **`git config --list`**: Muestra la configuración actual de Git.

### Comandos de Rebasing
- **`git rebase [rama]`**: Rebase la rama actual sobre la rama especificada.
- **`git rebase --continue`**: Continúa un rebase interrumpido por conflictos.
- **`git rebase --abort`**: Cancela el rebase en curso y restaura la rama original.

### Comandos de Stashing
- **`git stash`**: Guarda los cambios actuales en el directorio de trabajo en un "stash" temporal y limpia el directorio de trabajo.
- **`git stash apply`**: Aplica los cambios del stash al directorio de trabajo.
- **`git stash pop`**: Aplica los cambios del stash al directorio de trabajo y luego elimina ese stash.
- **`git stash list`**: Muestra una lista de todos los stashs guardados.

### Comandos de Visualización y Exploración
- **`git show [commit]`**: Muestra información detallada sobre un commit específico.
- **`git reflog`**: Muestra un historial de todos los movimientos del puntero HEAD.
- **`git blame [archivo]`**: Muestra la última modificación de cada línea en un archivo.
- **`git shortlog`**: Muestra un resumen de commits, agrupados por autor.

### Comandos de Deshacer Cambios
- **`git revert [commit]`**: Crea un nuevo commit que deshace los cambios realizados por un commit anterior.
- **`git clean -f`**: Elimina los archivos no rastreados en el directorio de trabajo.
- **`git cherry-pick [commit]`**: Aplica un commit específico en la rama actual.

### Comandos de Guardado Temporal (Tagging)
- **`git tag [nombre]`**: Crea una etiqueta (tag) ligera.
- **`git tag -a [nombre] -m "[mensaje]"`**: Crea una etiqueta anotada con un mensaje.
- **`git show [nombre]`**: Muestra información sobre la etiqueta especificada.

### Comandos de Submódulos (Submodules)
- **`git submodule add [url] [ruta]`**: Añade un submódulo al repositorio.
- **`git submodule init`**: Inicializa los submódulos.
- **`git submodule update`**: Actualiza los submódulos a la última versión del repositorio.

### Comandos Avanzados
- **`git bisect`**: Utiliza la búsqueda binaria para encontrar un commit que introdujo un error.
- **`git cherry`**: Muestra los commits que aún no han sido aplicados en otra rama.
- **`git archive`**: Crea un archivo tar o zip de los archivos rastreados en el repositorio.
- **`git gc`**: Limpia y optimiza el repositorio local.

### Comandos de Publicación
- **`git push [remoto] --tags`**: Publica las etiquetas al remoto.
- **`git push --force`**: Fuerza el push al remoto, sobrescribiendo el historial.

### Comandos de Integración Continua
- **`git ci [archivo]`**: Alias de `commit` para algunos usuarios.
- **`git co [archivo]`**: Alias de `checkout` para algunos usuarios.

### Comandos de Recuperación
- **`git fsck`**: Verifica la integridad de los objetos en el repositorio.
- **`git prune`**: Elimina los objetos no referenciados del repositorio.
