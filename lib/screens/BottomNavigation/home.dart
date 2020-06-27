import '../TabPages/A-Z.dart';
import '../TabPages/Categories.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Widget> tabPages = [
    Categories(),
    AZ(),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Saloon', style: TextStyle(color: Colors.black),),
          centerTitle: true,
          iconTheme: new IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          bottom: TabBar(indicatorColor: Colors.black,
            labelColor: Colors.black,
            tabs: <Widget>[
              Tab(
                text: ('Categories'),
              ),
              Tab(
                text: ('A-Z'),
              ),
            ],
          ),
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              // DrawerHeader(
              //   decoration: BoxDecoration(
              //   gradient: LinearGradient(colors: <Color>[
              //     Colors.deepOrange,
              //     Colors.orangeAccent
              //   ])
              //   ),
              // ),
                CustomListTile(Icons.filter_1,'Create Sub Admin',(){Navigator.pushNamed(context, '/SubAdmin');}),
                CustomListTile(Icons.filter_2,'Create Saloon Admin',(){Navigator.pushNamed(context, '/SaloonAdmin');}),
                CustomListTile(Icons.filter_3,'Account settings page',(){Navigator.pushNamed(context, '/AccountSetting');}),
                CustomListTile(Icons.filter_4,'Sub admins activities',(){}),
                CustomListTile(Icons.filter_5,'Saloons reservations',(){Navigator.pushNamed(context, '/SaloonReservation');}),
                CustomListTile(Icons.filter_6,'Terms and Conditions',(){}),
                CustomListTile(Icons.filter_7,'Privacy policy',(){}),
                CustomListTile(Icons.filter_8,'FAQs',(){}),
                CustomListTile(Icons.filter_9,'Contact us',(){})
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[Categories(), AZ()],
        ),
      ),
    );
  }
}


class CustomListTile extends StatelessWidget {

  IconData icon;
  String text;
  Function onTap;

  CustomListTile(this.icon, this.text, this.onTap);
  @override
  Widget build(BuildContext context) {
    return Container(
          child: Container(
        margin: EdgeInsets.only(left : 15, top: 8),
        child: InkWell(
          onTap: onTap,
          child: Container(
            height: 50,
            child: Row(
              children: <Widget>[
                Icon(icon ,size: 15,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(text, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500,  ),),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
