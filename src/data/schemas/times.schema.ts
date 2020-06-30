import {Schema} from 'mongoose';

export const TimeSchema = new Schema({
  openingTime:String,
  closingTime : String
})