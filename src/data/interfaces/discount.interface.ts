import {Document} from 'mongoose';

export interface IDiscount extends Document{
  discount:number,
  time:Date

}