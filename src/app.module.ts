import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { MongooseModule } from '@nestjs/mongoose';

import { SaloonController } from './modules/saloon/saloon.controller';
import { SaloonModule } from './modules/saloon/saloon.module';
import { SaloonService } from './modules/saloon/saloon.service';

import { DbModule } from './common/db/db.module';
import { CustomerService } from './modules/customer/customer.service';
import { CustomerModule } from './modules/customer/customer.module';
import { ReservationService } from './modules/reservation/reservation.service';
import { ReservationModule } from './modules/reservation/reservation.module';

import { DiscountService } from './modules/discount/discount.service';
import { DiscountModule } from './modules/discount/discount.module';
import { FileuploadController } from './fileupload/fileupload.controller';
import { MulterModule } from '@nestjs/platform-express';


@Module({
  imports: [
    // MongooseModule.forRoot('mongodb://localhost:27017/saloon__db'),
    DbModule,
    SaloonModule,
    CustomerModule,
    ReservationModule,
    DiscountModule,
    // MulterModule.register({
    //   dest:'../uploads',
    // }),
  ],
  controllers: [AppController, FileuploadController],
  providers: [AppService],
})
export class AppModule {}
