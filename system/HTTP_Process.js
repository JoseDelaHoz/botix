export default function (res,req,next,Modulo){

	let modulo = new Modulo({})
	modulo.componentWillMount()
	modulo.render(res.send)
	modulo.componentWillUnmount()

}