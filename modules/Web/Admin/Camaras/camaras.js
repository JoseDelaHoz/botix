import Resources from "../../../../system/Resources"
import {SQL,Modelos} from "../../../../system/database"
export default class Camaras extends Resources{
	constructor(props){
		super(props)
	}

	get(id){
   SQL(`SELECT camaras.id, camaras.serie,predios.nombre as predio,camaras.colmena_id, predios.id as predio_id from colmenas join predios on colmenas.predio_id = predios.id  join camaras on  camaras.colmena_id = colmenas.id where camaras.id = ${+id} order by camaras.id desc  `).then( data => {  this.send(data[0] ) } )  
     
	}

	getAll(){
   SQL(`SELECT camaras.id, camaras.serie,predios.nombre as predio, predios.id as predio_id,camaras.colmena_id from colmenas join predios on colmenas.predio_id = predios.id  join camaras on  camaras.colmena_id = colmenas.id order by camaras.id desc  `).then( data => {  this.send(data ) } )  
     
	}
	

	async update(id){
		let camara = await Modelos.Camaras.findById(id)
		camara.serie = +this.props.serie
		camara.colmena_id = this.props.colmena_id
		await camara.save()
		this.get(id)
	}

	async new(){

	    let camara = await Modelos.Camaras.build()
		camara.serie = +this.props.serie
		camara.colmena_id = this.props.colmena_id
		await camara.save()
		this.get(camara.id)

	}

	async delete(id){

		await Modelos.Camaras.destroy({
		  where: {
		    id: id
		  }
		})
		this.send({})

	}



}
