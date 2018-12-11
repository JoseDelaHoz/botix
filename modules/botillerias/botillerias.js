import Resources from "../../system/Resources"
import {SQL,Modelos} from "../../system/database"
export default class Botillerias extends Resources{
	constructor(props){
		super(props)
	}



	getAll(){

		SQL(`select id,nombre,telefono,direccion,medio_pago,horarios,suscripcion,fotos,promociones,ubicacion from botillerias
		left join 
		 ( select json_agg(promocion) as promociones,botilleria_id from publicidades GROUP BY botilleria_id ) as t1 
		 on
		 t1.botilleria_id = botillerias.id order by 1`).then(this.send)
	}
	

	async delete(id){


		 await Modelos.Comentarios.destroy({ where: { botilleria_id  : id }})
		 await Modelos.Botillerias.destroy({where :{ id:id } })
		 this.send({})

	}

	async update(id){

		let botilleria  = await Modelos.Botillerias.findById(id)
		botilleria.nombre = this.props.nombre
		botilleria.telefono = this.props.telefono
		botilleria.medio_pago = this.props.medio_pago
		botilleria.direccion = this.props.direccion
		botilleria.horarios = this.props.horarios
		botilleria.suscripcion = this.props.suscripcion
		botilleria.ubicacion = this.props.ubicacion

		await botilleria.save()

		if(this.props.promociones){


		await Modelos.Publicidades.destroy({ where : {botilleria_id: id }  })

		for(let promocion of this.props.promociones ) {
			await Modelos.Publicidades.create({ botilleria_id: id , promocion :promocion  })
		}

		}
	

		this.send({})

	}


	async new(){
		console.log("PROPS",this.props)

	    let botilleria  = await Modelos.Botillerias.build()
		botilleria.nombre = this.props.nombre
		botilleria.telefono = this.props.telefono
		botilleria.medio_pago = this.props.medio_pago
		botilleria.direccion = this.props.direccion
		botilleria.horarios = this.props.horarios
		botilleria.suscripcion = this.props.suscripcion
		botilleria.ubicacion = this.props.ubicacion

		await botilleria.save()

		if(this.props.promociones){


		await Modelos.Publicidades.destroy({ where : {botilleria_id: id }  })

		for(let promocion of this.props.promociones ) {
			await Modelos.Publicidades.create({ botilleria_id: id , promocion :promocion  })
		}

		}

		this.send({})
	}

	



}
