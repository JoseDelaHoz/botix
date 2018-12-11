"use strict";

var sequelize = global.sequelize;
var Sequelize = require('sequelize');
module.exports = sequelize.define("comentarios", {
  
  comentarios: Sequelize.TEXT,
  estrellas: Sequelize.INTEGER,

});