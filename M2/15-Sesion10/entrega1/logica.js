$(document).ready(function(){
 
 $("#text1").mouseover(function(){
        $("#text2").toggle();
    })

 $("#img").dblclick(function(){
     $("#img").css({width: '100%'})
    
 })  
 
 $("#img").mouseout(function(){
    $("#img").css({width: '20%'})
   
}) 

$("#caja3").dblclick(function(){
    $("#caja3").css('font-size', 'xx-large')
   
}) 
});



/*

function letra(){
    document.getElementById("caja3").style.fontSize = "xx-large"
}
*/