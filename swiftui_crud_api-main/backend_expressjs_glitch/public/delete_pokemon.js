var valor = -1;


async function deletepokemon() {
     var nombre_pokemon ="";
     var tipo_pokemon ="";
     var clave_pokemon = 0; 
      var index = 0;
     var inputArray = document.getElementsByTagName("input");
    var radioArray = document.getElementsByName("radioid");   
  
  for (index = 0; index < radioArray.length; index++)
    {
        if (radioArray[index].checked)
          {
            clave_pokemon = radioArray[index].value;
          }
  
    }
  
  
    
    
    let n = {
      "clave_pokemon": clave_pokemon, 
      
    }
    

    let res = await axios.post('/borrarpokemones', n);

    let data = res.data;
    console.log(data);
  document.getElementById("salida").innerHTML = data.message;
  document.getElementById("tabla").innerHTML ="";
  //ObtienePokemones();
    }

function activacampos(myRadio){
   
  
  if (valor != -1){
  document.getElementById("nombre_pokemon_" + valor).disabled = true;
  document.getElementById("tipo_pokemon_" + valor).disabled = true;
  }
  
  valor = myRadio.value;
  document.getElementById("nombre_pokemon_" + valor).disabled = false;
  document.getElementById("tipo_pokemon_" + valor).disabled = false;
  
}

async function ObtienePokemones() {

  let res = await axios.get('/mostrarpokemones');

  let data = res.data.data;
  console.log(data);
  
 
  var table = document.getElementById("tabla");
   var row = table.insertRow();
     var cell1 = row.insertCell();
  cell1.innerHTML = "<b>Selecciona el que deseas borrar</b>";
     cell1 = row.insertCell();
     cell1.innerHTML = "<b>nombre_pokemon</b>";
       cell1 = row.insertCell();
     cell1.innerHTML = "<b>tipo_pokemon</b>";
  for (var x = 0; x<data.length;x++) {
     var row = table.insertRow();
     var cell1 = row.insertCell();
    cell1.innerHTML = "<input type='radio' name = 'radioid' id='radio_"+ data[x]["clave_pokemon"]  +"' value = "+ data[x]["clave_pokemon"]  +" />"
    cell1 = row.insertCell();
     cell1.innerHTML = "<input type='text' name = 'nombre_pokemon' id='nombre_pokemon_"+ data[x]["clave_pokemon"]  +"'  value=" + data[x]["nombre_pokemon"] +" disabled>";
     cell1 = row.insertCell();
    cell1.innerHTML = "<input type='text' name= 'tipo_pokemon' id='tipo_pokemon_"+ data[x]["clave_pokemon"]  +"'   value=" + data[x]["tipo_pokemon"] +" disabled>";
  

}
   
}