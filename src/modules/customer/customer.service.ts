import { Injectable } from '@nestjs/common';
import { SimpleService } from '../../common/lib/simple.service';
import { ICustomer } from '../../data/interfaces/customer.interface';
import { InjectModel } from '@nestjs/mongoose';
import { Model } from "mongoose";
import { IUser } from '../../data/interfaces/user.interface';

@Injectable()
export class CustomerService extends SimpleService<ICustomer>{
  constructor(
    @InjectModel('customers')
    protected customerModel: Model<ICustomer>
  ) {
    super(customerModel)
  }

}
