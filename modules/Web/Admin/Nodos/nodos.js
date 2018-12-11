import Resources from "../../../../system/Resources"
import {SQL,Modelos} from "../../../../system/database"
export default class Nodos extends Resources{
	constructor(props){
		super(props)
	}

	get(id){

	 SQL(`SELECT nodos.id,nodos.microcontrolador,nodos.mac,nodos.imei,concat(  colmenas.id,' ',colmenas.serie,' / ' , predios.nombre) as colmena ,colmenas.serie,colmenas.id as colmena_id from nodos join colmenas on nodos.colmena_id = colmenas.id join predios on predios.id = colmenas.predio_id  where nodos.id = ${+id}`).then(data => {  this.send(data[0] ) } )  

	}

	getAll(){
   SQL(`SELECT nodos.id,nodos.microcontrolador,nodos.mac,nodos.imei,concat(  colmenas.id,' ',colmenas.serie,' / ' , predios.nombre) as colmena ,colmenas.serie,colmenas.id as colmena_id from nodos join colmenas on nodos.colmena_id = colmenas.id join predios on predios.id = colmenas.predio_id order by nodos.id desc`).then(data => {  this.send(data ) } )  
     
	}
	async new(){
		 console.log("PREDIO",this.props)

        let nodo = await Modelos.Nodos.build();
  		nodo.microcontrolador=this.props.microcontrolador
  		nodo.mac = this.props.mac
  		nodo.imei = this.props.imei
  		nodo.colmena_id = this.props.colmena_id
  		nodo.configuracion = {"sync":{"minuto":1,"cantidad":2}}
  		nodo.enable = true
  		nodo.online = true 
        await nodo.save()
		this.get(nodo.id)
	}
	async update(id){


		let nodo = await Modelos.Nodos.findById(id);


  		nodo.microcontrolador=this.props.microcontrolador
  		nodo.mac = this.props.mac
  		nodo.imei = this.props.imei
  		nodo.colmena_id = this.props.colmena_id
        await nodo.save()
		this.get(id)

	}
	async delete(id){

		let nodo = await Modelos.Nodos.destroy({
			  where: {
			    id: id
			  }
			})
		this.send({})

	}
	


	



}
