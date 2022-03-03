async function creapokemon() {

 
    let n = {
      "nombre_pokemon":document.getElementById("nombre_pokemon").value, 
       "tipo_pokemon":document.getElementById("tipo_pokemon").value 
    }

    let res = await axios.post('/insertarpokemones', n);

    let data = res.data;
    console.log(data);
   document.getElementById("formulariocreate").innerHTML ="";
  document.getElementById("salida").innerHTML = data.message;
  
    }
