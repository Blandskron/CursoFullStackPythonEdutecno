function validarCorreo() {
    var correo = document.getElementById('correo').value;

    // Expresión regular para validar el formato del correo electrónico
    var regexCorreo = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

    if (regexCorreo.test(correo)) {
        alert('Correo electrónico válido');
    } else {
        alert('Correo electrónico inválido');
    }
}