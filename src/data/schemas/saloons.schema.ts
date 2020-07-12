import { Schema } from 'mongoose'

export const SaloonSchema = new Schema({
  name: {
    type: String,
    required: true
  },
  address: String,
  city: String,
  image:[
    {
      name: String,
      path: String
    }

  ],
  openingTime: String,
  closingTime: String,
  aboutSaloon: String,
  atmosphere: String,
  service: String,
  language: String,
  paymentOption: String


})