"use strict";

var sequelize = global.sequelize;
var Sequelize = require('sequelize');
module.exports = sequelize.define("publicidades", {
  promocion: Sequelize.TEXT,
  duracion: Sequelize.DATE,


});