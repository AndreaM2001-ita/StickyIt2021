const mongoose = require('mongoose');
let dbName='stickit'
let uri='mongodb://127.0.0.1:27017/'+dbName // conncting to db locally with mongocompass

const connection = mongoose.createConnection(uri).on('open',()=>{
    console.log('MongoDb correctly working');
}).on('error',()=>{
    console.log('Error in mongoDb connection')
});

module.exports = connection;