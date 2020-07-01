import {Schema} from 'mongoose';

export const DiscountSchema = new Schema({
  discount:Number,
  time: {
    startTime: Date,
    endTime: Date
  }
})