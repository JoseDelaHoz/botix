"use strict";

var sequelize = global.sequelize;
var Sequelize = require('sequelize');
module.exports = sequelize.define("usuarios", {
  correo: Sequelize.TEXT,
  clave: Sequelize.TEXT,
  nombre: Sequelize.TEXT,
  apellido: Sequelize.TEXT,
  rol: Sequelize.INTEGER


});