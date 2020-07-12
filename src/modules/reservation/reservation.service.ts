import { Injectable } from '@nestjs/common';
import { SimpleService } from '../../common/lib/simple.service';
import { IReservation } from '../../data/interfaces/reservation.interface';
import { InjectModel } from '@nestjs/mongoose';
import {Model} from 'mongoose';
import * as moment from 'moment';

@Injectable()
export class ReservationService extends SimpleService<IReservation>{
  constructor(
    @InjectModel('reservations')
    protected reservationModel:Model<IReservation>
  ) {
    super(reservationModel);
  }

  reservation(data) {

    let code = Math.floor(1000 + Math.random() * 10000)
    data.code = code;
    console.log(code)

  if(data.noOfPerson <= 0  || data.noOfPerson > 4){
    return "No of Person can't be less than 1 and more than 4"
  }
  else
    return this.reservationModel.create(data)

  }



  // Total Reservations of Month of Saloon

  reservationsOfMonth(id) {
    const _current = new Date(Date.now());
    let prev = moment({
      day: 1,
      month: _current.getMonth(),
      year: _current.getFullYear()
    });

    let next = moment(prev).add({ month: 1 }).subtract({ day: 1 }).toDate();

    return this.reservationModel.find({
      saloon: id,
      createdAt: {
        $gte: prev,
        $lte: next
      }
    }).countDocuments();

  }

  // Total Reservations of Saloon

  totalReservations(id){
    return this.reservationModel.find({
      saloon:id
    }).countDocuments().exec();
  }

  // Reservation Status

   cancelReservation(id) {
    return this.reservationModel.updateOne(
      {
        _id: id
      }, {
        status: false
      },
    )
    return "Reservation Canceled"


  }
  



}
