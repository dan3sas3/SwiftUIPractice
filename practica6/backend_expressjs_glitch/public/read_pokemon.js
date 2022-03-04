async function ObtienePokemones() {

  let res = await axios.get('/mostrarpokemones');

  let data = res.data.data;
  console.log(data);
  
 
  var table = document.getElementById("tabla");
   var row = table.insertRow();
     var cell1 = row.insertCell();
     cell1.innerHTML = "<b>clave_pokemon</b>";
     cell1 = row.insertCell();
     cell1.innerHTML = "<b>nombre_pokemon</b>";
       cell1 = row.insertCell();
     cell1.innerHTML = "<b>tipo_pokemon</b>";
  for (var x = 0; x<data.length;x++) {
     var row = table.insertRow();
     var cell1 = row.insertCell();
     cell1.innerHTML = data[x]["clave_pokemon"];
     cell1 = row.insertCell();
     cell1.innerHTML = data[x]["nombre_pokemon"];
      cell1 = row.insertCell();
     cell1.innerHTML = data[x]["tipo_pokemon"];

}
   
}