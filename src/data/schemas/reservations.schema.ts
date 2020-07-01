import {Schema} from 'mongoose'

export const ReservationSchema = new Schema({
  saloon:[
    {
      type:Schema.Types.ObjectId,
      ref:"saloons"
    }
  ],
  code:{
    type:Number,
    required:true,
    unique:true
  },
  personName: String,
  noOfPerson: Number,
  email:String,
  reservationTime:Date,
  discount: Number,

}, {
  timestamps: true
  }
)