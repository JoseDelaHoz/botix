//const  routes = require("../routes.js")
import routes from "../routes.js"
import HTTP_Resources from "./HTTP_Resources"
//const Resources = require("./HTTP_Resources")
const  Router = (app) => {
	Object.keys(routes.Resources).forEach((key) =>{ 
		var Funcion_Resources = (res,req,next)=>{
			HTTP_Resources(res, req, routes.Resources[key].modulo.default);
		}
		app.get("/" + key,  Funcion_Resources)
		app.get("/" + key+"/:id",   Funcion_Resources)
		app.post("/" + key,  Funcion_Resources)
		app.put("/" + key+"/:id",   Funcion_Resources)
		app.delete("/" + key+"/:id",  Funcion_Resources)

		//app.get("/" + key + "/:id",  Funcion_Resources)
	//	app.post("/" + key,  Funcion_Resources)
	//	app.put("/" + key,  Funcion_Resources)
	//	app.delete("/" + key,  Funcion_Resources)
	})
	Object.keys(routes.GET).forEach((key) =>{
   // console.log("routes",key)
		var Funcion_Process =  function (req,res){

			var send = (msg)=>{
				req.send(msg);
			}
			 let Modulo = routes.GET[key].modulo.default;
			 let body = res.query||{}

			 body.user_id=  req.session
			 let modulo = new Modulo(body)
			 modulo.send = (msg)=>{
			 	res.send(msg)
			 }

			 modulo.render()
			// req.send({status:"HOLA"})
		}
		app.get("/" + key, Funcion_Process )

		})
    Object.keys(routes.POST).forEach((key) =>{
   // console.log("routes",key)
		var Funcion_Process =  function (req,res){

			var send = (msg)=>{
				req.send(msg);
			}
			 let Modulo = routes.POST[key].modulo.default;
			 let body = req.body||{}
			 body.user_id=  req.session
			 let modulo = new Modulo(body)
		
			 modulo.res = res
			 modulo.req = req
			 modulo.send = (msg)=>{
			 	res.send(msg)
			 }

			 modulo.render()
			// req.send({status:"HOLA"})
		}
		app.post("/" + key, Funcion_Process )

		})
	Object.keys(routes.get).forEach((key) => app.get("/" + key, routes.get[key]))
	Object.keys(routes.post).forEach((key) => app.post("/" + key, routes.post[key]))
	Object.keys(routes.put).forEach((key) => app.put("/" + key, routes.put[key]))
	Object.keys(routes.delete).forEach((key) => app.delete("/" + key, routes.delete[key]))
}
module.exports = Router