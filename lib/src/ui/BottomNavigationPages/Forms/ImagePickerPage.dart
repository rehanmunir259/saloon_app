import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:saloon/src/ui/BottomNavigationPages/Forms/confirm-details.dart';
import 'package:saloon/src/ui/utils/localdata.dart';

class ImagePickerPage extends StatefulWidget {
  @override
  _ImagePickerPageState createState() => _ImagePickerPageState();
}

class _ImagePickerPageState extends State<ImagePickerPage> {
  File imageFile;
  final picker = ImagePicker();
  List<File> files = [];

  openGallery(BuildContext context) async {
    var pic = await picker.getImage(source: ImageSource.gallery);
    this.setState(() {
      files.add(File(pic.path));
    });
    Navigator.of(context).pop();
  }

  openCamera(BuildContext context) async {
    var pic = (await picker.getImage(source: ImageSource.camera));
     this.setState(() {
      files.add(File(pic.path));
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
  
  // void storeData3(){
  //   LocalData.saloonModel.image = files;
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0d1137),
        title: Text(
          "Select Image",
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: GestureDetector(
              onTap: () {
                showChoiceDialog(context);
              },
              child: Icon(Icons.add),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          files.isNotEmpty ? Expanded(
                      child: ListView.builder(
                itemBuilder: (context, index) {
                  return Container(
                  //color: Colors.red,
                  height: 300.0,
                  width: 360.0,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Image.file(
                            files[index],
                            fit: BoxFit.cover,
                          ),
                  ),
                );
                  
                },
                itemCount: files.length,
                             
              ),
          ) : Center(child: Text('No image selected.')),
            SizedBox(
              height: 100.0,
            ),
            RaisedButton(
              onPressed: () {
                LocalData.saloonModel.images = files;
                
                Navigator.push(context,MaterialPageRoute(builder: (context) => ConfirmDetails(),));
              },
              child: Text(
                'Next',
                style: TextStyle(color: Colors.white),
              ),
              color: Color(0xFF0d1137),
            )
          ],
        ),
      ),
    );
  }
}
