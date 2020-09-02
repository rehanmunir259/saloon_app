import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:saloon/service/saloon_service.dart';
import 'package:saloon/src/models/saloon_model.dart';
import 'package:saloon/src/ui/SaloonPanel/SaloonBottomNavigationPages/pageview.dart';

class UserSaloons extends StatefulWidget {
  @override
  _UserSaloonsState createState() => _UserSaloonsState();
}

class _UserSaloonsState extends State<UserSaloons> {
  final _saloonservice = SaloonService();
  Future<List<SaloonModel>> saloonPageFuture;

  @override
  void initState() {
    super.initState();
    saloonPageFuture = _saloonservice.getSaloons();
    //saloonPageFuture.then((value) => print(value));
  }

  final List<Color> colour = [
    Colors.orange,
    Colors.deepPurple[300],
    Colors.cyan[200],
    Colors.pink[200]
  ];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: saloonPageFuture,
      builder: (context, snapshot) {
        if (snapshot.data == null) {
          return Container(
            child: Center(
              child: Text("Loading...."),
            ),
          );
        } else {
          return StaggeredGridView.countBuilder(
            crossAxisCount: 4,
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) => GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          Pageview(saloon: snapshot.data[index])),
                );
              },
              child: Card1(
                snapshot.data[index],
                colour[index % colour.length],
              ),
            ),
            staggeredTileBuilder: (int index) =>
                StaggeredTile.count(2, index.isEven ? 3.25 : 2.75),
            mainAxisSpacing: 4.0,
            crossAxisSpacing: 4.0,
          );
        }
      },
    );
  }
}

class Card1 extends StatelessWidget {
  Card1(this.saloon, this.color);

  final SaloonModel saloon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: onTap,
      child: Card(
        elevation: 5,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular((15))),
        color: color,
        child: Container(
          margin: EdgeInsetsDirectional.only(top: 15, start: 20, end: 20),
          child: Column(children: <Widget>[
            CircleAvatar(
              radius: 55,
              backgroundImage:
                  NetworkImage("http://192.168.1.103:3000/$saloon[0].image"),
            ),
            SizedBox(height: 15),
            Text(saloon.name,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w900)),
            SizedBox(height: 10),
            Expanded(
              child: Text(
                saloon.service,
                style: TextStyle(
                  color: Colors.white,
                ),
                // textAlign: TextAlign.justify,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                children: <Widget>[
                  Icon(Icons.schedule, color: Colors.white),
                  Text(
                    saloon.openingTime + '-' + saloon.closingTime,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w900),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Icon(Icons.edit, color: Colors.white),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
