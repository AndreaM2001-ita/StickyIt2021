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

exports.login = async (req,res,next)=>{
    try{
        const {email,password} = req.body; //request body
        const user= await userService.checkUser(email);
        if(!user){
                const err=new ErrorHandler('User Does not Exists','User Does not Exists, change User', 410,true);
                res.status(err.getHttpCode()).json({ message: err.getDescription() });
        }
        else{
            const isMatch = await user.comparePasswords(password);
            if(isMatch==false){
                const err = new ErrorHandler('Password is not correct','Password is not correct, Try Again', 411,true);
                res.status(err.getHttpCode()).json({ message: err.getDescription() });
            }
            else{
                let tokenData={name:user.name,lastname:user.lastname, email:user.email}
                const token = await userService.generateToken(tokenData,'secretKey','1h')
                res.status(200).json({ message: 'login successful!', token:token});//responce to front end
            }
        }
    }catch(err){
        throw err;

    }
}