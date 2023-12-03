const userService= require('../services/user.services.js');
const ErrorHandler = require('../errorHandler.js');


exports.register = async (req,res,next)=>{
    try{
        const {firstname,lastname,email,password} = req.body; //request body

        const successRes = await userService.registerUser(firstname,lastname,email,password);  //registrratio of user

        res.status(200).json({ message: 'Registration successful!' });//responce to front end
    }catch(err){
        res.status(err.getHttpCode()).json({ message: err.getDescription() });
    }
}