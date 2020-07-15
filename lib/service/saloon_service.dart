import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:saloon/service/_service.dart';
import 'package:saloon/src/models/saloon_model.dart';

//SaloonModel saloon;

class SaloonService extends SaloonAppService<SaloonModel> {
  @override
   SaloonModel parse(Map<String, dynamic> json) {
    return SaloonModel.fromJson(json);
  }

  Future<List<SaloonModel>> getSaloons(){
    return this.getAll('saloon');
  }

   Future registerSaloon (FormData saloon,BuildContext context) async {

    Response response = await SaloonAppService.post('saloon/create-saloon', saloon);
    // ignore: unused_local_variable
    SaloonModel createsaloon = parse(response.data);

    //CustomNavigator.navigateTo(context, SignInScreen());

  }
  
}