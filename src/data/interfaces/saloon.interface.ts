import { Document } from 'mongoose'

export interface ISaloon extends Document {
 name: string,
 address:string,
 city:string,
 timing:[
  {
   openingTime: Date,
   closingTime:Date
  }
 ],

}