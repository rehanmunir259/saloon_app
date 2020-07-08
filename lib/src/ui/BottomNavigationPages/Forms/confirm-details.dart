import 'package:flutter/material.dart';
import 'package:saloon/service/saloon_service.dart';
import 'package:saloon/src/models/saloon_model.dart';
import 'package:saloon/src/ui/AnimatedBottomBar/BottomBarNavigation.dart';
import 'package:saloon/src/ui/TabPages/grid-package.dart';
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
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: 
                  (context)=> BottomBarNavigation(),
                  ),);
                  SaloonService().registerSaloon(LocalData.saloonModel,context);
                  LocalData.saloonModel = new SaloonModel();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
