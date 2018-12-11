const Telegraf = require('telegraf')
const KEY= "646118655:AAEWEQI1msjn5XyMSK0NDdF5nWSK2pkM-QI"
let SEND =-277993990


const bot = new Telegraf(KEY)
// console.log("ACA","RUN")
// bot.start((ctx) => {


// 	console.log("OKA",ctx.update.message)
//   ctx.reply('Hola BeeWaze')
//   return 

// })

bot.startPolling()

export function Notificar(msg){
	return new Promise((resolve,reject)=>{ bot.telegram.sendMessage(SEND,msg).then(cx=>{ resolve(cx) } ) }) 
}



//Notificar('Arrancando Servicio')

export default bot