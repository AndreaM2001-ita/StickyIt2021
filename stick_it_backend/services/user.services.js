const UserModel=require('../model/user.model.js');

class UserService{
    static async registerUser(firstname,lastname,email,password){
        try{

            //TODO : verifyemail registtration is not occuring twice
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
}

module.exports = UserService;