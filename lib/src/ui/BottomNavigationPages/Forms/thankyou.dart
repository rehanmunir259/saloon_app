import 'package:flutter/material.dart';

class ThankyouPage extends StatefulWidget {
  @override
  _ThankyouPageState createState() => _ThankyouPageState();
}

class _ThankyouPageState extends State<ThankyouPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thankyou for reservation with us',style:TextStyle(fontSize: 18),),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
                Text('Name:',style: TextStyle(fontSize: 17.0),),
              SizedBox(height: 10,),
              Text('Email:',style: TextStyle(fontSize: 17.0),),
              SizedBox(height: 10,),
              Text('Phone:',style: TextStyle(fontSize: 17.0),),
              SizedBox(height: 10,),
              Text('Reservation Code:',style: TextStyle(fontSize: 17.0),),
              SizedBox(height: 10,),
              Text('No of Person:',style: TextStyle(fontSize: 17.0),),
              SizedBox(height: 10,),
              Text('Date:',style: TextStyle(fontSize: 17.0),),
              SizedBox(height: 10,),
              Text('Time:',style: TextStyle(fontSize: 17.0),),
              SizedBox(height: 10,),
              Text('Discount:',style: TextStyle(fontSize: 17.0),),
              SizedBox(height: 10,),
              Center(
                child: SizedBox(
                  height: 50,
                  width: 150,
                              child: RaisedButton(
                                elevation: 5,
                    onPressed: (){},
                    child: Text('OK',style: TextStyle(color: Colors.white,fontSize: 18),),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    color: Colors.teal[300], 
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
