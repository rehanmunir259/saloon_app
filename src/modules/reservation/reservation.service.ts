import { Injectable } from '@nestjs/common';
import { SimpleService } from '../../common/lib/simple.service';
import { IReservation } from '../../data/interfaces/reservation.interface';
import { InjectModel } from '@nestjs/mongoose';
import {Model} from 'mongoose';

@Injectable()
export class ReservationService extends SimpleService<IReservation>{
  constructor(
    @InjectModel('reservations')
    protected reservationModel:Model<IReservation>
  ) {
    super(reservationModel);
  }
}
