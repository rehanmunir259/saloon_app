import { Module } from '@nestjs/common';
import { CustomerController } from './customer.controller';
import { MongooseModule } from '@nestjs/mongoose';
import {CustomerSchema} from '../../data/schemas/customers.schema';
import { CustomerService } from './customer.service';

@Module({
  imports:[
    MongooseModule.forFeature([
      {
        name:'customers',
        schema:CustomerSchema

      }

    ])
  ],
  controllers: [CustomerController],
  providers:[CustomerService],
  exports:[CustomerService]
})
export class CustomerModule {}
