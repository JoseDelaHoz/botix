const routes = {
  Transaction: {},
};


routes.Transaction[1] = {
  modulo: require("./modules/Nodos/tx_01_Sync/sync.js"),
  auth: true
};



routes.Transaction[2] = {
  modulo: require("./modules/Nodos/tx_02_Upload_info/upload.js"),
  auth: true
};

routes.Transaction[4] = {
  modulo:  require("./modules/Nodos/tx_04_Sonido/sonido.js"),
  auth: true
};
routes.Transaction[5] = {
  modulo: require("./modules/Nodos/tx_05_Upload_info/upload.js"),
  auth: true
};



export default routes.Transaction;
