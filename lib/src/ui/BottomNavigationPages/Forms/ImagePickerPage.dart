import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerPage extends StatefulWidget {
  @override
  _ImagePickerPageState createState() => _ImagePickerPageState();
}

class _ImagePickerPageState extends State<ImagePickerPage> {
  File imageFile;
  final picker = ImagePicker();

  openGallery(BuildContext context) async {
    var pic = await picker.getImage(source: ImageSource.gallery);
    this.setState(() {
      imageFile = File(pic.path);
    });
    Navigator.of(context).pop();
  }

  openCamera(BuildContext context) async {
    var pic = (await picker.getImage(source: ImageSource.camera)) as File;
    this.setState(() {
      imageFile = File(pic.path);
    });
    Navigator.of(context).pop();
  }

  Future<void> showChoiceDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Select an Option"),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  GestureDetector(
                    child: Text('Gallery'),
                    onTap: () {
                      openGallery(context);
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                  ),
                  GestureDetector(
                    child: Text('Camera'),
                    onTap: () {
                      openCamera(context);
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

//  Widget decideImageView(){
//    if(imageFile==null){
//      return Text('No Image Selected');
//    }
//    else{
//     return Container(
//         width: 400,
//         height: 400,
//         child: Image.file(imageFile, width: 400, height: 400,)
//       );
//    }
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(
          "Select Image",
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal,
        onPressed: () {
          showChoiceDialog(context);
        },
        child: Icon(
          Icons.image,
          color: Colors.white,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              child: imageFile == null
                  ? Text('No image selected.')
                  : Image.file(imageFile),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/Discount');
              },
              child: Text(
                'Next',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.teal,
            )
          ],
        ),
      ),
    );
  }
}
