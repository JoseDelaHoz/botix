import Resources from "../../system/Resources"
import {SQL,Modelos} from "../../system/database"
export default class Comentarios extends Resources{
	constructor(props){
		super(props)
	}


	getAll(){
			SQL(`
			select nombre,apellido,comentarios,estrellas  from comentarios
				join usuarios on  comentarios.usuario_id = usuarios.id 
				where botilleria_id = ${+this.props.botilleria_id}	
			`).then(data => {  this.send(data ) } )  
				
	}

	async new(){


		console.log("PTOPS",this.props)

		let comentario = await  Modelos.Comentarios.build()
		comentario.comentarios = this.props.comentario
		comentario.botilleria_id = this.props.botilleria_id
		comentario.usuario_id = this.props.user_id
		await comentario.save()
		this.send(this.props)

	}
	
	



}
