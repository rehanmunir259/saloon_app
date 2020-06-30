import {Document} from 'mongoose';

export interface ITime  extends Document{
  openingTime: string,
  closingTime:string

}