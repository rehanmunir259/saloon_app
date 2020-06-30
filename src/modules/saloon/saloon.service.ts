import {Model} from 'mongoose'
import { Injectable } from '@nestjs/common';
import { InjectModel } from '@nestjs/mongoose';
import { ISaloon } from '../../data/interfaces/saloon.interface';
import { SimpleService } from '../../common/lib/simple.service';

@Injectable()
export class SaloonService extends SimpleService<ISaloon>{
  constructor(
    @InjectModel('saloons')
    protected saloonsModel: Model<ISaloon>
  ) {
    super(saloonsModel)
  }

  // findAll(){
  //   return this.saloonsModel.find().exec()
  // }
  //
  // createSaloon(saloon:ISaloon)
  // {
  //   return this.saloonsModel.create(saloon)
  // }
}
