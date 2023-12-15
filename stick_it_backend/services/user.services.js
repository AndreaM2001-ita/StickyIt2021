const UserModel=require('../model/user.model.js');
const jwt = require('jsonwebtoken')

class UserService{
    static async registerUser(firstname,lastname,email,password){
        try{

             // Create a new user instance
             const newUser = new UserModel({
                firstname,
                lastname,
                email,
                //dateOfBirth,
                password,
            });
            return await newUser.save();
        }catch (err){
            throw err
        }
    }

    static async checkUser(email){
        try{
            return await UserModel.findOne({email});
        }catch (err){
            throw err
        }
    }

    static async generateToken(tokenData,secretKey,jwt_expire){

        return jwt.sign(tokenData,secretKey,{expiresIn:jwt_expire});

    }
}

module.exports = UserService;