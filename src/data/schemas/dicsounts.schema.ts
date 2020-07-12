import {Schema} from 'mongoose';

export const DiscountSchema = new Schema({
  saloon:{
    type:Schema.Types.ObjectId,
    ref:'saloons'
  },
  discount:Number,
  time: Date
})