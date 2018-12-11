export default function (req,res,Modulo){


	//console.log("res",res)

	console.log(Modulo)
	let body = {}
 	if(req.method == "GET")
		body = req.query
	else if(req.method == "POST" || req.method == "PUT"  )
		body = req.body


	body.user_id=  req.session

	let modulo = new Modulo(body)
	modulo.req = req
	modulo.res = res
	modulo.send = (msg)=>{
		res.send(msg)
	}
	if (req.params.id != undefined && req.method == "GET")
		modulo.get(req.params.id)
	else if(req.method == "GET")
		modulo.getAll()

	else if(req.method == "POST")
		modulo.new()
	else if(req.method == "PUT")
		modulo.update(req.params.id)

	else if(req.method == "DELETE")
		modulo.delete(req.params.id)

	

}