require("dotenv").config();
const bcrypt = require("bcrypt");
const User = require("../model/UserModel");
const jwt = require("jsonwebtoken");
const apiResponse = require("../helpers/ApiResponse");

exports.register = async (req, res) => {
    try{
        const {mobile, pin, age} = req.body;
        
        let user = await User.findOne({mobile});

        if(user){
            return apiResponse.errorResponse(req, res, "User already exists");
        }

        user = new User({mobile, pin, age});

        const salt = await bcrypt.genSalt(10);
        user.pin = await bcrypt.hash(pin, salt);
        
        const token = jwt.sign(
            {"mobile":user.mobile},
            process.env.TOKEN_KEY,
            {
                expiresIn : "1h"
            }
        )

        user.token = token;

        await user.save();

        return apiResponse.successResponse(req, res, "User created!");
    }
    catch(error){
        return res.status(500).json({
            error: error.message
        })
    }
}

exports.checkUser = async (req, res) => {
    try{
        const mobile = req.params.mobile;
        console.log(mobile);

        const user = await User.findOne({mobile});

        if(user==null){
            return apiResponse.successResponse(req, res, false);
        }

        return apiResponse.successResponse(req, res, true);
    }
    catch(error){
        return apiResponse.errorResponse(res, res, error.message);
    }
}

exports.login = async (req, res) => {
    try{
        const {mobile, pin} = req.body;

        let user = await User.findOne({mobile});

        if(user==null){
            return apiResponse.errorResponse(req, res, "User does not exists");
        }

        const validPassword = bcrypt.compare(pin, user.pin);

        if(!validPassword){
            return apiResponse.errorResponse(req, res, "Invalid password");
        }

        const token = jwt.sign(
            {"mobile":user.mobile},
            process.env.TOKEN_KEY,
            {
                expiresIn : "1h"
            }
        );

        user.token = token;

        await user.save();

        return apiResponse.successResponseWithData(req, res, "User logged In", user);
    }
    catch(error){
        return apiResponse.errorResponse(req, res, error.message);
    }
}