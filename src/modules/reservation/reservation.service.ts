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
  totalReservations(){
    return this.reservationModel.find().countDocuments().exec();
  }
}
