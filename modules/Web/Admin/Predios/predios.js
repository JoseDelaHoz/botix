import Resources from "../../../../system/Resources"
import {SQL,Modelos} from "../../../../system/database"
export default class Predios extends Resources{
	constructor(props){
		super(props)
	}

	get(id){

		SQL(`SELECT predios.id, predios.nombre,predios.codigo,predios.localidad,predios.ubicacion from predios  where id=${+id} order by 1  desc`).then(data => {  this.send(data[0] ) } )  
	}


	getAll(){
   SQL(`SELECT predios.id, predios.nombre,predios.codigo,predios.localidad,predios.ubicacion from predios order by 1  desc`).then(data => {  this.send(data ) } )  
     
	}

	async new(){

		let predio = await Modelos.Predios.build();
		predio.nombre = this.props.nombre
		predio.codigo = this.props.codigo
		predio.localidad = this.props.localidad

		let ubicacion = { type: 'Point', coordinates: this.props.ubicacion.coordinates }  
		predio.ubicacion = ubicacion

		await predio.save()
		this.get(predio.id)

	}
	async update(id){


		let predio = await Modelos.Predios.findById(id);

		predio.nombre = this.props.nombre
		predio.codigo = this.props.codigo
		predio.localidad = this.props.localidad

		let ubicacion = { type: 'Point', coordinates: this.props.ubicacion.coordinates }  
		predio.ubicacion = ubicacion

		await predio.save()
		this.get(id)

	}
	async delete(id){

	     await Modelos.Colmenas.update({predio_id :null },{
				  where: {
				    predio_id: id
				  }
				})

		let nodo = await Modelos.GruposPredios.destroy({
			  where: {
			    predio_id: id
			  }
			})
	await Modelos.Predios.destroy({
			  where: {
			    id : id
			  }
			})
		this.send({})

	}
	



}
