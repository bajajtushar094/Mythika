const {Schema, model} = require("mongoose");

const SymptomField = Schema({
    field_name:{
        type:String
    },
    field_value:{
        type:String
    }
});

module.exports = model("symptom_field", SymptomField);