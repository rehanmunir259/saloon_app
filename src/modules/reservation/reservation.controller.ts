import { Controller, Get, Param } from '@nestjs/common';
import { SimpleController } from '../../common/lib/simple.controller';
import { IReservation } from '../../data/interfaces/reservation.interface';
import { ReservationService } from './reservation.service';

@Controller('reservation')
export class ReservationController extends SimpleController<IReservation>{
  constructor(protected service:ReservationService) {
    super(service);
  }

  @Get('reservations-of-month/:id')
  reservationsOfMonth(@Param('id') id) {
    // return "called"
    return this.service.reservationsOfMonth(id)
  }
  @Get('total-reservations')
  totalReservations(){
    return this.service.totalReservations()
  }
}
