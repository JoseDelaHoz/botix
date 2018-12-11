var ldap = require('ldapjs');
var sequilize = require("../system/sequelize.js");
var modelos = require("../models/run.js");

var client = ldap.createClient({
  url: 'ldap://127.0.0.1:389'
});

rut = process.argv[2]


modelos.Usuarios.findOne({
        where: { rut : rut }
      }).then(user=>{


user = user.dataValues

console.log("user",user)


client.bind('cn=admin,dc=ldap,dc=eit,dc=cl', 'piGmaleon12$%', function(err) {
 // assert.ifError(err);
       if (err){ 
	console.log("ACA")
	return (err);}

 //console.log("nones",client);
        let newUser = {
          gidnumber: "500",
          givenname: user.nombres,
          homedirectory: ["/home/alumnos/"+rut],
          loginshell: "/bin/bash",
          objectclass: ["inetOrgPerson", "posixAccount", "top"],
          sn: user.apellidos,
          uid:  user.rut,
          uidnumber: (2000+user.id).toString(),
          userpassword: user.passwd
        };


        client.add('cn='+user.rut+',cn=semestre1,ou=EIT2018-1,dc=ldap,dc=eit,dc=cl',         
          newUser,
          (err, response) => {
            if (err){
		 console.log("DI UN ERROR",err,response);
		 return (err);}
         console.log("nope",response);
           process.exit(1);
            return (response);
          }
        );

});

})
