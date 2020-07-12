import {Document} from 'mongoose'
import { ISaloon } from './saloon.interface';

export interface ICustomer extends Document{
  name:string,
  email:{
    type:string,
  }
  contact:number,
  password: string,
  image: {
    fileName: string,
    filePath: string
  },
  favoriteSaloon: string[] | ISaloon[]
  scope:[]

}