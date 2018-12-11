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

			this.send("186.64.121.135")
		}

}