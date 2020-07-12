import { Injectable } from '@nestjs/common';
import { SimpleService } from '../../common/lib/simple.service';
import { ICustomer } from '../../data/interfaces/customer.interface';
import { InjectModel } from '@nestjs/mongoose';
import { Model } from "mongoose";
import { checkServerIdentity } from 'tls';


@Injectable()
export class CustomerService extends SimpleService<ICustomer>{
  constructor(
    @InjectModel('customers')
    protected customerModel: Model<ICustomer>
  ) {
    super(customerModel)
  }

  async handleFavorite(id: string, saloonId: string, flag: boolean) {
    const customer = await this.customerModel.findById(id)

    if (flag) {
      // @ts-ignore
      if (!customer.favoriteSaloon.includes(saloonId)) {
        // @ts-ignore
        customer.favoriteSaloon.push(saloonId);
      }
    } else {
      // @ts-ignore
      const index = customer.favoriteSaloon.indexOf(saloonId);

      if (index >= 0) {
        customer.favoriteSaloon.splice(index, 1)
      }
    }

    await customer.save();
    return customer
  }
}
