import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:surprise/Screens/Memories.dart';
import 'package:surprise/Utils/CustomColors.dart';
class UploadImageScreen extends StatefulWidget {
  @override
  _UploadImageScreenState createState() => _UploadImageScreenState();
}

class _UploadImageScreenState extends State<UploadImageScreen> {
  File _image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        title: Text("Upload Image",style: TextStyle(color: test,fontFamily: "Londrina"),),
        titleSpacing: 0,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: test,
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                    child: Text("Pick Image"),
                    onPressed: getImage),
              ),
              _image == null
                  ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('No image selected.'),
                  )
                  : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.file(
                      _image,
                      height: 300,
                    ),
                  ),
              RaisedButton(
                  child: Text("Save Image"),
                  onPressed: () async {
                    if (_image != null) {
                      StorageReference ref = FirebaseStorage.instance.ref();
                      StorageTaskSnapshot addImg = await ref.child(_image.path).putFile(_image).onComplete;
                      if (addImg.error == null) {
                        print("added to Firebase Storage");
                        final String downloadUrl =
                        await addImg.ref.getDownloadURL();
                        await Firestore.instance
                            .collection("memories")
                            .add({"url": downloadUrl, "who": 0});
                        await showDialog(context: context,child: AlertDialog(
                          title: Text("Your image has been uploaded successfully cudu."),
                          actions: [
                            FlatButton(
                              child: Text("Ok"),
                              onPressed: (){
                                Navigator.pop(context);
                              },
                            )
                          ],
                        ));
                        Navigator.pushReplacement(context, new MaterialPageRoute(builder: (context)=>Memories()));
                      } else {
                        print('Error from image repo ${addImg.error.toString()}');
                        throw ('This file is not an image');
                      }
                    }
                  }),
            ],
          ),
        ),
      ),

    );
  }


  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }
}
