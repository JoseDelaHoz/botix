import Process from "../../system/Process"
import {SQL,Modelos} from "../../system/database"
import {Notificar} from "../../system/Telegram"
import {getTokenPropio} from '../../system/jwt'

const Sequelize = require('sequelize');
const {or} = Sequelize.Op;
export default class Login extends Process{
	constructor(props){
		super(props)
	}
	async render(){

		let {user, passwd} =this.props

		let User = await  Modelos.Usuarios.findOne({attributes:["id","nombres","apellidos","passwd","rol_id"], where:{  [or]: {rut:  user , email:user } } } )

		if (!User)
			this.send({login:false})
		else if ( User.passwd != passwd)
			this.send({login:false})
		let out = {user:{}}
		out.user.nombres= User.nombres
		out.user.apellidos=User.apellidos
		out.user.rol_id=User.rol_id
		out.jwt = getTokenPropio({id:User.id})
		out.login=true

		this.send(out)
		Notificar(`${User.nombres} ${User.apellidos} ha iniciado session`)

		}

}