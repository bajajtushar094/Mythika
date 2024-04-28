require("dotenv").config();
const User = require("../model/UserModel");
const Symptom = require("../model/SymptomModel");
const SymptomField = require("../model/SymptomFieldModel");
const apiResponse = require("../helpers/ApiResponse");

exports.addSymptom = async (req, res) => {
    try{
        const {mobile, symptom_name, symptom_fields} = req.body;

        const user = await User.findOne({mobile});

        if(user==null){
            return apiResponse.errorResponse(req, res, "User does not exists");
        }

        const symptom = new Symptom({symptom_name});
        let symptom_fields_array = [];

        for(let i in symptom_fields){
            console.log(i);
            const symptom_field = new SymptomField({field_name: symptom_fields[i].name, field_value: symptom_fields[i].value});
            await symptom_field.save();
            symptom_fields_array.push(symptom_field);
        }

        symptom.symptom_fields = symptom_fields_array;
        await symptom.save();

        user[symptom_name].push(symptom);
        await user.save();

        return apiResponse.successResponse(req, res, "Symptom created");
    }
    catch(error){
        return apiResponse.errorResponse(req, res, error.message); 
    }
}

exports.getSymptoms = async (req, res) => {
    try{
        const {mobile, symptom_name} = req.query;

        const user = await User.findOne({mobile});

        if(user==null){
            return apiResponse.errorResponse(req, res, "Mobile number does not belongs to a User");
        }

        if(!user.hasOwnProperty(symptom_name)){
            return apiResponse.errorResponse(req, res, `${symptom_name} does not exists for User`);
        }

        return apiResponse.successResponseWithData(req, res, "Symptom details", user[symptom_name]);
    }
    catch(error){
        return apiResponse.errorResponse(req, res, error.message);
    }
}
