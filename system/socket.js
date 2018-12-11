import Router from './router_socket'
const net = require("net");
const HOST = "0.0.0.0";
const PORT = 16027;




 net.createServer(function(sock) {
          console.log("CONNECTED: " + sock.remoteAddress + ":" + sock.remotePort);
         
          sock.on("close", function(data) {
            console.log("CLOSED: " + sock.remoteAddress + " " + sock.remotePort);
          });

          sock.on("error", () => console.log("errored"));
          Router(sock)

        })
        .listen(+(PORT), HOST);
console.log("Conexion lista para " + HOST + ":" + (PORT ));

export default net