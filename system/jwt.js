var jwtSecret = "ViLaBesLaLUZ"
const jwt = require('jsonwebtoken');
export function getTokenPropio(data) {
	return jwt.sign(data, jwtSecret, {
		expiresIn: '3m'
	});
}
export function  getToken(data,jwtSecret) {

	return jwt.sign(data, jwtSecret, {
		expiresIn: '1h'
	});

}


export function getData(token,jwtSecret) {
	return jwt.decode(token, jwtSecret);
}

export function getDataPropio(token) {
	return jwt.decode(token, jwtSecret);
}
