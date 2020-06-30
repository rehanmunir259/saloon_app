import { Body, Controller,Get,Post } from '@nestjs/common';
import { SaloonService } from './saloon.service';
import { SimpleController } from '../../common/lib/simple.controller';
import { ISaloon } from '../../data/interfaces/saloon.interface';

@Controller('saloon')
export class SaloonController extends SimpleController<ISaloon>{
  constructor(protected service:SaloonService) {
    super(service)
  }

  // @Get()
  // getAll(){
  //   return this.service.findAll();
  // }
  //
  // @Post()
  // create(@Body()data){
  //   return this.service.createSaloon(data);
  // }


}
