import { Module } from '@nestjs/common';
import { ReservationController } from './reservation.controller';
import { MongooseModule } from '@nestjs/mongoose';
import { ReservationSchema } from '../../data/schemas/reservations.schema';
import { ReservationService } from './reservation.service';

@Module({
  imports:[
    MongooseModule.forFeature([
      {
        name:'reservations',
        schema:ReservationSchema
      }
    ])
  ],
  controllers: [ReservationController],
  providers:[ReservationService],
  exports:[ReservationService]
})
export class ReservationModule {}
