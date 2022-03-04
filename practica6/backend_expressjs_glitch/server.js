//Para probar en Postman
//https://stackoverflow.com/questions/24543847/req-body-empty-on-posts

//SQL
/*


CREATE TABLE fruits
(
clave_fruits SERIAL,
nombre_fruits TEXT,
tipo_fruits TEXT
)

INSERT INTO fruits (nombre_fruits,tipo_fruits) VALUES('manzana','nacional');
INSERT INTO fruits (nombre_fruits,tipo_fruits) VALUES('pera','nacional');
INSERT INTO fruits (nombre_fruits,tipo_fruits) VALUES('kiwi','importada');



*/
const express = require('express'),
  app = express(),
  cors = require('cors'),
  bodyParser = require('body-parser');



const db = require('/app/db');


app.use(cors())
app.use(bodyParser.json())
app.use(express.urlencoded());
app.use(express.static("public"));

app.get("/", (request, response) => {
  response.sendFile(__dirname + "/views/index.html");
});



app.get("/mostrarfruits", function(req, res) {
  let sql = `SELECT * FROM fruits`;
  db.query(sql, function(err, data, fields) {
    if (err) throw err;
    let message = ""
   var frutas = data.rows;
    
    
    
    if (data === undefined || data.length == 0) {
            message = "vacio";
        } else {
            message = "OK";
        }
      
    
        return res.json({
            error: false,
            message: message,
            data: frutas
        });
    
    
     
    
  })
});

app.put("/actualizarfruits", function(req, res) {
  //let sql = `UPDATE fruits SET nombre_fruits=?, tipo_fruits = ? WHERE clave_fruits =?`;
    let values = [
        req.body.nombre_fruits,
        req.body.tipo_fruits, 
        req.body.clave_fruits 
 
  ];
  let sql = `UPDATE fruits SET nombre_fruits='` +req.body.nombre_fruits +`', tipo_fruits ='`+req.body.tipo_fruits
  +`' WHERE clave_fruits =` +req.body.clave_fruits;
  console.log(sql);
 //db.query(sql, values, function(err, data, fields) {
  db.query(sql,  function(err, data, fields) {
    if (err) 
    {
      //res.json(req.body);
      return res.json(err);
    };
    return res.send({
error: false,
      message: 'Fruta actualizada ok',
      data: []
    })
  })
});

app.delete("/borrarfruits", function(req, res) {
  //let sql = `DELETE FROM fruits WHERE clave_fruits =?`;
    let values = [
        req.body.clave_fruits 
 
  ];
  let sql = `DELETE FROM fruits WHERE clave_fruits =` +req.body.clave_fruits;
  console.log(sql);
 //db.query(sql, values, function(err, data, fields) {
  db.query(sql,  function(err, data, fields) {
    if (err) 
    {
      //res.json(req.body);
      return res.json(err);
    };
    return res.send({
  error: false,
      message: 'Fruta eliminada ok',
      data: []
    })
  })
});
   



app.post("/insertarfruits", function(req, res) {
  //let sql = `INSERT INTO fruits (nombre_fruits,tipo_fruits) VALUES(?,?)`;
    // INSERT INTO fruits (nombre_fruits,tipo_fruits) VALUES('kiwi','importada');
  let sql = `INSERT INTO fruits (nombre_fruits,tipo_fruits) VALUES('` +req.body.nombre_fruits +`','`+req.body.tipo_fruits+`')`;
  console.log(sql);
 //db.query(sql, values, function(err, data, fields) {
  db.query(sql,  function(err, data, fields) {
    if (err) 
    {
      //res.json(req.body);
      return res.json(err);
    };
    return res.send({
      error: false,
      message: 'Fruta agregada ok',
      data: []
    })
  })
});




// listen for requests :)
const listener = app.listen(process.env.PORT, () => {
  console.log("Your app is listening on port " + listener.address().port);
});
