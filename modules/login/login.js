import Process from "../../system/Process"
import {SQL,Modelos} from "../../system/database"
import {getTokenPropio} from '../../system/jwt'

export default class Login extends Process{
	constructor(props){
		super(props)
	}
	async render(){

        console.log("props",this.props)
 
			let usuarios = await SQL(`select * from usuarios  where correo ='${this.props.email}' limit 1 `)
		let out ={login:false}
		if(!usuarios.length){
			this.send(out)
		}
		else if(usuarios[0].clave !=this.props.passwd){
			console.log(usuarios[0].clave,this.props.passwd)
			this.send(out)
		}
		else{
			out={login:true}
			out.user=usuarios[0]
			out.jwt = getTokenPropio({id:usuarios[0].id})
			this.send(out) 

		}

		
        
		}

}