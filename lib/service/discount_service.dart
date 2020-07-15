import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:saloon/service/_service.dart';
import 'package:saloon/src/models/discount_model.dart';

class DiscountService extends SaloonAppService<DiscountModel> {
  @override 
  
  DiscountModel parse(Map<String,dynamic>json){
    return DiscountModel.fromJson(json);
  }
  
  Future<List<DiscountModel>> getDiscounts(){
    return this.getAll('discount');
  }

   Future registerDiscount ({DiscountModel dis,BuildContext context}) async {
    // print('hello');
    print('saad');
    print(dis.discount);
    print(dis.time);
    //print('hello2');
    //print(dis.toJson());
    Response response = await SaloonAppService.post('discount', dis.toJson());
    //print(diss);
    //print('hello3');
    // ignore: unused_local_variable
    DiscountModel createDiscount = parse(response.data);

    //CustomNavigator.navigateTo(context, SignInScreen());

  }

 }