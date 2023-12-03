const express= require('express')
const body_parser=require('body-parser')
const UserRouter= require('./routers/user.route.js')

const app=express();

app.use(body_parser.json());
app.use('/',UserRouter);

module.exports=app;