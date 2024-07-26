// Define el nombre de la hoja de cálculo que se va a utilizar.
var sheetName = 'Sheet1';

// Obtiene las propiedades del script, que se utilizan para almacenar y acceder a información que es específica de este script.
var scriptProp = PropertiesService.getScriptProperties();

// La función 'setup' se utiliza para inicializar la hoja de cálculo. 
// Esta función debe ser ejecutada una vez antes de utilizar 'doPost'.
function setup() {
  // Obtiene la hoja de cálculo activa en la que se está ejecutando el script.
  var activeSpreadsheet = SpreadsheetApp.getActiveSpreadsheet();
  // Guarda el ID de la hoja de cálculo en las propiedades del script para su uso posterior.
  scriptProp.setProperty('key', activeSpreadsheet.getId());
}

// La función 'doPost' maneja las solicitudes POST enviadas a la hoja de cálculo. 
// Es el punto de entrada para los datos que se enviarán a la hoja de cálculo.
function doPost(e) {
  // Crea un bloqueo de script para evitar la ejecución simultánea de este bloque de código,
  // lo que podría causar conflictos de escritura.
  var lock = LockService.getScriptLock();
  // Intenta adquirir el bloqueo. Si no está disponible, espera hasta 10000 milisegundos (10 segundos).
  lock.tryLock(10000);

  try {
    // Abre la hoja de cálculo usando el ID almacenado en las propiedades del script.
    var doc = SpreadsheetApp.openById(scriptProp.getProperty('key'));
    // Accede a la hoja específica dentro de la hoja de cálculo por su nombre.
    var sheet = doc.getSheetByName(sheetName);

    // Obtiene los encabezados de las columnas de la hoja de cálculo.
    var headers = sheet.getRange(1, 1, 1, sheet.getLastColumn()).getValues()[0];
    // Determina la próxima fila vacía donde se pueden agregar nuevos datos.
    var nextRow = sheet.getLastRow() + 1;

    // Crea una nueva fila de datos. Para cada encabezado en 'headers',
    // obtiene el valor correspondiente del parámetro enviado en la solicitud POST.
    // Si el encabezado es 'timestamp', inserta la fecha y hora actual.
    var newRow = headers.map(function(header) {
      return header === 'timestamp' ? new Date() : e.parameter[header];
    });

    // Escribe los nuevos datos en la hoja de cálculo en la fila determinada.
    sheet.getRange(nextRow, 1, 1, newRow.length).setValues([newRow]);
  } catch (e) {
    // En caso de error, devuelve una respuesta con el error en formato JSON.
    return ContentService.createTextOutput(JSON.stringify({ 'result': 'error', 'error': e })).setMimeType(ContentService.MimeType.JSON);
  } finally {
    // Libera el bloqueo del script, independientemente de si el try fue exitoso o no.
    lock.releaseLock();
  }

  // Si todo fue exitoso, devuelve una respuesta indicando el éxito y la fila donde se agregaron los datos.
  return ContentService.createTextOutput(JSON.stringify({ 'result': 'success', 'row': nextRow })).setMimeType(ContentService.MimeType.JSON);
}
