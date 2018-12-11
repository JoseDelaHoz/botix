import Resources from "../../../../system/Resources"
import {SQL,Modelos} from "../../../../system/database"
export default class Usuarios extends Resources{
	constructor(props){
		super(props)
	}

	get(id){
		   SQL(`select 
usuarios.id,
usuarios.nombres,
usuarios.apellidos,
usuarios.passwd,
usuarios.rut,
usuarios.email,
usuarios.telefono,
t1.*
from usuarios left
join (
select array_to_json ( array_agg( json_build_object('id',grupos.id , 'nombre',grupos.nombre )  ) )  as grupos ,usuario_id  from roles_usuarios_grupos join  grupos on grupos.id = roles_usuarios_grupos.grupo_id GROUP BY usuario_id  ) as t1
on 
usuarios.id = t1.usuario_id
where usuarios.id =${+id}
 order by 1 desc 

`).then(data => {  this.send(data[0] ) } )  
     

	}

	getAll(){
   SQL(`select 
usuarios.id,
usuarios.nombres,
usuarios.passwd,
usuarios.apellidos,
usuarios.rut,
usuarios.email,
usuarios.telefono,
t1.*
from usuarios  left 
join (
select array_to_json ( array_agg( json_build_object('id',grupos.id , 'nombre',grupos.nombre )  ) )  as grupos ,usuario_id  from roles_usuarios_grupos join  grupos on grupos.id = roles_usuarios_grupos.grupo_id GROUP BY usuario_id  ) as t1
on 
usuarios.id = t1.usuario_id order by 1 desc 
`).then(data => {  this.send(data ) } )  
     
	}
	
	async new(){

		console.log("PROPS",this.props);
		let usuario = await Modelos.Usuarios.build()
  		usuario.nombres = this.props.nombres
  		usuario.apellidos = this.props.apellidos
  		usuario.rut = this.props.rut
  		usuario.passwd= this.props.passwd
  		usuario.email = this.props.email
  		usuario.telefono = this.props.telefono
  		usuario.rol_id = 2 

  		await usuario.save()


  		if ( this.props.grupos)
  		for (let grupo of this.props.grupos){

  			await Modelos.RolesUsuariosGrupos.create( {  usuario_id: usuario.id , grupo_id:grupo.id , rol_id : 1 })


  		}
		this.get(usuario.id)

	}
	async update(id){


		console.log("DATA",this.props)
		let usuario = await Modelos.Usuarios.findById(id)
  		usuario.nombres = this.props.nombres
  		usuario.apellidos = this.props.apellidos
  		usuario.rut = this.props.rut
  		usuario.email = this.props.email
  		usuario.telefono = this.props.telefono
  		if( this.props.passwd && this.props.passwd !="") 
  			usuario.passwd = this.props.passwd

  		await usuario.save()

  		await Modelos.RolesUsuariosGrupos.destroy({
			  where: {
			    usuario_id: id
			  }
			})

  		if ( this.props.grupos)
  		for (let grupo of this.props.grupos){

  			await Modelos.RolesUsuariosGrupos.create( {  usuario_id: id , grupo_id:grupo.id , rol_id : 1 })


  		}
		this.get(id)

	}
	async delete(id){

		await Modelos.RolesUsuariosGrupos.destroy({
		  where: {
		    usuario_id: id
		  }
		})

		let nodo = await Modelos.Usuarios.destroy({
			  where: {
			    id: id
			  }
			})
		this.send({})

	}


}
