import { Injectable } from '@nestjs/common';
import { SimpleService } from '../../common/lib/simple.service';
import { IDiscount } from '../../data/interfaces/discount.interface';
import { InjectModel } from '@nestjs/mongoose';
import { Model } from 'mongoose';

@Injectable()
export class DiscountService extends SimpleService<IDiscount>{
  constructor(
    @InjectModel('discounts')
    protected discountModel:Model<IDiscount>
  ) {
    super(discountModel);
  }
}
