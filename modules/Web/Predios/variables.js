import Resources from "../../../system/Resources"
import {SQL} from "../../../system/database"
export default class Variables extends Resources{
	constructor(props){
		super(props)
	}

	getFull(id){

		let out = {}
		SQL(`select  valor,custom,"createdAt",utilidad_id from registros  where "createdAt" >= TO_DATE('01/11/2018', 'DD/MM/YYYY')  and nodo_id =${+id} and
(                    ( valor < 1001 and valor > 0   )   or (custom is not null)  or (utilidad_id = 3 and valor > 1000000 and valor < 90000000)  ) order by  "createdAt" asc`).then(
			datos => {
				out.data = datos
				console.log("NODE",id);
				if (  +id == 7 ){
				  SQL(`select  valor,custom,"createdAt",utilidad_id from registros  where "createdAt" >= TO_DATE('01/11/2018', 'DD/MM/YYYY')  and nodo_id =8 and utilidad_id = 3  order by  "createdAt" asc`).then(
        		                datas =>{	
						out.data = out.data.concat(datas)

						this.send(out)
							
						}	) 

				}
				else
        	 
					this.send(out)
			}
		)
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
