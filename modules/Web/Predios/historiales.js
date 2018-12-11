import Resources from "../../../system/Resources"
import {SQL} from "../../../system/database"
export default class Historial extends Resources{
	constructor(props){
		super(props)
	}

	get(id){

     
	}
	getAll(){
       //SQL(`select id,nombre,codigo,localidad,ubicacion,limites from predios`).then(this.send)

       SQL(`select tx,nodo_id,"createdAt" from conexiones where nodo_id in (8)  and predio_id = 1 order by "createdAt" desc limit 8`).then(this.send)


 /*      let Historial = [
       		{
       			id:1,
	       		icon:"gi gi-refresh",
	       		titulo:"Sincronizacion",
	       		msg:"Se ha sincronizado el nodo 5 a este predio con éxito",
	       		tiempo :"17:30 6/08/2018" },
	       				{
       			id:2,
	       		icon:"gi gi-refresh",
	       		titulo:"Sincronizacion",
	       		msg:"Se ha sincronizado el nodo 4 a este predio con éxito",
	       		tiempo :"17:39 6/08/2018"  },
       ]
       
       this.send(Historial)
      */

	}
	new(){

	}
	update(id){

	}
	delete(id){

		
	}


}