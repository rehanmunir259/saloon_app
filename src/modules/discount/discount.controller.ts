import { Controller } from '@nestjs/common';
import { SimpleController } from '../../common/lib/simple.controller';
import { IDiscount } from '../../data/interfaces/discount.interface';
import { DiscountService } from './discount.service';

@Controller('discount')
export class DiscountController extends SimpleController<IDiscount>{
  constructor(protected service:DiscountService) {
    super(service);
  }
}
