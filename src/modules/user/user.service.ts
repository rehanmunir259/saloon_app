import { Model } from 'mongoose'
import { Injectable } from '@nestjs/common';
import { InjectModel } from '@nestjs/mongoose';
import { IUser } from '../../data/interfaces/user.interface';
import { SimpleService } from '../../common/lib/simple.service';

@Injectable()
export class UserService  extends SimpleService<IUser>{
  constructor(
    @InjectModel('users')
    protected usersModel: Model<IUser>
  ) {
    super(usersModel)
  }

  // findAll() {
  //   return this.usersModel.find().exec()
  // }
  //
  // createUser(user: IUser) {
  //   return this.usersModel.create(user)
  // }
}
