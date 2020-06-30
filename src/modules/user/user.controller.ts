import { Body, Controller, Delete, Get, Param, Patch, Post } from '@nestjs/common';
import { UserService } from './user.service';
import { SimpleController } from '../../common/lib/simple.controller';
import { IUser } from '../../data/interfaces/user.interface';

@Controller('user')
export class UserController extends SimpleController<IUser>{
  constructor(protected service: UserService) {
    super(service)
  }

  // @Get()
  // getAll() {
  //   return this.service.findAll()
  // }
  //
  // @Post()
  // create(@Body() data) {
  //   return this.service.createUser(data);
  // }
  //
  // @Patch()
  // patch(@Body() data) {
  //
  // }
  //
  // @Delete()
  // delete() {
  //
  // }
}
