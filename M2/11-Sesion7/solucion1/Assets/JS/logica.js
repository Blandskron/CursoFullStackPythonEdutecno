var edad1 = parseInt(prompt("Ingrese la primera edad"));
var edad2 = parseInt(prompt("Ingresa la segunda edad"));

if(edad1 > edad2){
    alert(edad1 +" es mayor que " + edad2);
} else if(edad1 == edad2){
    alert("Ambas edades son iguales");
} else{
    alert(edad2 + "es mayor que " + edad1)
}
