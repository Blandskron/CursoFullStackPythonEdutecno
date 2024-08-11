// Esta función 'sendEmails' es utilizada para enviar correos electrónicos.
function sendEmails() {
    // Accede a la hoja de cálculo activa y obtiene la hoja llamada "Emails".
    var sheet = SpreadsheetApp.getActiveSpreadsheet().getSheetByName("Emails");
    // Obtiene el rango de datos que contiene la hoja de cálculo.
    var dataRange = sheet.getDataRange();
    // Obtiene los valores del rango de datos en forma de un array bidimensional.
    var data = dataRange.getValues();
  
    // Un bucle que comienza en la segunda fila, asumiendo que la primera fila contiene encabezados.
    for (var i = 1; i < data.length; i++) {
      // Obtiene la dirección de correo electrónico de la primera columna (índice 0) de la fila actual.
      var emailAddress = data[i][0];
      // Obtiene el nombre del destinatario de la segunda columna (índice 1) de la fila actual.
      var name = data[i][1]; // Obteniendo el nombre de la columna B
  
      // Crea una plantilla HTML para el correo electrónico a partir de un archivo llamado 'Mensaje'.
      var template = HtmlService.createTemplateFromFile('Mensaje');
      // Pasa el nombre del destinatario a la plantilla HTML.
      template.nombre = name; // Pasando el nombre a la plantilla
  
      // Evalúa la plantilla HTML y obtiene el contenido del mensaje.
      var message = template.evaluate().getContent();
      // Crea un asunto para el correo electrónico, incluyendo el nombre del destinatario.
      var subject = "Hola " + name; // Usando el nombre en el asunto también
  
      // Envía el correo electrónico usando la dirección, asunto y mensaje definidos.
      // El mensaje se envía como HTML.
      MailApp.sendEmail(emailAddress, subject, "", {htmlBody: message});
    }
  }
  
  