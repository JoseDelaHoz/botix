import Process from './Process'
import {SQL} from './database'
export default class Nodo  extends Process {
  constructor(props) {
    super(props)
    this.socket=props.socket
    this.nodo = props.nodo
  }

  longToByteArray (long,num) {
    var byteArray = new Array(num);
    console.log("time",long)
    for ( var index = 0; index < byteArray.length; index ++ ) {
        var byte = long & 0xff;
        byteArray [ index ] = byte;
        long = (long - byte) / 256 ;
    }
    console.log("num",byteArray)

    return byteArray;
}

   send(data){
   	
	
	this.socket.write(data)

	  	
  }
}
