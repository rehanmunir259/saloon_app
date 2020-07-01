import { Module } from '@nestjs/common';
import { SaloonController } from './saloon.controller';
import { SaloonService } from './saloon.service';
import { MongooseModule } from '@nestjs/mongoose';
import {SaloonSchema} from '../../data/schemas/saloons.schema';

@Module({
  imports: [
    MongooseModule.forFeature([
      {
        name:'saloons',
        schema: SaloonSchema
      }
    ])
  ],
  controllers: [SaloonController],
  providers: [SaloonService],
  exports: [SaloonService]
})
export class SaloonModule {}
