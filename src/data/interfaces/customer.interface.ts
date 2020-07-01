import {Document} from 'mongoose'

export interface ICustomer extends Document{
  name:string,
  email:{
    type:string,
  }
  contact:number,
  password: string,
  scope:[]

}