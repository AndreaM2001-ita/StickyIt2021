//API

const route=require('express').Router();
const UserController= require('../controller/user.controller.js');

//resgitration API
/*
    user registration
    "firstname": "Andrea",
    "lastname": "Marcosano",
    "email":"marcosano.andrea@gmail.com",
    --"dateOfBirth":"19/03/2001",
    "password":"ciao123"
*/
route.post('/registration',UserController.register);


module.exports = route;
