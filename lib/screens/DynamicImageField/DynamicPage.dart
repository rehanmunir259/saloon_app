import 'package:flutter/material.dart';
import 'DynamicDataClass.dart';
import 'DynamicCard.dart';

class DynamicPage extends StatefulWidget {
  @override
  _DynamicPageState createState() => _DynamicPageState();
}

class _DynamicPageState extends State<DynamicPage> {
  List<ImageData> imagedata = [];
  List<DynamicCard> fields = [];
  bool error = false;

  @override
  Widget build(BuildContext context) {
    fields.clear();
    for (int i = 0; i < imagedata.length; i++) {
      fields.add(DynamicCard(
        key: GlobalKey(),
        imageObj: imagedata[i],
        onDelete: () => onDelete(i),
      ));
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Image URL'),
        actions: <Widget>[
          FlatButton(
            child: Text(
              'Save',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: onSave,
          )
        ],
      ),
      body: imagedata.length <= 0
          ? Center(
              child: Text('Add images by tapping [+] button below'),
            )
          : CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        error ? "Please fill all fields with valid URL" : "",
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
                SliverList(
                    delegate: SliverChildBuilderDelegate((_, i) {
                  return fields[i];
                }, childCount: imagedata.length)),
              ],
            ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: onAdd,
      ),
    );
  }

  void onDelete(int index) {
    setState(() {
      imagedata.removeAt(index);
    });
  }

  void onAdd() {
    setState(() {
      imagedata.add(ImageData());
    });
  }

  void onSave() {
    setState(() {
      for (final field in fields) {
        if (!field.isValid()) {
          error = true;
          break;
        } else {
          error = false;
        }
      }
    });
  }
}
