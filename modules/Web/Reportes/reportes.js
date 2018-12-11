import Resources from "../../../system/Resources"
import {SQL} from "../../../system/database"
export default class Reportes extends Resources{
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
     
	}
	getAll(){     
       SQL(`select * from reportes where usuario_id = ${this.props.user_id}`).then(this.send)
	}
	new(){

	}
	update(id){

	}
	delete(id){

		
	}


}