import express from "express";
import sequilize from "./database";
import {getDataPropio } from "./jwt"
const bodyParser = require("body-parser");
const Router = require("./router.js");
const fileUpload = require('express-fileupload');

let app = express();

app.use('/files', express.static('files'));

app.use(fileUpload());
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
let BeforeAfter = function(req, res, next) {
	res.salida = res.send;
	res.setHeader("Access-Control-Allow-Origin", "*");
	res.setHeader("Access-Control-Allow-Credentials", "true");
	res.setHeader("Access-Control-Allow-Methods", "GET,HEAD,OPTIONS,POST,PUT,DELETE");
	res.setHeader("Access-Control-Allow-Headers", "Authorization, Access-Control-Allow-Headers, Origin,Accept, X-Requested-With, Content-Type, Access-Control-Request-Method, Access-Control-Request-Headers");

	let token = req.headers.token || req.headers.authorization || req.headers.Authorization;
	if (token) req.session = getDataPropio(token).id;


	console.log("USER",req.method,req.session)






  next();
};

app.use(BeforeAfter);

Router(app);

export default app;
