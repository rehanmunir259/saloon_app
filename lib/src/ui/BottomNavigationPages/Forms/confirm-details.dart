import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:saloon/service/saloon_service.dart';
import 'package:saloon/src/models/saloon_model.dart';
import 'package:saloon/src/ui/AnimatedBottomBar/BottomBarNavigation.dart';
import 'package:saloon/src/ui/utils/localdata.dart';

class ConfirmDetails extends StatefulWidget {
  @override
  _ConfirmDetailsState createState() => _ConfirmDetailsState();
}

class _ConfirmDetailsState extends State<ConfirmDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Confirm Details'),
        backgroundColor: Color(0xFF0d1137),
        centerTitle: true,
      ),
<<<<<<< HEAD
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Name of Saloon:',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Address of Saloon:',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'City:',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Opening Time:',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'ClosingTime:',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'About:',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Atmosphere:',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Services:',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Languages:',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Payment:',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 15,
              ),
            ],
          ),
=======
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Name of Saloon: ${LocalData.saloonModel.name}',style: TextStyle(fontSize: 17.0),),
                SizedBox(height: 10,),
                Text('Address: ${LocalData.saloonModel.address}',style: TextStyle(fontSize: 17.0),),
                SizedBox(height: 10,),
                Text('City: ${LocalData.saloonModel.city}',style: TextStyle(fontSize: 17.0),),
                SizedBox(height: 10,),
                Text('Opening Time:${LocalData.saloonModel.openingTime}',style: TextStyle(fontSize: 17.0),),
                SizedBox(height: 10,),
                Text('Closing Time:${LocalData.saloonModel.closingTime}',style: TextStyle(fontSize: 17.0),),
                SizedBox(height: 10,),
                Text('About Saloon:${LocalData.saloonModel.aboutSaloon}',style: TextStyle(fontSize: 17.0),),
                SizedBox(height: 10,),
                Text('Atmosphere:${LocalData.saloonModel.atmosphere}',style: TextStyle(fontSize: 17.0),),
                SizedBox(height: 10,),
                Text('Services:${LocalData.saloonModel.service}',style: TextStyle(fontSize: 17.0),),
                SizedBox(height: 10,),
                Text('Languages:${LocalData.saloonModel.language}',style: TextStyle(fontSize: 17.0),),
                SizedBox(height: 10,),
                Text('Payment:${LocalData.saloonModel.paymentOption}',style: TextStyle(fontSize: 17.0),),
                SizedBox(height: 20,),
            Center(
              child: RaisedButton(
                color: Color(0xFF0d1137),
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Text(
                  'Ok',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () async {
                  Navigator.push(context, MaterialPageRoute(builder: 
                  (context)=> BottomBarNavigation(),
                  ),);

                  FormData data = FormData.fromMap(
                    LocalData.saloonModel.toJson()
                  );
                  for(int i=0; i<LocalData.saloonModel.images.length; ++i){
                   data.files.add(MapEntry(
                            'image',
                            await MultipartFile.fromFile(LocalData.saloonModel.images[i].path, filename: "${DateTime.now().toIso8601String()}"
                        )));
                  }


                  SaloonService().registerSaloon(data,context);
                  LocalData.saloonModel = new SaloonModel();
                },
              ),
            )
          ],
>>>>>>> b971eab4fae204d4415b967ac41e7fb9665dba84
        ),
      ),
    );
  }
}
