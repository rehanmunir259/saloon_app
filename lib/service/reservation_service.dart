import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:saloon/service/_service.dart';
import 'package:saloon/src/models/reservations_model.dart';
import 'package:saloon/src/ui/utils/localdata_reservation.dart';

class ReservationService extends SaloonAppService<ReservationModel>{
  @override
   ReservationModel parse(Map<String, dynamic> json) {
    return ReservationModel.fromJson(json);
  }

   Future<List<ReservationModel>> getReservations(){
    return this.getAll('reservation');
  }

   Future createReservation ({ReservationModel res ,BuildContext context}) async {
     print('start');    
    Response response = await SaloonAppService.post('reservation/create-reservation', LocalDataReservation.reservationModel.toJson());
    // ignore: unused_local_variable
    ReservationModel createReservation = parse(response.data);
    //CustomNavigator.navigateTo(context, SignInScreen());
  }
}