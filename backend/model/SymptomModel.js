const {Schema, model} = require("mongoose");

const Symptom = Schema({
    symptom_name:{
        type:String,
        required: true
    },
    symptom_fields:[{
        type:Object,
    }],
    timestamp:{
        type: Date,
        default: Date.now
    }
})

module.exports = model("symptom", Symptom);