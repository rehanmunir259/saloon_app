import { Schema } from 'mongoose'

export const SaloonSchema = new Schema({
  name: {
    type: String,
    required: true
  },
  address: String,
  city: String,
  timing:[
    {
      openingTime: String,
      closingTime: String
    },
  ],
  about:[
    {
      aboutSaloon: String,
      atmosphere: String,
      service: String,
      language: String,
      paymentOption: String
    }
  ],
  // reservation: [
  //   {
  //     type: Schema.Types.ObjectId,
  //     ref: 'reservations'
  //   }
  // ]
})