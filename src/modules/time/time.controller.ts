import { Controller } from '@nestjs/common';
import { SimpleController } from '../../common/lib/simple.controller';
import { ITime } from '../../data/interfaces/time.interface';
import { TimeService } from './time.service';

@Controller('time')
export class TimeController  extends SimpleController<ITime>{
  constructor(protected service:TimeService) {
    super(service);
  }
}


