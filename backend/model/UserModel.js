const {Schema, model} = require("mongoose");

const User = Schema({
    mobile:{
        type:String,
        requred:true
    },
    pin:{
        type:String,
        required:true
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
    

});

module.exports = model("user", User);