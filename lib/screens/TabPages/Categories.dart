import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {



  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return ListView.builder(
        itemCount: 5,
        itemBuilder: (context,i){
          return    Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Card1(w: w, h: h),
                Card2(w: w, h: h),
              ],
            ),
             Row(
              children: <Widget>[
                Card2(w: w, h: h),
                Card1(w: w, h: h),
              ],
            ),
          ],
        );   
        }) ;
  }
}




class Card2 extends StatelessWidget {
  const Card2({
    Key key,
    @required this.w,
    @required this.h,
  }) : super(key: key);

  final double w;
  final double h;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: w / 2,
      height: h / 2,
      child: Card(
        elevation: 5,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular((15))),
        color: Colors.black,
        child: Container(
          margin: EdgeInsetsDirectional.only(
            top: 15,
          ),
          child: Column(children: <Widget>[
            CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(
                  'https://images.unsplash.com/photo-1555274175-75f4056dfd05?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80'),
            ),
            SizedBox(
              height: h / 200,
            ),
            Text('Addidas',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w900)),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsetsDirectional.only(start: 20),
              child: Text(
                'Lorem Ipsum is simply dummy text.Lorem Ipsum has been the industrys standard dummy text  ',
                style: TextStyle(
                  color: Colors.white,
                ),
                // textAlign: TextAlign.justify,
              ),
            ),
            Container(
              margin: EdgeInsetsDirectional.only(start: 20, top: 40),
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





class Card1 extends StatelessWidget {
  const Card1({
    Key key,
    @required this.w,
    @required this.h,
  }) : super(key: key);

  final double w;
  final double h;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: w / 2,
      height: h / 2.5,
      child: Card(
        elevation: 5,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular((15))),
        color: Colors.green,
        child: Container(
          margin: EdgeInsetsDirectional.only(
            top: 15,
          ),
          child: Column(children: <Widget>[
            CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(
                  'https://images.unsplash.com/photo-1545231027-637d2f6210f8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1575&q=80'),
            ),
            SizedBox(
              height: h / 200,
            ),
            Text('Starbucks',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w900)),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsetsDirectional.only(start: 20),
              child: Text(
                'Lorem Ipsum is simply dummy text. ',
                style: TextStyle(
                  color: Colors.white,
                ),
                // textAlign: TextAlign.justify,
              ),
            ),
            Container(
              margin: EdgeInsetsDirectional.only(start: 20, top: 20),
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
