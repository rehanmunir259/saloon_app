import { Module } from '@nestjs/common';
import { DiscountController } from './discount.controller';
import { MongooseModule } from '@nestjs/mongoose';
import { DiscountSchema } from '../../data/schemas/dicsounts.schema';
import { DiscountService } from './discount.service';

@Module({
  imports:[
    MongooseModule.forFeature([
      {
        name:'discounts',
        schema:DiscountSchema
      }
    ])
  ],
  controllers: [DiscountController],
  providers:[DiscountService],
  exports:[DiscountService]
})
export class DiscountModule {}
