import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:surprise/Utils/CustomColors.dart';

class BucketList extends StatefulWidget {
  @override
  _BucketListState createState() => _BucketListState();
}

class _BucketListState extends State<BucketList> {
  TextEditingController titleInputController;
  TextEditingController descripInputController;
  bool del=false;

  @override
  void initState() {
    titleInputController=new TextEditingController();
    descripInputController=new TextEditingController();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: test,
      appBar: AppBar(
        backgroundColor: main,
        title: Text(
          "Bucket List",
          style: TextStyle(fontFamily: 'Londrina', color: test),
        ),
        titleSpacing: 0,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: main,
        child: Icon(Icons.add,color: test,),
        onPressed: (){
          _showDialog();
        },
      ),
      body:Center(
        child: Container(
          padding: EdgeInsets.all(10),
          child: StreamBuilder<QuerySnapshot>(
            stream: Firestore.instance.collection('bucketlist').snapshots(),
            builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot){
              if(snapshot.hasError){
                return new Text(snapshot.error.toString());
              }
              switch(snapshot.connectionState){
                case ConnectionState.waiting:
                  return new Text('Loading...');
                default:
                  return new ListView(
                      children: snapshot.data.documents.map((DocumentSnapshot document){
                        return new Card(
                          color: main,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          document['title'],
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: test,
                                            fontFamily: 'Londrina'
                                          ),
                                        ),
                                        Text(
                                          document['desc'],
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: 'Londrina',
                                            color: test
                                        ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Theme(
                                          data: ThemeData(unselectedWidgetColor: test),
                                          child: Checkbox(
                                            checkColor: main,
                                            activeColor: test,
                                            value: document['status'],
                                            onChanged: (s){
                                              Firestore.instance.collection('bucketlist').document(document.documentID).updateData({
                                                'title':document['title'],
                                                'desc':document['desc'],
                                                'status':!document['status'],
                                                'belongs_to':0
                                              }).then((value) => print("Success"));
                                            },
                                          ),
                                        ),
                                        IconButton(
                                          icon: Icon(Icons.delete,color: test,),
                                          onPressed: ()async{
                                            await showDialog(
                                                context: context,
                                                child: AlertDialog(
                                                  content: Text(
                                                    'You sure you wanna remove this amaze fun thing off your list?',
                                                    style: TextStyle(
                                                      color: main,
                                                      fontSize: 16
                                                    ),
                                                  ),
                                                  actions: [
                                                    FlatButton(
                                                      onPressed: (){
                                                        Firestore.instance.collection('bucketlist').document(document.documentID).delete().then((value) => print("deleted"));
                                                        Navigator.pop(context);
                                                      },
                                                      child: Text("Delete"),
                                                    ),
                                                    FlatButton(
                                                      onPressed: (){
                                                        Navigator.pop(context);
                                                      },
                                                      child: Text("Cancel"),
                                                    )

                                                  ],
                                                )
                                            );
                                          },
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                        );
                      }).toList()
                  );
              }
            },
          )
        ),
      ) ,
    );
  }

  _showDialog() async {
    await showDialog<String>(
      context: context,
      child: AlertDialog(
        contentPadding: const EdgeInsets.all(16.0),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text("Add a new item the bucket list cudu",
            style: TextStyle(
              fontFamily: 'Londrina',
            ),),
            Expanded(
              child: TextField(
                decoration: InputDecoration(labelText: 'Title*'),
                controller: titleInputController,
              ),
            ),
            Expanded(
              child: TextField(
                decoration: InputDecoration(labelText: 'Description*'),
                controller: descripInputController,
              ),
            )
          ],
        ),
        actions: <Widget>[
          FlatButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.pop(context);
              }),
          FlatButton(
              child: Text('Add'),
              onPressed: () {
                if (descripInputController.text.isNotEmpty &&
                    titleInputController.text.isNotEmpty) {
                  Firestore.instance
                      .collection('bucketlist')
                      .add({
                    "title": titleInputController.text,
                    "desc": descripInputController.text,
                    'status':false,
                    'belongs_to':0
                  })
                      .then((result) => {
                    Navigator.pop(context),
                    titleInputController.clear(),
                    descripInputController.clear(),
                  })
                      .catchError((err) => print(err));
                }
              })
        ],
      ),
    );
  }
}
