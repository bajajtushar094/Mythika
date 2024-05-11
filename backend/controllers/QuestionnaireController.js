require("dotenv").config();
const User = require("../model/UserModel");
const Symptom = require("../model/SymptomModel");
const SymptomField = require("../model/SymptomFieldModel");
const Questionnaire = require("../model/QuestionnaireModel");
const apiResponse = require("../helpers/ApiResponse");

exports.addQuestion = async (req, res) => {
    try{
        const {mobile, questions} = req.body;
        console.log("question from request body: ", questions);

        let user = await User.findOne({mobile});

        if(user==null){
            return apiResponse.errorResponse(req, res, "User does not exists");
        }

        for(let i=0;i<questions.length; i++){
            const questionnaire = new Questionnaire({"question_number":questions[i]['question_number'], "question":questions[i]['question'], "question_answer":questions[i]['question_answer'], "question_subanswers":questions[i]['question_subanswers']});
            await questionnaire.save();

            user.onboarding_questionnaire.push(questionnaire);
            await user.save();
        }

        return apiResponse.successResponse(req, res, "Question added");
    }
    catch(error){
        return apiResponse.errorResponse(req, res, error.message);
    }
}