import { Module } from '@nestjs/common';
import { CustomerController } from './customer.controller';
import { MongooseModule } from '@nestjs/mongoose';
import { CustomerSchema } from '../../data/schemas/customers.schema';
import { CustomerService } from './customer.service';
import { MulterModule } from '@nestjs/platform-express';

@Module({
  imports:[
    MongooseModule.forFeature([
      {
        name:'customers',
        schema:CustomerSchema

      },
    ]),
    MulterModule.register({
      dest:'../uploads',
    })
  ],
  controllers: [CustomerController],
  providers:[CustomerService],
  exports:[CustomerService]
})
export class CustomerModule {}
