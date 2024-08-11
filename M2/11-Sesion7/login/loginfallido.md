1. **Iniciando proceso de login...**  
   - **Descripción:** Este mensaje indica que la función `checkLogin()` se ha ejecutado y el proceso de login ha comenzado.

2. **Username: bastian**  
   - **Descripción:** Muestra el valor que has ingresado en el campo de "Nombre de usuario", en este caso, "bastian".

3. **Password: fgdhre**  
   - **Descripción:** Muestra el valor que has ingresado en el campo de "Contraseña", en este caso, "fgdhre".

4. **XHR readyState: 1**  
   - **Descripción:** Este valor indica que la solicitud `XMLHttpRequest` (XHR) ha sido creada y configurada, pero aún no se ha enviado. El `readyState` en 1 significa que la conexión está abierta (`OPENED`).

5. **XHR status: 0**  
   - **Descripción:** El código de estado HTTP (status) es 0 porque la solicitud aún no ha sido enviada.

6. **Enviando solicitud GET a users.json**  
   - **Descripción:** Muestra que la solicitud GET para obtener el archivo `users.json` se ha enviado.

7. **XHR readyState: 2**  
   - **Descripción:** El `readyState` en 2 indica que la solicitud se ha enviado y la respuesta está en proceso. Este estado es conocido como `HEADERS_RECEIVED`, lo que significa que se han recibido las cabeceras de la respuesta.

8. **XHR status: 200**  
   - **Descripción:** El código de estado HTTP es 200, lo que significa que la solicitud ha sido exitosa y el servidor ha enviado una respuesta válida.

9. **XHR readyState: 3**  
   - **Descripción:** El `readyState` en 3 significa que la respuesta está siendo descargada; se conoce como `LOADING`.

10. **XHR readyState: 4**  
    - **Descripción:** El `readyState` en 4 significa que la operación está completada y la respuesta está completamente disponible. Este estado es conocido como `DONE`.

11. **Respuesta recibida: \[ \{ "username": "usuario1", "password": "123456" \}, \{ "username": "usuario2", "password": "123456" \]**  
    - **Descripción:** Muestra el contenido del archivo `users.json` que se ha recibido desde el servidor. En este caso, contiene dos usuarios: "usuario1" con contraseña "123456" y "usuario2" con contraseña "123456".

12. **Usuarios obtenidos: \[ \{ username: "usuario1", password: "123456" \}, \{ username: "usuario2", password: "123456" \]**  
    - **Descripción:** Este mensaje muestra los datos de los usuarios que han sido parseados desde el archivo `users.json` en formato de un arreglo de objetos.

13. **Usuario existe: false**  
    - **Descripción:** Este mensaje indica que el usuario y la contraseña que ingresaste ("bastian" y "fgdhre") no coinciden con ninguno de los usuarios en el archivo `users.json`.

14. **Login fallido**  
    - **Descripción:** Como la verificación del usuario y la contraseña no ha sido exitosa (el usuario no existe o la contraseña es incorrecta), el login ha fallado y el sistema lo ha registrado.

