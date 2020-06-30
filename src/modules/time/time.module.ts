import { Module } from '@nestjs/common';
import { TimeController } from './time.controller';
import { MongooseModule } from '@nestjs/mongoose';
import { TimeSchema } from '../../data/schemas/times.schema';
import { TimeService } from './time.service';

@Module({
  imports:[
    MongooseModule.forFeature([
      {
        name:'times',
        schema:TimeSchema
      }
    ])
  ],
  controllers: [TimeController],
  providers:[TimeService],
  exports:[TimeService]
})
export class TimeModule {}
