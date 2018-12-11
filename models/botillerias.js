"use strict";

var sequelize = global.sequelize;
var Sequelize = require('sequelize');
module.exports = sequelize.define("botillerias", {

  nombre: Sequelize.TEXT,
  telefono: Sequelize.TEXT,
  
  direccion: Sequelize.TEXT,
  
  medio_pago: Sequelize.JSON,
  horarios: Sequelize.JSON,
  suscripcion: Sequelize.INTEGER,
  fotos: Sequelize.JSON,
  ubicacion: Sequelize.GEOMETRY,


});