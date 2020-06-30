import { Controller } from '@nestjs/common';
import { SimpleController } from '../../common/lib/simple.controller';
import { IReservation } from '../../data/interfaces/reservation.interface';
import { ReservationService } from './reservation.service';

@Controller('reservation')
export class ReservationController extends SimpleController<IReservation>{
  constructor(protected service:ReservationService) {
    super(service);
  }
}
