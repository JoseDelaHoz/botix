"use strict";

var modelos = {};

modelos.Botillerias = require("./botillerias.js");
modelos.Comentarios = require("./comentarios.js");
modelos.Publicidades = require("./publicidades.js");
modelos.Usuarios = require("./usuarios.js");


modelos.Comentarios.belongsTo(modelos.Botillerias, {
  foreignKey: "botilleria_id",
  as: "botelleria"
});

modelos.Comentarios.belongsTo(modelos.Usuarios, {
  foreignKey: "usuario_id",
  as: "usuario"
});

modelos.Publicidades.belongsTo(modelos.Botillerias, {
  foreignKey: "botilleria_id",
  as: "botillerias"
});


module.exports = modelos;