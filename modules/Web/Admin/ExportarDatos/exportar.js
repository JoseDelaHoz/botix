import Resources from "../../../../system/Resources"
import {Kits} from "../../../../system/kits"
import {SQL,Modelos} from "../../../../system/database"
export default class Exportar extends Resources{
	constructor(props){
		super(props)
	}

	get(id){

		SQL(`select nodos.id from nodos where colmena_id = ${+id} limit 1`).then((nodos) => {
			let nodo = nodos[0]

			let url ='/files/excels/nodos/nodo'+nodo.id+'.xlsx'

	
			 this.res.redirect(url)

			})
	}


	get2(id){

		var fs = require('fs');

		let name ="nodo6"
		var obj = JSON.parse(fs.readFileSync(`files/nodos/${name}.json`, 'utf8'));

		let registros = obj.RECORDS.reverse()

		let resultados = { temperaturas:[],humedad:[] ,peso:[] , sonido:[]  }
		let last_time = new Date();
		let position = 0

		for (let registro of registros){
		let fecha =  registro.createdAt.split(".")[0].split(":")
		fecha.pop()

		dias = fecha[0].split("/")

		fecha = `${dias[1]}/${dias[0]}/${dias[2]}:${fecha[1]}`

		//console.log(fecha)


		let time2 = time = ( Date.parse(fecha) )
		//console.log(fecha,time,registro.utilidad_id)

		//console.log("HALF",time,last_time)
		if ( registro.utilidad_id == 4 && time == last_time){
		++position  
		}
		else if ( position != 0   && time == last_time) {


		}
		else{

		last_time = time
		position=0

		}




		var HALF_HOUR = position*30 * 60 * 1000;
		time = time- HALF_HOUR-  3600000*3

		time = new Date(time)
		let time3 = time.toString().replace("GMT-0300 (GMT-03:00)","")

		let valor = registro.valor


		if (registro.utilidad_id==1){

		resultados.temperaturas.push({time: time3 ,id :registro.id,valor : valor/10,timestamp:+time/10000 })
		}
		if (registro.utilidad_id==2){

		resultados.humedad.push({time: time3 ,id :registro.id,valor : valor /10 ,timestamp:+time/10000 })
		}
		if (registro.utilidad_id==3){

		resultados.peso.push({time: time3 ,id :registro.id,valor : +valor ,timestamp:+time/10000 })
		}
		if (registro.utilidad_id==4){

		resultados.sonido.push({time: time3 ,id :registro.id,valor : registro.custom ,timestamp:+time/10000 })
		}
		if (registro.id =='21505' ){
		//    console.log("R",{time: time.toString() ,id :registro.id,valor : valor },time,last_time,position,registro.createdAt,new Date(time2).toString(),fecha)
		}
		if (registro.id =='23801' ){
		//  console.log("R",{time: time.toString() ,id :registro.id,valor : valor },time,last_time,position,registro.createdAt,new Date(time2).toISOString(),fecha)
		}

		}

		resultados.temperaturas = resultados.temperaturas.reverse()
		resultados.humedad = resultados.humedad.reverse()
		resultados.peso = resultados.peso.reverse()
		resultados.sonido = resultados.sonido.reverse()
		var Excel = require('exceljs');
		var workbook = new Excel.Workbook();
		var sheet = workbook.addWorksheet('Temperatura');
		sheet.columns = [
		{ header: 'Fecha', key: 'time', width: 50 },

		{ header: 'Valor', key: 'valor', width: 32 },
		];
		sheet.addRows(resultados.temperaturas);

		var sheet = workbook.addWorksheet('Humedad');
		sheet.columns = [
		{ header: 'Fecha', key: 'time', width: 50 },

		{ header: 'Valor', key: 'valor', width: 32 },
		];
		sheet.addRows(resultados.humedad);

		var sheet = workbook.addWorksheet('Peso');
		sheet.columns = [
		{ header: 'Fecha', key: 'time', width: 50 },

		{ header: 'Valor', key: 'valor', width: 32 },
		];

		sheet.addRows(resultados.peso);
		var sheet = workbook.addWorksheet('Sonido');
		sheet.columns = [
		{ header: 'Fecha', key: 'time', width: 50 },

		{ header: 'Valor', key: 'valor', width: 32 },
		];

		sheet.addRows(resultados.sonido);
		// for ( resultado of resultados.temperaturas){
		//     console.log("R",resultado)

		// }



		workbook.xlsx.writeFile(`excel/${name}.xlsx`).then(function() {
		console.log("saved");
		});


   		
   		this.send("HOLA")

	}




}
