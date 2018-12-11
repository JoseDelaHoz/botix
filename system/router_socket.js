//const  routes = require("../routes.js")
// import routes from "../routes_.js"
// import HTTP_Resources from "./HTTP_Resources"

import Routes from '../router_socket'
import {SQL,Modelos} from './database'
const  Router = (socket) => {
	  socket.on("data", data => {
      // try {


        console.log("DATA",data.toString())

        // socket.write("A")




       let MAC = `${String.fromCharCode(data[0])}${String.fromCharCode(data[1])}${String.fromCharCode(data[2])}${String.fromCharCode(data[3])}${String.fromCharCode(data[4])}${String.fromCharCode(data[5])}`
        MAC = `${MAC}${String.fromCharCode(data[6])}${String.fromCharCode(data[7])}${String.fromCharCode(data[8])}${String.fromCharCode(data[9])}${String.fromCharCode(data[10])}${String.fromCharCode(data[11])}`
      let option = +`${String.fromCharCode(data[12])}`;
     
      console.log("OPCION :  ",option,MAC);

      if (Routes[option] == undefined) {
        socket.write("-1");
        return;
      } else {
        SQL(`select nodos.*,colmenas.predio_id from nodos join colmenas on colmenas.id = nodos.colmena_id where nodos.mac =  '${MAC}' limit 1`).then( nodos =>{
        let Nodo = nodos[0]
        let Data = "" + data;
        Data = Data.substr(13);

        Modelos.Conexiones.create({tx:option,nodo_id:Nodo.id,predio_id:Nodo.predio_id ,ip :socket._peername.address ,data:data})
        const modulo = new  Routes[option].modulo.default({ data:data,nodo_id : Nodo.id,nodo:Nodo , socket:socket,raw:data })
        modulo.componentWillMount()
        modulo.render()
        modulo.componentWillUnmount()

        })

      }
      //  } catch (error) {
      //    socket.write("-2");
      //  }


      


    });


}
module.exports = Router