import Resources from "../../system/Resources"
import {SQL,Modelos} from "../../system/database"
export default class Colmenas extends Resources{
	constructor(props){
		super(props)
	}

	get(id){

		SQL(`
		select id,nombre,apellido,correo,clave
			from usuarios where id=${+id}
		`).then(data => {  this.send(data[0] ) } )  
		
	}

	getAll(){
		SQL(`
		select id,nombre,apellido,correo,clave
			from usuarios
		`).then(data => {  this.send(data ) } )  

	
			
	}

	async new(){

		console.log("PROPS",this.props)

		let user = await Modelos.Usuarios.build()
		user.correo = this.props.email
		user.clave = this.props.passwd
		user.nombre = this.props.nombre
		user.apellido = this.props.apellido
		user.rol = 2 
		await user.save()

		this.send(user)

	}

	async update(id){

			let user = await Modelos.Usuarios.findById(id)

			user.nombre  = this.props.nombre
			user.apellido  = this.props.apellido
			user.correo= this.props.correo
			user.clave  = this.props.clave
			user.save()
			this.get(id)


	}

	async delete(id){

		await Modelos.Usuarios.destroy({where: { id :id } })
		this.send({})
	}





}
