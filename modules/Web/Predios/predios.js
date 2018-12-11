import Resources from "../../../system/Resources"
import {SQL,Vilab} from "../../../system/database"
import {Kits} from "../../../system/kits"
export default class Predios extends Resources{
	constructor(props){
		super(props)
	}


	get(id){
   SQL(`select predios.id,predios.nombre,predios.codigo,predios.localidad,predios.ubicacion,predios.limites from predios join 
(select predio_id from grupos_predios join roles_usuarios_grupos on grupos_predios.grupo_id= roles_usuarios_grupos.grupo_id
where roles_usuarios_grupos.usuario_id = ${this.props.user_id} and predio_id = ${id}  group by predio_id) as habilitados on habilitados.predio_id = predios.id   limit 1`).then((predio)=>{
  this.ConsulasClimaticas(predio).then(data => {  this.send(data[0])})  })
     
	}
	getAll(){
       SQL(`select predios.id,predios.nombre,predios.codigo from predios join 
(select predio_id from grupos_predios join roles_usuarios_grupos on grupos_predios.grupo_id= roles_usuarios_grupos.grupo_id
where roles_usuarios_grupos.usuario_id = ${this.props.user_id} group by predio_id) as habilitados on habilitados.predio_id = predios.id  `).then(this.send)    
 
	}
	new(){

	}
	update(id){

	}
	delete(id){

		
	}
  getKits(ID){
    return  SQL(`select nodos.id from nodos join colmenas on colmenas.id = nodos.colmena_id where predio_id = ${ID}`)
  }
  ConsulasClimaticas(predios){


    let promesas = []
    let out = []
     for(let predio of predios ){
        // console.log("PR",predio);
        let info = {}
        info.id = predio.id
        info.nombre = predio.nombre
        info.codigo = predio.codigo
        info.ubicacion = predio.codigo
        info.localidad = predio.localidad
        info.ubicacion = predio.ubicacion
        info.limites   = predio.limites
        out.push(info)
        promesas.push(Vilab(`select ema_id,ROUND(CAST(ST_DistanceSphere(ema_ubicacion,point)/1000 As numeric),2) AS distancia from emas, (SELECT hom_id,point FROM homogenea,(SELECT ST_GeomFromText('POINT(${predio.ubicacion.coordinates.join(" ")})',4326) AS point) AS new WHERE ST_Intersects(new.point,hom_area) = 't') as new where ema_homid=hom_id and ema_estado=1 order by 2 limit 1 `) )
      }
      let consultas = {
        1:"temperatura",
        4:"precipitaciones",
        5:"humedad",
        7:"radiacion",
        8:"viento",
        9:"viento_direccion"
      }

/*      consultas = {
        100:"temperatura",
        112:"precipitaciones",
        106:"humedad",
        7:"radiacion",
        103:"viento",
        104:"viento_direccion"
      }
*/
    return new Promise((Resolve,Reject)=> {
    Promise.all(promesas).then(values => { 
      let nuevas_promesas=[]
      for(let ix in promesas){
        let prom;
        prom = new Promise((resolve,reject)=> {
          let db_info = []
          for( let tipo of Object.keys(consultas)){
            let promesa = promesas[ix]
            db_info.push( Vilab(`select api_cixind, api_valor,api_tipid from api where api_emaid=${promesa._rejectionHandler0[0].ema_id} and api_tipid=${tipo} and api_hist=1 order by 1 desc limit 1`)  ) 
  /*  
          db_info.push( Vilab(`select to_char(clp_fechora, 'dd/mm/yy') as fecha,clp_tipid  as api_tipid,
            to_char(clp_fechora, 'HH24:MI') as hora,clp_valor as api_valor,
            DATE_PART( 'day', clp_fechora-  DATE (now() ::timestamp AT TIME ZONE '-3')  ) as delta 
            from clipro where clp_proid = 1 and clp_emaid = ${promesa._rejectionHandler0[0].ema_id} and (clp_tipid =${tipo} )
             and mod(EXTRACT(HOUR from  clp_fechora )::int, 2)  =0 and  
             clp_fechora >= (now()::timestamp  AT TIME ZONE '-3'- interval '2 hour') 
             and  clp_fechora < (now()::timestamp  AT TIME ZONE '-3' + interval '3 day') 
               ORDER BY clp_fechora limit 1`)  ) 
          */ 
          }
          if ( this.props.full) 
             db_info.push(this.getKits(predios[0].id))
          Promise.all(db_info).then(values => {  
              //console.log("VA",values)

            resolve(values)          })
        })
        nuevas_promesas.push(prom)
      }
      Promise.all(nuevas_promesas).then(values => {
          
        for(let ix in values){
          let info = out[ix]
          if (this.props.full){
            let nodos = values[ix][values[ix].length-1]
            console.log("nodos",nodos.length)
            values[ix].pop()
            info.kits=nodos.length
            info.kit_temperatura=0
            info.kit_humedad=0
            if (nodos.length > 0 ){
	   console.log("NODOS",nodos)
            for(let nodo of nodos){
              let kit = Kits[+nodo.id]
              info.kit_temperatura+=kit.temperatura
              info.kit_humedad+=kit.humedad
            }
            info.kit_temperatura/=info.kits
            info.kit_humedad/=info.kits
            
          }

            

          }
         

          for(let data of values[ix]){
             
              info[consultas[+data[0].api_tipid]] = data[0].api_valor||0
             
          }


        }
        Resolve(out) 
      })
    });

    } )

  }




}
