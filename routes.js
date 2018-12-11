var routes = {
  get: {},
  post: {},
  delete: {},
  put: {},
  sockets: {},
  GET: {},
  POST: {},
  DELETE: {},
  PUT: {},
  SOCKETS: {},
  Resources: {},

};


routes.Resources["botillerias"] = {
  modulo: require("./modules/botillerias/botillerias.js"),
  auth: true
};



routes.Resources["comentarios"] = {
  modulo: require("./modules/comentarios/comentarios.js"),
  auth: true
};



routes.Resources["usuarios"] = {
  modulo: require("./modules/usuarios/usuarios.js"),
  auth: true
};



routes.POST["login"] = {
  modulo: require("./modules/login/login.js"),
  auth: true
};

routes.POST["passwd"] = {
  modulo: require("./modules/login/passwd.js"),
  auth: true
};







export default routes;
