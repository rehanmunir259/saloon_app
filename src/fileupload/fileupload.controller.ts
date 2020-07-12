import { Controller, UploadedFile, UseInterceptors , Post } from '@nestjs/common';
import { FileInterceptor } from '@nestjs/platform-express';

@Controller('fileupload')
export class FileuploadController {

  @Post('upload-image')
  @UseInterceptors(FileInterceptor('image'))
  uploadFile(@UploadedFile() file){
  console.log(file);

  // model.create({
  //   image: {
  //     name: file.filename,
  //     path: file.path
  //   }9
  // })
  }


}
