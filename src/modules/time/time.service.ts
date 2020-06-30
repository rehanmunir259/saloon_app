import { Injectable } from '@nestjs/common';
import { SimpleService } from '../../common/lib/simple.service';
import { ITime } from '../../data/interfaces/time.interface';
import { InjectModel } from '@nestjs/mongoose';
import { Model } from 'mongoose';

@Injectable()
export class TimeService extends SimpleService<ITime>{
  constructor(
    @InjectModel('times')
    protected timeModel:Model<ITime>
  ) {
    super(timeModel);
  }
}
