import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:surprise/Utils/CustomColors.dart';
class ViewImage extends StatefulWidget {
  String url;
  ViewImage(this.url);
  @override
  _ViewImageState createState() => _ViewImageState(this.url);
}

class _ViewImageState extends State<ViewImage> {
  String url;

  _ViewImageState(this.url);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: test,
      ),
      body: Container(
          child: PhotoView(
              imageProvider: NetworkImage(url)
          )
      ),
    );
  }
}
