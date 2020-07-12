import {
  Body,
  Controller,
  Delete,
  Get,
  Param,
  Post,
  UploadedFiles,
  UseInterceptors,
} from '@nestjs/common';
import { SaloonService } from './saloon.service';
import { SimpleController } from '../../common/lib/simple.controller';
import { ISaloon } from '../../data/interfaces/saloon.interface';
import { FilesInterceptor } from '@nestjs/platform-express';


@Controller('saloon')
export class SaloonController extends SimpleController<ISaloon>{
  constructor(protected service:SaloonService) {
    super(service)
  }

  @Post('create-saloon')
  @UseInterceptors(FilesInterceptor('image'))
  saloonImages(@UploadedFiles() file, @Body() data: ISaloon) {
    data.image = file.map(item => ({
      name: item.filename,
      path: item.path
    }))

    // // @ts-ignore
    // if (Array.isArray(data.openingTime)) {
    //   // @ts-ignore
    //   data.timing = []
    //
    //   // @ts-ignore
    //   for (let i = 0; i < data.openingTime.length; ++i) {
    //     data.timing.push({
    //       // @ts-ignore
    //       openingTime: data.openingTime[i],
    //       // @ts-ignore
    //       closingTime: data.closingTime[i]
    //     })
    //   }
    // } else {
    //   data.timing = [{
    //     // @ts-ignore
    //     openingTime: data.openingTime,
    //     // @ts-ignore
    //     closingTime: data.closingTime
    //   }]
    // }
    //
    // // @ts-ignore
    // if (Array.isArray(data.atmosphere)) {
    //   // @ts-ignore
    //   data.about = []
    //
    //   // @ts-ignore
    //   for (let i = 0; i < data.openingTime.length; ++i) {
    //     // @ts-ignore
    //     data.about.push({
    //       // @ts-ignore
    //       aboutSaloon: data.aboutSaloon[i],
    //       // @ts-ignore
    //       atmosphere: data.atmosphere[i],
    //       // @ts-ignore
    //       service: data.service[i],
    //       // @ts-ignore
    //       language: data.language[i],
    //       // @ts-ignore
    //       paymentOption: data.paymentOption[i],
    //     })
    //   }
    // } else {
    //   // @ts-ignore
    //   data.about = [{
    //     // @ts-ignore
    //     aboutSaloon: data.aboutSaloon,
    //     // @ts-ignore
    //     atmosphere: data.atmosphere,
    //     // @ts-ignore
    //     service: data.service,
    //     // @ts-ignore
    //     language: data.language,
    //     // @ts-ignore
    //     paymentOption: data.paymentOption
    //   }]
    // }

    console.log(data)

    return this.service.create(data)
  }



}
