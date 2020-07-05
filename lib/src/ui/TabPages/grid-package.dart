import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class GridPackage extends StatefulWidget {
  @override
  _GridPackageState createState() => _GridPackageState();
}

class _GridPackageState extends State<GridPackage> {
  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      crossAxisCount: 4,
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) => Card1(
        color: Colors.amber.shade400,
      ),
      staggeredTileBuilder: (int index) =>
          StaggeredTile.count(2, index.isEven ? 3.25 : 2.75),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );
  }
}

class Card1 extends StatelessWidget {
  const Card1({
    Key key,
    this.color,
    this.onTap,
  }) : super(key: key);

  final Color color;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 5,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular((15))),
        color: color,
        child: Container(
          margin: EdgeInsetsDirectional.only(
            top: 15,
          ),
          child: Column(children: <Widget>[
            CircleAvatar(
              radius: 55,
              backgroundImage: NetworkImage(
                  'https://images.unsplash.com/photo-1545231027-637d2f6210f8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1575&q=80'),
            ),
            SizedBox(height: 20),
            Text('Starbucks',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w900)),
            SizedBox(height: 10),
            Expanded(
              child: Container(
                padding: EdgeInsetsDirectional.only(start: 20),
                child: Text(
                  'Lorem Ipsum is simply dummy text. ',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  // textAlign: TextAlign.justify,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(15, 0, 10, 10),
              child: Row(
                children: <Widget>[
                  Icon(Icons.schedule, color: Colors.white),
                  SizedBox(
                    width: 5,
                  ),
                  Text('9am-7pm',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w900))
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
