import { Controller } from '@nestjs/common';
import { SimpleController } from '../../common/lib/simple.controller';
import { ICustomer } from '../../data/interfaces/customer.interface';
import { CustomerService } from './customer.service';

@Controller('customer')
export class CustomerController extends SimpleController<ICustomer>{
  constructor(protected service:CustomerService) {
    super(service);
  }
}
