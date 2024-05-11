const {Schema, model} = require("mongoose");

const User = Schema({
    mobile:{
        type:String,
        requred:true,
        unqiue: true
    },
    pin:{
        type:String,
    },
    name:{
        type: String,
    },
    token:{
        type:String
    },
    age:{
        type:String
    },
    low_energy:[{
        type:Object
    }],
    periods:[{
        type:Object
    }],
    weight_changes:[{
        type:Object
    }],
    brain_fog:[{
        type:Object
    }],
    hot_flashes:[{
        type:Object
    }],
    night_sweats:[{
        type:Object
    }],
    mrs_score:[{
        type: Object
    }],
    onboarding_questionnaire:[{
        type: Object
    }]
});

module.exports = model("user", User);