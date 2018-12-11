import {Modelos} from "../database"
var request = require('request');
var jsdom = require("jsdom");
var querystring = require('querystring');
var { JSDOM } = jsdom;
var { window } = new JSDOM();
var JQ = require("jquery")(window);
var $ = JQ;


Date.prototype.addDays = function(days) {
    var date = new Date(this.valueOf());
    date.setDate(date.getDate() + days);
    return date;
}

let Scrapper =  async function (camaras){

    let Camara = await Modelos.Camaras.findOrCreate({where: {serie: camaras} })
    console.log(Camara)

    let Camaras_id  = Camara[0].dataValues.id

    console.log(Camaras_id)

    return await new Promise((RESOLVE,REJECT)=>{

        let headers = {
    'Connection': 'keep-alive',
    'Cache-Control': 'max-age=0',
    'Upgrade-Insecure-Requests': '1',
    'User-Agent': 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36',
    'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8',
    'Accept-Language': 'es-419,es;q=0.9',
};

let options = {
    url: 'https://www.eyesonhives.com/users/sign_in',
    headers: headers
};


let TOKEN = new Promise((resolve, reject) => {

function callback(error, response, body) {
    if (!error && response.statusCode == 200) {
       // console.log(body);
       let info ={ login:{} };
       info.login["user[email]"] = "malba@vilab.cl"
       info.login["user[password]"] = "mmae2010"
       info.login.authenticity_token = $(body).find("input[name='authenticity_token']").val();
       info.cookie = response.headers['set-cookie'][0];
       resolve(info);

    }
}

request(options, callback);

});


let ToApI = new Promise((resolve,reject) =>{

TOKEN.then((info)=>{

    let user = info.login;


    let dataString = querystring.stringify(user);

    dataString = `utf8=%E2%9C%93&${dataString}&user%5Bremember_me%5D=0&commit=Sign+in}`;


let headers = {
    'Connection': 'keep-alive',
    'Cache-Control': 'max-age=0',
    'Origin': 'https://www.eyesonhives.com',
    'Upgrade-Insecure-Requests': '1',
    'Content-Type': 'application/x-www-form-urlencoded',
    'User-Agent': 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36',
    'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8',
    'Referer': 'https://www.eyesonhives.com/users/sign_in',
    'Accept-Language': 'es-419,es;q=0.9',
    'Cookie': info.cookie
};


let options = {
    url: 'https://www.eyesonhives.com/users/sign_in',
    method: 'POST',
    headers: headers,
    body: dataString
};

function callback(error, response, body) {
    //if (!error && response.statusCode == 200) {
      //  console.log(body);
        info.cookie = response.headers['set-cookie'][0];

        resolve(info)
    //}
}

request(options, callback);



} )


})


ToApI.then((info) =>{


    let headers = {
        'Connection': 'keep-alive',
        'Cache-Control': 'max-age=0',
        'Upgrade-Insecure-Requests': '1',
        'User-Agent': 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36',
        'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8',
        'Accept-Language': 'es-419,es;q=0.9',
        'If-None-Match': 'W/"1c62d9c89fa9f381848e38c3648f7723"',
        'Cookie': info.cookie
    };


    let days = []


 


   

    //let dates = ["2018-09-28+13","2018-09-29+13"]

    let scrap = async () => {

            
    var inicio = new Date("2018-09-22");


    var fin = new Date();
     fin = `${fin.getFullYear()}-${fin.getMonth()+1<9 ? '0'+fin.getMonth() : fin.getMonth()+1 }-${fin.getDate()}`
     var  day = `${inicio.getFullYear()}-${inicio.getMonth()+1<9 ? '0'+inicio.getMonth() : inicio.getMonth()+1 }-${inicio.getDate()}`


    while (day != fin ){

        day = `${inicio.getFullYear()}-${inicio.getMonth()+1<9 ? '0'+inicio.getMonth() : inicio.getMonth()+1 }-${inicio.getDate()}`

     console.log("DAAY",day,fin)    
    let promesa =  new Promise((R,RR)=>{

    let options = {
        url: 'https://www.eyesonhives.com/hives/96/daily?time='+day+'+00%3A00%3A00+-0700',
        headers: headers
    };
    
    function callback(error, response, body) {
        if (!error && response.statusCode == 200) {
            let horas = JSON.parse(body);
            
            let ToSave = async ( horas ) =>{ 

            let registro =  await Modelos.CamarasRegistros.find({where :  {camara_id : Camaras_id , fecha :inicio } } )

            if ( registro == null){
                registro = await Modelos.CamarasRegistros.create()
                registro.camara_id = Camaras_id
                registro.fecha = inicio  
            }

            registro.serie = horas.counts
            registro.videos = horas.videos

            await registro.save()

        }

            ToSave(horas)

            setTimeout(function(){      R(horas)  }, 1000);
       


            // for(let hora of horas)
            //     console.log("h",hora)
            // let videos = JSON.parse(body).videos;
            //     for(let video of videos)
            //         console.log("v",video)

        }
    }
    
    request(options, callback);

    } )

   let Rt =  await (promesa);
   console.log("R",Rt)

    
    inicio = inicio.addDays(1)

    console.log("casiFIN")

    }

    console.log("FIN")


    
    }
    scrap();
})



    })

};

let camaras = [97,96,95,99]

//for(let camara of camaras)
Scrapper(99)
