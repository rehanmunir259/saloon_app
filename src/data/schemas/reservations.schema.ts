import {Schema} from 'mongoose'

export const ReservationSchema = new Schema({
  saloon:
    {
      type:Schema.Types.ObjectId,
      ref:"saloons"
    },
  code:{
    type:Number,
    required:true,
    unique:true
  },
  personName: String,
  noOfPerson:
    {
    type: Number,
    validate: (num) =>
    {
      return num <=4
    }
    },
  email:String,
  reservationTime:Date,
  discount: Number,
  date: Date,
  contact: Number,
  status:{
    type:Boolean,
    default:true
  }

}, {
  timestamps: true
  }
)