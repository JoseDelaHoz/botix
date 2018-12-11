const Sequelize = require('sequelize');

const Ssequelize = new Sequelize("postgres://postgres:123456@127.0.0.1:5432/botix");

// const Ssequelize = new Sequelize("test", "postgres", "mmae2010", {
//     host: 'test.cm44ppow3nb6.us-west-1.rds.amazonaws.com',
//     port: 5432,
//     logging: console.log,
//     maxConcurrentQueries: 100,
//     dialect: 'postgres',
//     dialectOptions: {
//         ssl:'Amazon RDS'
//     },
//     pool: { maxConnections: 5, maxIdleTime: 30},
//     language: 'en'
// })


//const Ssequelize = new Sequelize('sqlite:dbname.db');

global.sequelize=Ssequelize
const models={}
Object.assign(models,require('../models/run.js'))

global.models= models
//export sequelize;
export function SQL(sql){
   return Ssequelize
      .query(sql, { type: Sequelize.QueryTypes.SELECT })
}


export const sequelize = Ssequelize
export const Modelos = models

//(export const models; 
