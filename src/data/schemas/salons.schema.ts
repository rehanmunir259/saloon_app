import  {Schema} from 'mongoose'

export const SaloonSchema = new Schema({
  name:{
    type: String,
    required : true
  },
  address: String
  }
)