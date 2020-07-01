import {Schema} from 'mongoose'

export const CustomerSchema = new Schema({
  name:{
    type: String,
    required: true
  },
  email:{
    type: String,
    match: [/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/, 'Please fill a valid email address'],
    unique:true
  },
  contact: Number,
  password: String,
  scope:[]
})