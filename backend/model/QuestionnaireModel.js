const {Schema, model} = require("mongoose");

const Questionnaire = Schema({
    question_number:{
        type: String
    },
    question:{
        type: String
    },
    question_answer:{
        type:String
    },
    question_subanswers:[
        {
            type: String
        }
    ]
});
module.exports = model("questionnaire", Questionnaire);
