import { Body, Controller, Delete, Get, Param, Post } from '@nestjs/common';
import { SimpleController } from '../../common/lib/simple.controller';
import { IReservation } from '../../data/interfaces/reservation.interface';
import { ReservationService } from './reservation.service';

@Controller('reservation')
export class ReservationController extends SimpleController<IReservation> {
  constructor(protected service: ReservationService) {
    super(service);
  }

  @Post('create-reservation')
  reservation(@Body() data:IReservation){
    // let code = Math.floor(100 + Math.random() * 10000)
    // data.code = code;
    // console.log(code)
    return this.service.reservation(data)
    // return this.service.create(data)
  }

  @Get('reservations-of-month/:id')
  reservationsOfMonth(@Param('id') id) {
    // return "called"
    return this.service.reservationsOfMonth(id)
  }

  @Get('total-reservations/:id')
  totalReservations(@Param('id') id) {
    return this.service.totalReservations(id)
  }

  @Post('cancel-reservation/:id')
  cancelReservation(@Param('id')id) {
    return this.service.cancelReservation(id)
  }

}
