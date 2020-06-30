import {Schema} from 'mongoose'

export const CustomerSchema = new Schema({
  name:{
    type: String,
    required:true
  },
  email: String,
  contact: Number
})