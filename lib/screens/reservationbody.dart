import 'package:flutter/material.dart';
import 'package:saloon/models/upcomingres_model.dart';

class SaloonResCard extends StatefulWidget {
  @override
  _SaloonResCardState createState() => _SaloonResCardState();
}

class _SaloonResCardState extends State<SaloonResCard> {
 
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      
      itemBuilder: (context, index) {
        
        return Reuseablecard(res: dummyList[index],);
      },  
      itemCount: dummyList.length,    
    );
  }
}

class Reuseablecard extends StatelessWidget {
  
  final UpcomingRes res;

  const Reuseablecard({
    Key key,
    this.res,
  }) : super(key: key);

   String getFormattedDate(String date){
    var d = DateTime.parse(date);
    return [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'June',
      'July',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ][d.month - 1] + " " + d.day.toString() + "," + d.year.toString(); 
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 120,
        width: 70,
        child: Card(
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Code: ${res.code}'),
                    Text('Name: ${res.customerName}'),
                    Text('Mob# ${res.customerPhone}'),
                    Text('Email: ${res.customerEmail}'),
                  ],
                ),
                Spacer(),
                Column(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(getFormattedDate(res.dateTime.toIso8601String(),),),
                    Text('Dis: ${res.discount.toString()}%'),
                    Text('No of Person: ${res.noofperson.toString()}'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}