import { Schema } from 'mongoose'

export const UsersSchema = new Schema({
  name: {
    type: String,
    required: true
  },

  password: String,

  scope: [String]
})
