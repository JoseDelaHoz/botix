import Resources from "../../../../system/Resources"
import {SQL,Modelos} from "../../../../system/database"
export default class Grupos extends Resources{
	constructor(props){
		super(props)
	}

	get(id){

   SQL(`select grupos.id,grupos.nombre,t1.predios from grupos join  
( select  array_to_json ( array_agg( json_build_object('id',predios.id , 'nombre',predios.nombre )  ) )  as predios,grupo_id from grupos_predios join predios on predios.id = grupos_predios.predio_id GROUP BY grupo_id ) as t1
on  grupos.id = t1.grupo_id  where id=${+id}   `).then(data => {  this.send(data[0] ) } )  

	}


	getAll(){
   SQL(`select grupos.id,grupos.nombre,t1.predios from grupos join  
( select  array_to_json ( array_agg( json_build_object('id',predios.id , 'nombre',predios.nombre )  ) )  as predios,grupo_id from grupos_predios join predios on predios.id = grupos_predios.predio_id GROUP BY grupo_id ) as t1
on  grupos.id = t1.grupo_id  order by grupos.id desc   `).then(data => {  this.send(data ) } )  
     
	}

	async update(id){
		let grupo = await Modelos.Grupos.findById(id)
		grupo.nombre = this.props.nombre
    	await grupo.save()
	  	await Modelos.GruposPredios.destroy({
				  where: {
				    grupo_id: id
				  }
				})

  		for (let predio of this.props.predios){

  			await Modelos.GruposPredios.create( {  grupo_id: id , predio_id:predio.id })


  		}
		this.get(id)
	}

    async new(){
		let grupo = await Modelos.Grupos.build()
		grupo.nombre = this.props.nombre
    	await grupo.save()

  		for (let predio of this.props.predios){

  			await Modelos.GruposPredios.create( {  grupo_id: grupo.id , predio_id:predio.id })


  		}
		this.get(grupo.id)
	}

	async delete(id){

			await Modelos.GruposPredios.destroy({
				  where: {
				    grupo_id: id
				  }
				})

		 await Modelos.RolesUsuariosGrupos.destroy({
			  where: {
			    grupo_id: id
			  }
			})

		 this.send({})



	}

	



}
