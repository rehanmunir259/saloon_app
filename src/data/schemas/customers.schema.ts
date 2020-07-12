import {Schema} from 'mongoose'

export const CustomerSchema = new Schema({
  name:{
    type: String,
    required: true
  },
  email:{
    type: String,
    match: [/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/, 'Please enter a valid email address'],
    unique:true
  },
  contact: Number,
  password: String,
  image:{
    fileName: String,
    filePath: String
  },
  favoriteSaloon:[
    {
      type:Schema.Types.ObjectId,
      ref:'saloons'
    }
  ],
  scope:[]
})