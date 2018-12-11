import Resources from "../../../system/Resources"
import {SQL,Vilab} from "../../../system/database"
import {Kits} from "../../../system/kits"
export default class Predios extends Resources{
	constructor(props){
		super(props)
	}


	get(id){
   SQL(`SELECT  camaras_registros.* FROM  
    camaras_registros  where predio_id = ${+id} order by fecha `).then(data => {  this.send({data:data} )}) 
     
	}
	



}
