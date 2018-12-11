import Resources from "../../../system/Resources"
import {SQL} from "../../../system/database"
import {Kits} from "../../../system/kits"

export default class kits extends Resources{
	constructor(props){
		super(props)
	}
	get(id){
    
	}
	

	getAll(){
		console.log("ACA",this.props);
       SQL(`select nodos.id,colmenas.color,colmenas.serie,colmenas.ubicacion from nodos join colmenas on colmenas.id = nodos.colmena_id
where colmenas.predio_id = ${this.props.predio_id  } order by colmenas.serie`).then(kits => {
	let out = []
	for(let kit of kits){
		let data = { db: kit,last:Kits[kit.id.toString()] }
		out.push(data)
	}



	this.send(out) })

	}
	new(){

	}
	update(id){

	}
	delete(id){

		
	}


}