const mongoose=require('mongoose')
const db=require('../config/db.js');
const bcrypt= require('bcrypt');
const ErrorHandler = require('../errorHandler.js');


const { Schema } = mongoose;

//create schema of user.. basically what info is the 'users' collection going to store??'
const userSchema = new Schema({
    firstname:{
        type: 'string',
        required: true,
    },
    lastname:{
        type: 'string',
        required: true,
    },
    username:{
        type: 'string',
        lowercase: true,
    },
    dateOfBirth: {
        type: Date,
        validate: {
            validator: (dob) => dob < new Date(),
            message: 'Date of birth must be in the past',
        },
    },
    email: {
        type: 'string',
        required: true,
        unique: true,
        lowercase: true, // Store email in lowercase
        trim: true,
        match: /^\S+@\S+\.\S+$/, // Simple email validation using a regular expression
    },
    password:{
        type: 'string',
        required: true,
        isLength: {
            options: { min: 8 },
            errorMessage: 'Password should be at least 8 chars',
        },
    }
});

// Pre-save middleware to set the username based on the first half of the email
userSchema.pre('save', async function (next) {
    
//hash password
    try{
        var user= this;
        const salt = await(bcrypt.genSalt(10)); //saltin:: adding random car to password 
        const hashPasswords = await bcrypt.hash(user.password, salt); //hashing the psw

        user.password =hashPasswords
    }catch(err){
        throw err;
    }
//save username
    if (this.email && !this.username) {
        // If email is provided and username is not set, set username to the first half of the email
        const firstHalf = this.email.split('@')[0];
        this.username = firstHalf;
        console.log('Setting username:', this.username);
    }
// Check if a user with similar email already exists
    try{

        const existingUser = await this.model('users').findOne({ email: this.email });
        if (existingUser) {
            throw new ErrorHandler('Email already Exists','User already exists. Please use another Email', 401,true);
        }
               
    }catch(err){
        throw err;
    }
    
    next();
    
});






//create model of user within db collection
const userModel = db.model('users', userSchema);

//export user model to be used in other part of the app
module.exports = userModel;
