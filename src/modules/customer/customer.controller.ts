import {
  Body,
  Controller,
  Param,
  Patch,
  Post,
  UploadedFile,
  UseInterceptors,
  Put,
  Query,
  HttpException, HttpStatus,
} from '@nestjs/common';
import { SimpleController } from '../../common/lib/simple.controller';
import { ICustomer } from '../../data/interfaces/customer.interface';
import { CustomerService } from './customer.service';
import { FileInterceptor } from '@nestjs/platform-express';

@Controller('user')
export class CustomerController extends SimpleController<ICustomer>{
  constructor(protected service:CustomerService) {
    super(service);
  }

  @Post('create-user')
  @UseInterceptors(FileInterceptor('image'))
  userProfile(@UploadedFile() file, @Body() data:ICustomer) {
    data.image = {
      fileName: file.filename,
      filePath: file.path
    }
    console.log(data);
    return this.service.create(data);

  }

  @Patch('update-profile')
  @UseInterceptors(FileInterceptor('image'))
  UpdateUserProfile(@UploadedFile() file ,@Body() data:ICustomer){
    data.image = {
      fileName:file.filename,
      filePath:file.path
    }
    return this.service.update(data);

  }

  @Patch(':id/add-favorite')
  async addToFavorite(@Param('id') id: string, @Body() data: any) {
    if (data.saloonId) {
      return this.service.handleFavorite(id, data.saloonId, true);
    } else {
      throw new HttpException("No Saloon Id was provided", HttpStatus.BAD_REQUEST);
    }
  }

  @Patch(':id/remove-favorite')
  async removeFromFavorite(@Param('id') id: string, @Body() data: any) {
    if (data.saloonId) {
      return this.service.handleFavorite(id, data.saloonId, false);
    } else {
      throw new HttpException("No Saloon Id was provided", HttpStatus.BAD_REQUEST);
    }
  }
}
