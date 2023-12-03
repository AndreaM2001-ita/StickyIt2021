const mongoose=require('mongoose')
const db=require('../config/db.js');

const { Schema } = mongoose;

//create schema of user.. basically what info is the 'users' collection going to store??'
const pictureSchema = new Schema({
    title:{
        type: 'string',
        unique: true,
        required: true,
    },
    img: 
    { 
        data: Buffer, //allows us to store our image as data in the form of arrays.
        contentType: String 
    }
});

//create model of user within db collection
const pictureModel = db.model('pictures', pictureSchema);

//export user model to be used in other part of the app
module.exports = pictureModel;