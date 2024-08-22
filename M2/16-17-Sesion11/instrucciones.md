# Guía de Trabajo Colaborativo con Git

Este documento explica el proceso de trabajo colaborativo usando Git, desde el envío de cambios en ramas individuales hasta la integración de los aportes de cada miembro del equipo en la rama principal.

## 1. Configuración Inicial

Cada miembro del equipo trabaja en su propia rama. Para comenzar a trabajar, asegúrate de estar en tu rama personal y sigue los pasos a continuación para enviar tus cambios:

### Comandos para enviar cambios a tu rama:
```bash
git add .
git commit -m "Descripción de los cambios"
git push origin nombredemirama
```

## 2. Primera Ronda de Cambios

Una vez que todos los miembros hayan enviado sus primeros cambios a sus respectivas ramas, el líder del equipo o el mentor será responsable de integrar esos cambios en la rama principal.

### Proceso de Integración:

1. **Pull de la rama del compañero:** 
   El líder traerá cada rama de sus compañeros uno a uno, revisando y fusionando los cambios en la rama principal.

   Ejemplo:
   ```bash
   git pull origin rama-de-persida
   ```

   Después de realizar el pull, el líder integrará el código de cada miembro.

2. **Ejemplo de integración paso a paso:**

   - **Alumno 1 - Persida (Header):**
     ```html
     <!--persida crear header-->
     <header>
         <nav>
             <li>about</li>
         </nav>
     </header>
     ```

   - **Alumno 2 - Natalia (Contenido 1):**
     ```html
     <!--natalia contenido 1-->
     <div>
         <h1>contenido 1</h1>
     </div>
     ```

   - **Alumno 3 - Rodrigo (Contenido 2):**
     ```html
     <!--rodrigo contenido 2-->
     <div>
         <h2>contenido 2</h2>
     </div>
     ```

   - **Alumno 4 - Camila (Contenido 3):**
     ```html
     <!--camila contenido 3-->
     <div>
         <h3>contenido 3</h3>
     </div>
     ```

   - **Alumno 5 - Aldo (Footer):**
     ```html
     <!--Aldo footer-->
     <footer>
         <p>Síguenos en nuestras redes sociales</p>
     </footer>
     ```

3. **Resultado final del documento HTML:**

   ```html
   <!DOCTYPE html>
   <html lang="en">
   <head>
       <meta charset="UTF-8">
       <meta name="viewport" content="width=device-width, initial-scale=1.0">
       <title>Document</title>
   </head>
   <body>
       <!--ignacio lider-->
       <!--persida crear header-->
       <header>
           <nav>
               <li>about</li>
           </nav>
       </header>
       <!--natalia contenido 1-->
       <div>
           <h1>contenido 1</h1>
       </div>
       <!--rodrigo contenido 2-->
       <div>
           <h2>contenido 2</h2>
       </div>
       <!--camila contenido 3-->
       <div>
           <h3>contenido 3</h3>
       </div>
       <!--Aldo footer-->
       <footer>
           <p>Síguenos en nuestras redes sociales</p>
       </footer>
   </body>
   </html>
   ```

## 3. Sincronización de Cambios

Una vez que el líder del equipo haya fusionado todos los cambios en la rama principal, cada miembro del equipo debe sincronizar su entorno local con los cambios integrados:

### Comando para sincronizarse con la rama principal:
```bash
git pull origin rama-del-lider
```

## 4. Segunda Ronda de Cambios

Después de sincronizarse con la rama del líder, cada miembro puede comenzar a realizar cambios más grandes en la página. Es fundamental mantener una comunicación constante durante este proceso para evitar conflictos y la pérdida de cambios.

## 5. Comunicación

La comunicación es clave para el éxito del trabajo en equipo. Asegúrate de informar al equipo sobre los cambios que estás realizando y coordinar con los demás miembros para evitar sobrescribir los cambios de otros.
