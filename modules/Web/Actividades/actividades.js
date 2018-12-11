import Resources from "../../../system/Resources"
import {SQL} from "../../../system/database"

export default class Actividades extends Resources{
	constructor(props){
		super(props)
	}

	getFull(id){

		let out = {}
		out.series = [{
              data: [1, 2, 3]
            },
            {
              data: [4, 2, 1]
            }],
		this.send(out)		


	}

	get(id){

		if (this.props.full!=undefined && this.props.full)
			{
				this.getFull(id)
			}
	else{
		
		let out = {}

		out.series = [{
              data: [1, 2, 3]
            }],
		this.send(out)

		}
     
	}
	getAll(){
       //SQL(`select id,nombre,codigo,localidad,ubicacion,limites from predios`).then(this.send)

       let variables = [
       		{
       			id:1,
	       		variable:"Temperatura",
	       		unidad:"ºC",
	       		valor:20,
	       		msg :"actualizado hace 8 minutos" },
       		{
       			id:2,
	       		variable:"Humedad",
	       		unidad:"%",
	       		valor:80,
	       		msg :"actualizado hace 8 minutos" },
       		{
       			id:3,
	       		variable:"Peso",
	       		unidad:"Kg",
	       		valor:20,
	       		msg :"actualizado hace 8 minutos" },
       ]
       
       this.send(variables)

	}
	new(){

	}
	update(id){

	}
	delete(id){

		
	}


}