import {Document} from 'mongoose'
export interface IReservation extends Document{
  code: number,
  noOfPerson: number,
  personName:  string,
  email:  string,
  reservationTime : Date,
  date: Date,
  discount: number,
  contact: number,
  status: boolean,
  timestamps: Date
}