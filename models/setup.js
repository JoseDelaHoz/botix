import {sequelize} from "../system/database.js"
var Modelos = require("./run.js")


let RUN = async() =>{


await sequelize.sync({ force: true })


await Modelos.Botillerias.create({
  nombre:"Morada",
  direccion:"222",
  telefono:1,
  medio_pago:["transbank","efectivo","cheque"],
  suscripcion  :2,
  horarios  :["Lu a VI 12 a 23","SA 12 a 03"],
  fotos:[],
  ubicacion:{ type: 'Point', coordinates: [ -71.578605,-35.367988]}

})

await Modelos.Botillerias.create({
  nombre:"Blanca",
  direccion:"111",
  telefono:2,
  medio_pago:["transbank","efectivo","cheque"],
  suscripcion  :2,
  horarios  :["Lu a VI 12 a 23","SA 12 a 03"],
  fotos:[],
  ubicacion:{ type: 'Point', coordinates: [ -70.661535,-33.452396]}

})


await Modelos.Botillerias.create({
  nombre:"Azul",
  direccion:"333",
  telefono:3,
  medio_pago:["transbank","efectivo","cheque"],
  suscripcion  :2,
  horarios  :["Lu a VI 11 a 22","SA 11 a 02"],
  fotos:[],
  ubicacion:{ type: 'Point', coordinates: [ -70.660533,-33.452301]}

})

await Modelos.Botillerias.create({
  nombre:"Rojo",
  direccion:"444",
  telefono:4,
  medio_pago:["transbank","efectivo","cheque"],
  suscripcion  :1,
  horarios  :["Lu a VI 12 a 22","SA 12 a 00"],
  fotos:[],
  ubicacion:{ type: 'Point', coordinates: [ -70.664717,-33.448872]}

})

await Modelos.Botillerias.create({
  nombre:"Verde",
  direccion:"555",
  telefono:5,
  medio_pago:["transbank","efectivo","cheque"],
  suscripcion  :1,
  horarios  :["Lu a VI 12 a 23","SA 12 a 00"],
  fotos:[],
  ubicacion:{ type: 'Point', coordinates: [ -70.733079,-33.365375]}

})

await Modelos.Botillerias.create({
  nombre:"Amarillo",
  direccion:"666",
  telefono:6,
  medio_pago:["transbank","efectivo","cheque"],
  suscripcion  :2,
  horarios  :["Lu a VI 12 a 21","SA 12 a 01"],
  fotos:[],
  ubicacion:{ type: 'Point', coordinates: [ -70.670425,-33.351573]}

})

await Modelos.Botillerias.create({
  nombre:"Negro",
  direccion:"777",
  telefono:3,
  medio_pago:["transbank","efectivo","cheque"],
  suscripcion  :1,
  horarios  :["Lu a VI 11 a 22","SA 11 a 02"],
  fotos:[],
  ubicacion:{ type: 'Point', coordinates: [ -70.633627,-33.394842]}

})

await Modelos.Botillerias.create({
  nombre:"Celeste",
  direccion:"888",
  telefono:4,
  medio_pago:["transbank","efectivo","cheque"],
  suscripcion  :2,
  horarios  :["Lu a VI 12 a 00","SA 12 a 23"],
  fotos:[],
  ubicacion:{ type: 'Point', coordinates: [ -70.611264,-33.463330]}

})



await Modelos.Usuarios.create({
  correo:"jose@jose.cl",
  clave:"jose",
  nombre:"jose",
  apellido:"de la hoz",
  rol:1
})

await Modelos.Usuarios.create({
  correo:"manuel@manuel.cl",
  clave:"manuel",
  nombre:"manuel",
  apellido:"alba",
  rol:1
})

await Modelos.Usuarios.create({
  correo:"erick@erick.cl",
  clave:"erick",
  nombre:"erick",
  apellido:"carreno",
  rol:1
})

await Modelos.Usuarios.create({
  correo:"carlos@carlos.cl",
  clave:"carlos",
  nombre:"carlos",
  apellido:"godoy",
  rol:1
})

await Modelos.Usuarios.create({
  correo:"jonathan@jonathan.cl",
  clave:"jonathan",
  nombre:"jonathan",
  apellido:"frez",
  rol:1
})


await Modelos.Publicidades.create({

  botilleria_id:1,
    promocion:"2x1"

})

await Modelos.Publicidades.create({

  botilleria_id:2,
    promocion:"3x1"

})

await Modelos.Publicidades.create({

  botilleria_id:3,
    promocion:"4x1"

})

await Modelos.Publicidades.create({

  botilleria_id:4,
    promocion:"5x1"

})

await Modelos.Publicidades.create({

  botilleria_id:1,
    promocion:"3x2"

})


process.exit(1);


}
RUN()