import Resources from "../../../../system/Resources"
import {Kits} from "../../../../system/kits"
import {SQL,Modelos} from "../../../../system/database"
export default class Colmenas extends Resources{
	constructor(props){
		super(props)
	}

	get(id){
   		SQL(`SELECT colmenas.id,colmenas.color, colmenas.serie,predios.nombre,colmenas.ubicacion ,predios.id as predio_id from colmenas join predios on  predios.id = colmenas.predio_id  where colmenas.id = ${+id} order by 1`).then(data => {  this.send(data[0] ) } )  

	}

	getAll(){
   SQL(`SELECT colmenas.id,colmenas.color, colmenas.serie,predios.nombre,colmenas.ubicacion ,predios.id as predio_id from colmenas join predios on  predios.id = colmenas.predio_id order by 1 desc`).then(data => {  this.send(data ) } )  
     
	}
	
	async update(id){
		let colmena = await Modelos.Colmenas.findById(id)
		colmena.color = this.props.color
		colmena.serie = this.props.serie
		colmena.predio_id = this.props.predio_id
		colmena.localidad = this.props.localidad

		let ubicacion = { type: 'Point', coordinates: this.props.ubicacion.coordinates }  
		colmena.ubicacion = ubicacion

    	await colmena.save()
		this.get(id)
	}

	async new(id){
		let colmena = await Modelos.Colmenas.build()
		colmena.color = this.props.color
		colmena.serie = this.props.serie
		colmena.predio_id = this.props.predio_id
		colmena.localidad = this.props.localidad

		let ubicacion = { type: 'Point', coordinates: this.props.ubicacion.coordinates }  
		colmena.ubicacion = ubicacion

    	await colmena.save()
		this.get(colmena.id)
	}

	async delete(id){

	let colmena = await Modelos.Colmenas.destroy({
			  where: {
			    id: id
			  }
			})
		this.send({})
	}



}
