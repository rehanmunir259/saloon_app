import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { MongooseModule } from '@nestjs/mongoose';
import { UserModule } from './modules/user/user.module';

import { SaloonController } from './modules/saloon/saloon.controller';
import { SaloonModule } from './modules/saloon/saloon.module';
import { UserController } from './modules/user/user.controller';
import { SaloonService } from './modules/saloon/saloon.service';

import { DbModule } from './common/db/db.module';
import { CustomerService } from './modules/customer/customer.service';
import { CustomerModule } from './modules/customer/customer.module';
import { ReservationService } from './modules/reservation/reservation.service';
import { ReservationModule } from './modules/reservation/reservation.module';
import { TimeService } from './modules/time/time.service';
import { TimeModule } from './modules/time/time.module';
import { DiscountService } from './modules/discount/discount.service';
import { DiscountModule } from './modules/discount/discount.module';

@Module({
  imports: [
    // MongooseModule.forRoot('mongodb://localhost:27017/saloon__db'),
    DbModule,
    UserModule,
    SaloonModule,
    CustomerModule,
    ReservationModule,
    TimeModule,
    DiscountModule,
  ],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
