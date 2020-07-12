import { Document } from 'mongoose'

export interface ISaloon extends Document {
 image: [{
  name: string,
  path: string
 }]
 name: string,
 address: string,
 city: string,
 openingTime: Date,
 closingTime: Date,
 aboutSaloon: string,
 atmosphere: string,
 service: string,
 language: string,
 paymentOption: string


}