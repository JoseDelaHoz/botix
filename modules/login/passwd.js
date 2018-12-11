import Process from "../../system/Process"
import {SQL,Modelos} from "../../system/database"
export default class Passwd extends Process{
	constructor(props){
		super(props)
	}
	async render(){

        console.log("props",this.props)
 
			let usuario = await Modelos.Usuarios.findById(this.props.user_id)

			usuario.clave=this.props.passwd

			await usuario.save()
			this.send({status:true})




		

		
        
		}

}