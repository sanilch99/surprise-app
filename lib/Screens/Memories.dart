import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:surprise/UtilScreens/UploadImageScreen.dart';
import 'package:surprise/UtilScreens/ViewImage.dart';
import 'package:surprise/Utils/CustomColors.dart';
import 'package:transparent_image/transparent_image.dart';

class Memories extends StatefulWidget {
  @override
  _MemoriesState createState() => _MemoriesState();
}

class _MemoriesState extends State<Memories> {
  File _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: test,
      appBar: AppBar(
        backgroundColor: main,
        title: Text(
          "Memories",
          style: TextStyle(fontFamily: 'Londrina', color: test),
        ),
        titleSpacing: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.add,color: test,),
            onPressed: (){
              Navigator.pushReplacement(context, new MaterialPageRoute(builder: (context)=>UploadImageScreen()));
            },
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(children: <Widget>[
          Flexible(
            child: FutureBuilder<QuerySnapshot>(
              future: getImages(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if(snapshot.hasError){
                  print(snapshot.error.toString());
                }
                if (snapshot.connectionState == ConnectionState.done) {
                  return GridView.builder(
                      gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3),
                      shrinkWrap: true,
                      itemCount: snapshot.data.documents.length,
                      itemBuilder: (context,index){
                        return GestureDetector(
                          onTap: (){
                            Navigator.push(context, new MaterialPageRoute(builder: (context)=>ViewImage(snapshot.data.documents[index].data["url"])));
                          },
                          child: Card(
                            child: FadeInImage.memoryNetwork(placeholder: kTransparentImage, image: snapshot.data.documents[index].data["url"],fit: BoxFit.contain,)
                          ),
                        );
                      },
                      );
                } else if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                return CircularProgressIndicator();
              },
            ),
          ),
        ]),
      ),
    );
  }


  Future<QuerySnapshot> getImages() {
    return Firestore.instance.collection("memories").getDocuments();
  }
}
