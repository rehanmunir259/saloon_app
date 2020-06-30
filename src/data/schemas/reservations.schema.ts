import {Schema} from 'mongoose'

export const ReservationSchema = new Schema({
  code:{
    type:Number,
    required:true
  },
  noOfPerson: Number,
  time:String,
  discount: Number
})