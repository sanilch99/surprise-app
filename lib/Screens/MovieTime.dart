
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:surprise/Utils/CustomColors.dart';
import 'package:surprise/Utils/CustomDropDown.dart';

class MovieTime extends StatefulWidget {
  @override
  _MovieTimeState createState() => _MovieTimeState();
}

class _MovieTimeState extends State<MovieTime> with SingleTickerProviderStateMixin{
  int _selectedIndex = 0;
  TabController _tabController;
  String currentFilter="All";
  int qtype=1000;
  TextEditingController nameInputController;
  bool xyz=null;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController=TabController(vsync: this,length: 6,initialIndex: _selectedIndex);
    nameInputController=new TextEditingController();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: main,
        title: Text(
          "MovieTime",
          style: TextStyle(fontFamily: 'Londrina', color: test),
        ),
        titleSpacing: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.add,color: test,),
            onPressed: (){
              _showDialog(context);
            },
          ),
          PopupMenuButton<String>(
            onSelected: (s){
              setState(() {
                switch(s){
                  case 'Only Not Seen':
                    xyz=false;
                    break;
                  case 'Only Seen':
                    xyz=true;
                    break;
                  case 'All':
                    xyz=null;
                    break;
                }
              });
            },
            icon: Icon(Icons.sort,color: test,),
            itemBuilder: (BuildContext context) {
              return {'Only Not Seen','Only Seen','All'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice,style: TextStyle(color: test,fontFamily: 'Londrina'),),
                );
              }).toList();
            },
          ),
        ],
      ),
      backgroundColor: test,
      body: TabBarView(
        controller: _tabController,
        children: [
          Container(
            color: test,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(8.0),
                  child: CircularDropDownMenu(
                    dropDownMenuItem: [
                      DropdownMenuItem(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              qtype=1000;
                            });
                          },
                          child: Text('All',style: TextStyle(color: test),),
                        ),
                        value: 'All',
                      ),
                      DropdownMenuItem(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              qtype=0;
                            });
                          },
                          child: Text('Sanil -> Dana',style: TextStyle(color: test),),
                        ),
                        value: 'Sanil -> Dana',
                      ),
                      DropdownMenuItem(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              qtype=1;
                            });
                          },
                          child: Text('Dana -> Sanil',style: TextStyle(color: test),),
                        ),
                        value: 'Dana -> Sanil',
                      ),
                      DropdownMenuItem(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              qtype=2;
                            });
                          },
                          child: Text('Both Haven\'t',style: TextStyle(color: test),),
                        ),
                        value: 'Both Haven\'t',
                      ),
                      DropdownMenuItem(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              qtype=3;
                            });
                          },
                          child: Text('Rewatch',style: TextStyle(color: test),),
                        ),
                        value: 'Rewatch',
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        currentFilter = value;
                        switch(currentFilter){
                          case 'Rewatch':
                            setState(() {
                              qtype=3;
                            });
                            break;
                          case 'Dana -> Sanil':
                            setState(() {
                              qtype=1;
                            });
                            break;
                          case 'Sanil -> Dana':
                            setState(() {
                              qtype=0;
                            });
                            break;
                          case 'Both Haven\'t':
                            setState(() {
                              qtype=2;
                            });
                            break;
                          default:
                            setState(() {
                              qtype=1000;
                            });
                        }
                      });
                    },
                    hintText: currentFilter,
                  ),
                ),
                Flexible(
                  fit: FlexFit.loose,
                  child: StreamBuilder<QuerySnapshot>(
                    stream: qtype!=1000?Firestore.instance.collection('movietime').where('genre',isEqualTo: 0).where('type',isEqualTo: qtype).where('seen',isEqualTo: xyz).snapshots():
                    Firestore.instance.collection('movietime').where('genre',isEqualTo: 0).where('seen',isEqualTo: xyz).snapshots(),
                    builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot){
                      if(snapshot.hasError){
                        return new Text(snapshot.error.toString());
                      }
                      switch(snapshot.connectionState){
                        case ConnectionState.waiting:
                          return new CircularProgressIndicator(
                            valueColor: new AlwaysStoppedAnimation<Color>(tert),
                          );
                        default:
                          return new ListView(
                              children: snapshot.data.documents.map((DocumentSnapshot document){
                                return GestureDetector(
                                  onLongPress: (){
                                    _sendToRewatch(context, document);
                                  },
                                  child: new Card(
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
                                                  document['name'],
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      color: test,
                                                      fontFamily: 'Londrina'
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
                                                    value: document['seen'],
                                                    onChanged: (s){
                                                      Firestore.instance.collection('movietime').document(document.documentID).updateData({
                                                        'name':document['name'],
                                                        'genre':document['genre'],
                                                        'seen':!document['seen'],
                                                        'type':document['type']
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
                                                                Firestore.instance.collection('movietime').document(document.documentID).delete().then((value) => print("deleted"));
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
                                  ),
                                );
                              }).toList()
                          );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: test,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(8.0),
                  child: CircularDropDownMenu(
                    dropDownMenuItem: [
                      DropdownMenuItem(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              qtype=1000;
                            });
                          },
                          child: Text('All',style: TextStyle(color: test),),
                        ),
                        value: 'All',
                      ),
                      DropdownMenuItem(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              qtype=0;
                            });
                          },
                          child: Text('Sanil -> Dana',style: TextStyle(color: test),),
                        ),
                        value: 'Sanil -> Dana',
                      ),
                      DropdownMenuItem(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              qtype=1;
                            });
                          },
                          child: Text('Dana -> Sanil',style: TextStyle(color: test),),
                        ),
                        value: 'Dana -> Sanil',
                      ),
                      DropdownMenuItem(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              qtype=2;
                            });
                          },
                          child: Text('Both Haven\'t',style: TextStyle(color: test),),
                        ),
                        value: 'Both Haven\'t',
                      ),
                      DropdownMenuItem(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              qtype=3;
                            });
                          },
                          child: Text('Rewatch',style: TextStyle(color: test),),
                        ),
                        value: 'Rewatch',
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        currentFilter = value;
                        switch(currentFilter){
                          case 'Rewatch':
                            setState(() {
                              qtype=3;
                            });
                            break;
                          case 'Dana -> Sanil':
                            setState(() {
                              qtype=1;
                            });
                            break;
                          case 'Sanil -> Dana':
                            setState(() {
                              qtype=0;
                            });
                            break;
                          case 'Both Haven\'t':
                            setState(() {
                              qtype=2;
                            });
                            break;
                          default:
                            setState(() {
                              qtype=1000;
                            });
                        }
                      });
                    },
                    hintText: currentFilter,
                  ),
                ),
                Flexible(
                  fit: FlexFit.loose,
                  child: StreamBuilder<QuerySnapshot>(
                    stream: qtype!=1000?Firestore.instance.collection('movietime').where('genre',isEqualTo: 1).where('type',isEqualTo: qtype).where('seen',isEqualTo: xyz).snapshots():
                    Firestore.instance.collection('movietime').where('genre',isEqualTo: 1).where('seen',isEqualTo: xyz).snapshots(),
                    builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot){
                      if(snapshot.hasError){
                        return new Text(snapshot.error.toString());
                      }
                      switch(snapshot.connectionState){
                        case ConnectionState.waiting:
                          return new CircularProgressIndicator(
                            valueColor: new AlwaysStoppedAnimation<Color>(tert),
                          );
                        default:
                          return new ListView(
                              children: snapshot.data.documents.map((DocumentSnapshot document){
                                return GestureDetector(
                                  onLongPress: (){
                                    _sendToRewatch(context, document);
                                  },
                                  child: new Card(
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
                                                  document['name'],
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      color: test,
                                                      fontFamily: 'Londrina'
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
                                                    value: document['seen'],
                                                    onChanged: (s){
                                                      Firestore.instance.collection('movietime').document(document.documentID).updateData({
                                                        'name':document['name'],
                                                        'genre':document['genre'],
                                                        'seen':!document['seen'],
                                                        'type':document['type']
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
                                                                Firestore.instance.collection('movietime').document(document.documentID).delete().then((value) => print("deleted"));
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
                                  ),
                                );
                              }).toList()
                          );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: test,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(8.0),
                  child: CircularDropDownMenu(
                    dropDownMenuItem: [
                      DropdownMenuItem(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              qtype=1000;
                            });
                          },
                          child: Text('All',style: TextStyle(color: test),),
                        ),
                        value: 'All',
                      ),
                      DropdownMenuItem(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              qtype=0;
                            });
                          },
                          child: Text('Sanil -> Dana',style: TextStyle(color: test),),
                        ),
                        value: 'Sanil -> Dana',
                      ),
                      DropdownMenuItem(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              qtype=1;
                            });
                          },
                          child: Text('Dana -> Sanil',style: TextStyle(color: test),),
                        ),
                        value: 'Dana -> Sanil',
                      ),
                      DropdownMenuItem(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              qtype=2;
                            });
                          },
                          child: Text('Both Haven\'t',style: TextStyle(color: test),),
                        ),
                        value: 'Both Haven\'t',
                      ),
                      DropdownMenuItem(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              qtype=3;
                            });
                          },
                          child: Text('Rewatch',style: TextStyle(color: test),),
                        ),
                        value: 'Rewatch',
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        currentFilter = value;
                        switch(currentFilter){
                          case 'Rewatch':
                            setState(() {
                              qtype=3;
                            });
                            break;
                          case 'Dana -> Sanil':
                            setState(() {
                              qtype=1;
                            });
                            break;
                          case 'Sanil -> Dana':
                            setState(() {
                              qtype=0;
                            });
                            break;
                          case 'Both Haven\'t':
                            setState(() {
                              qtype=2;
                            });
                            break;
                          default:
                            setState(() {
                              qtype=1000;
                            });
                        }
                      });
                    },
                    hintText: currentFilter,
                  ),
                ),
                Flexible(
                  fit: FlexFit.loose,
                  child: StreamBuilder<QuerySnapshot>(
                    stream: qtype!=1000?Firestore.instance.collection('movietime').where('genre',isEqualTo: 2).where('type',isEqualTo: qtype).where('seen',isEqualTo: xyz).snapshots():
                    Firestore.instance.collection('movietime').where('genre',isEqualTo: 2).where('seen',isEqualTo: xyz).snapshots(),
                    builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot){
                      if(snapshot.hasError){
                        return new Text(snapshot.error.toString());
                      }
                      switch(snapshot.connectionState){
                        case ConnectionState.waiting:
                          return new CircularProgressIndicator(
                            valueColor: new AlwaysStoppedAnimation<Color>(tert),
                          );
                        default:
                          return new ListView(
                              children: snapshot.data.documents.map((DocumentSnapshot document){
                                return GestureDetector(
                                  onLongPress: (){
                                    _sendToRewatch(context, document);
                                  },
                                  child: new Card(
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
                                                  document['name'],
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      color: test,
                                                      fontFamily: 'Londrina'
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
                                                    value: document['seen'],
                                                    onChanged: (s){
                                                      Firestore.instance.collection('movietime').document(document.documentID).updateData({
                                                        'name':document['name'],
                                                        'genre':document['genre'],
                                                        'seen':!document['seen'],
                                                        'type':document['type']
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
                                                                Firestore.instance.collection('movietime').document(document.documentID).delete().then((value) => print("deleted"));
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
                                  ),
                                );
                              }).toList()
                          );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: test,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(8.0),
                  child: CircularDropDownMenu(
                    dropDownMenuItem: [
                      DropdownMenuItem(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              qtype=1000;
                            });
                          },
                          child: Text('All',style: TextStyle(color: test),),
                        ),
                        value: 'All',
                      ),
                      DropdownMenuItem(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              qtype=0;
                            });
                          },
                          child: Text('Sanil -> Dana',style: TextStyle(color: test),),
                        ),
                        value: 'Sanil -> Dana',
                      ),
                      DropdownMenuItem(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              qtype=1;
                            });
                          },
                          child: Text('Dana -> Sanil',style: TextStyle(color: test),),
                        ),
                        value: 'Dana -> Sanil',
                      ),
                      DropdownMenuItem(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              qtype=2;
                            });
                          },
                          child: Text('Both Haven\'t',style: TextStyle(color: test),),
                        ),
                        value: 'Both Haven\'t',
                      ),
                      DropdownMenuItem(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              qtype=3;
                            });
                          },
                          child: Text('Rewatch',style: TextStyle(color: test),),
                        ),
                        value: 'Rewatch',
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        currentFilter = value;
                        switch(currentFilter){
                          case 'Rewatch':
                            setState(() {
                              qtype=3;
                            });
                            break;
                          case 'Dana -> Sanil':
                            setState(() {
                              qtype=1;
                            });
                            break;
                          case 'Sanil -> Dana':
                            setState(() {
                              qtype=0;
                            });
                            break;
                          case 'Both Haven\'t':
                            setState(() {
                              qtype=2;
                            });
                            break;
                          default:
                            setState(() {
                              qtype=1000;
                            });
                        }
                      });
                    },
                    hintText: currentFilter,
                  ),
                ),
                Flexible(
                  fit: FlexFit.loose,
                  child: StreamBuilder<QuerySnapshot>(
                    stream: qtype!=1000?Firestore.instance.collection('movietime').where('genre',isEqualTo: 3).where('type',isEqualTo: qtype).where('seen',isEqualTo: xyz).snapshots():
                    Firestore.instance.collection('movietime').where('genre',isEqualTo: 3).where('seen',isEqualTo: xyz).snapshots(),
                    builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot){
                      if(snapshot.hasError){
                        return new Text(snapshot.error.toString());
                      }
                      switch(snapshot.connectionState){
                        case ConnectionState.waiting:
                          return new CircularProgressIndicator(
                            valueColor: new AlwaysStoppedAnimation<Color>(tert),
                          );
                        default:
                          return new ListView(
                              children: snapshot.data.documents.map((DocumentSnapshot document){
                                return GestureDetector(
                                  onLongPress: (){
                                    _sendToRewatch(context, document);
                                  },
                                  child: new Card(
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
                                                  document['name'],
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      color: test,
                                                      fontFamily: 'Londrina'
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
                                                    value: document['seen'],
                                                    onChanged: (s){
                                                      Firestore.instance.collection('movietime').document(document.documentID).updateData({
                                                        'name':document['name'],
                                                        'genre':document['genre'],
                                                        'seen':!document['seen'],
                                                        'type':document['type']
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
                                                                Firestore.instance.collection('movietime').document(document.documentID).delete().then((value) => print("deleted"));
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
                                  ),
                                );
                              }).toList()
                          );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: test,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(8.0),
                  child: CircularDropDownMenu(
                    dropDownMenuItem: [
                      DropdownMenuItem(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              qtype=1000;
                            });
                          },
                          child: Text('All',style: TextStyle(color: test),),
                        ),
                        value: 'All',
                      ),
                      DropdownMenuItem(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              qtype=0;
                            });
                          },
                          child: Text('Sanil -> Dana',style: TextStyle(color: test),),
                        ),
                        value: 'Sanil -> Dana',
                      ),
                      DropdownMenuItem(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              qtype=1;
                            });
                          },
                          child: Text('Dana -> Sanil',style: TextStyle(color: test),),
                        ),
                        value: 'Dana -> Sanil',
                      ),
                      DropdownMenuItem(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              qtype=2;
                            });
                          },
                          child: Text('Both Haven\'t',style: TextStyle(color: test),),
                        ),
                        value: 'Both Haven\'t',
                      ),
                      DropdownMenuItem(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              qtype=3;
                            });
                          },
                          child: Text('Rewatch',style: TextStyle(color: test),),
                        ),
                        value: 'Rewatch',
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        currentFilter = value;
                        switch(currentFilter){
                          case 'Rewatch':
                            setState(() {
                              qtype=3;
                            });
                            break;
                          case 'Dana -> Sanil':
                            setState(() {
                              qtype=1;
                            });
                            break;
                          case 'Sanil -> Dana':
                            setState(() {
                              qtype=0;
                            });
                            break;
                          case 'Both Haven\'t':
                            setState(() {
                              qtype=2;
                            });
                            break;
                          default:
                            setState(() {
                              qtype=1000;
                            });
                        }
                      });
                    },
                    hintText: currentFilter,
                  ),
                ),
                Flexible(
                  fit: FlexFit.loose,
                  child: StreamBuilder<QuerySnapshot>(
                    stream: qtype!=1000?Firestore.instance.collection('movietime').where('genre',isEqualTo: 4).where('type',isEqualTo: qtype).where('seen',isEqualTo: xyz).snapshots():
                    Firestore.instance.collection('movietime').where('genre',isEqualTo: 4).where('seen',isEqualTo: xyz).snapshots(),
                    builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot){
                      if(snapshot.hasError){
                        return new Text(snapshot.error.toString());
                      }
                      switch(snapshot.connectionState){
                        case ConnectionState.waiting:
                          return new CircularProgressIndicator(
                            valueColor: new AlwaysStoppedAnimation<Color>(tert),
                          );
                        default:
                          return new ListView(
                              children: snapshot.data.documents.map((DocumentSnapshot document){
                                return GestureDetector(
                                  onLongPress: (){
                                    _sendToRewatch(context, document);
                                  },
                                  child: new Card(
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
                                                  document['name'],
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      color: test,
                                                      fontFamily: 'Londrina'
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
                                                    value: document['seen'],
                                                    onChanged: (s){
                                                      Firestore.instance.collection('movietime').document(document.documentID).updateData({
                                                        'name':document['name'],
                                                        'genre':document['genre'],
                                                        'seen':!document['seen'],
                                                        'type':document['type']
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
                                                                Firestore.instance.collection('movietime').document(document.documentID).delete().then((value) => print("deleted"));
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
                                  ),
                                );
                              }).toList()
                          );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: test,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(8.0),
                  child: CircularDropDownMenu(
                    dropDownMenuItem: [
                      DropdownMenuItem(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              qtype=1000;
                            });
                          },
                          child: Text('All',style: TextStyle(color: test),),
                        ),
                        value: 'All',
                      ),
                      DropdownMenuItem(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              qtype=0;
                            });
                          },
                          child: Text('Sanil -> Dana',style: TextStyle(color: test),),
                        ),
                        value: 'Sanil -> Dana',
                      ),
                      DropdownMenuItem(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              qtype=1;
                            });
                          },
                          child: Text('Dana -> Sanil',style: TextStyle(color: test),),
                        ),
                        value: 'Dana -> Sanil',
                      ),
                      DropdownMenuItem(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              qtype=2;
                            });
                          },
                          child: Text('Both Haven\'t',style: TextStyle(color: test),),
                        ),
                        value: 'Both Haven\'t',
                      ),
                      DropdownMenuItem(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              qtype=3;
                            });
                          },
                          child: Text('Rewatch',style: TextStyle(color: test),),
                        ),
                        value: 'Rewatch',
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        currentFilter = value;
                        switch(currentFilter){
                          case 'Rewatch':
                            setState(() {
                              qtype=3;
                            });
                            break;
                          case 'Dana -> Sanil':
                            setState(() {
                              qtype=1;
                            });
                            break;
                          case 'Sanil -> Dana':
                            setState(() {
                              qtype=0;
                            });
                            break;
                          case 'Both Haven\'t':
                            setState(() {
                              qtype=2;
                            });
                            break;
                          default:
                            setState(() {
                              qtype=1000;
                            });
                        }
                      });
                    },
                    hintText: currentFilter,
                  ),
                ),
                Flexible(
                  fit: FlexFit.loose,
                  child: StreamBuilder<QuerySnapshot>(
                    stream: qtype!=1000?Firestore.instance.collection('movietime').where('genre',isEqualTo: 5).where('type',isEqualTo: qtype).where('seen',isEqualTo: xyz).snapshots():
                    Firestore.instance.collection('movietime').where('genre',isEqualTo: 5).where('seen',isEqualTo: xyz).snapshots(),
                    builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot){
                      if(snapshot.hasError){
                        return new Text(snapshot.error.toString());
                      }
                      switch(snapshot.connectionState){
                        case ConnectionState.waiting:
                          return new CircularProgressIndicator(
                            valueColor: new AlwaysStoppedAnimation<Color>(tert),
                          );
                        default:
                          return new ListView(
                              children: snapshot.data.documents.map((DocumentSnapshot document){
                                return GestureDetector(
                                  onLongPress: (){
                                    _sendToRewatch(context, document);
                                  },
                                  child: new Card(
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
                                                  document['name'],
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      color: test,
                                                      fontFamily: 'Londrina'
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
                                                    value: document['seen'],
                                                    onChanged: (s){
                                                      Firestore.instance.collection('movietime').document(document.documentID).updateData({
                                                        'name':document['name'],
                                                        'genre':document['genre'],
                                                        'seen':!document['seen'],
                                                        'type':document['type']
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
                                                                Firestore.instance.collection('movietime').document(document.documentID).delete().then((value) => print("deleted"));
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
                                  ),
                                );
                              }).toList()
                          );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

      bottomNavigationBar: ConvexAppBar(
        controller: _tabController,
        color: test,
        activeColor: test,
        backgroundColor: main,
        items: [
          TabItem(icon: Icons.favorite, title: 'Rom-Com'),
          TabItem(icon: Icons.attach_money, title: 'Thrillers'),
          TabItem(icon: Icons.security, title: 'Marvel'),
          TabItem(icon: Icons.ondemand_video, title: 'Shows'),
          TabItem(icon: Icons.movie, title: 'Misc'),
          TabItem(icon: Icons.mood, title: 'Hindi'),
        ],
        initialActiveIndex: 0,//optional, default as 0
        onTap: (int i) {
          setState(() {
            _selectedIndex=i;
          });
        },
      ),
    );
  }

  _showDialog(context) async {
    String curr="Rom-Com";
    String type="Both Haven\'t";
    bool seen=false;
    return await showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text("Add a new movie to our list cudu",
                    style: TextStyle(
                      fontFamily: 'Londrina',
                    ),),
                  Flexible(
                    fit: FlexFit.loose,
                    child: TextField(
                      autofocus: false,
                      decoration: InputDecoration(labelText: 'Title',labelStyle: TextStyle(fontFamily: 'Londrina',color: test),),
                      controller: nameInputController,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 0),
                    child: Text(
                      "Genre",
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Londrina'
                      ),
                    ),
                  ),
                  Flexible(
                    child: DropdownButton(
                      value: curr,
                      onChanged: (s){
                        setState((){
                          curr=s;
                        });
                      },
                      hint: Text("Genre"),
                      items: [
                        DropdownMenuItem(
                          child: Text("Rom-Com",style: TextStyle(fontFamily: 'Londrina',color: test)),
                          onTap: (){

                          },
                          value: "Rom-Com",
                        ),
                        DropdownMenuItem(
                          child: Text("Thriller",style: TextStyle(fontFamily: 'Londrina',color: test)),
                          onTap: (){

                          },
                          value: "Thriller",
                        ),
                        DropdownMenuItem(
                          child: Text("Marvel",style: TextStyle(fontFamily: 'Londrina',color: test)),
                          onTap: (){

                          },
                          value: "Marvel",
                        ),
                        DropdownMenuItem(
                          child: Text("Shows",style: TextStyle(fontFamily: 'Londrina',color: test)),
                          onTap: (){

                          },
                          value: "Shows",
                        ),
                        DropdownMenuItem(
                          child: Text("Misc",style: TextStyle(fontFamily: 'Londrina',color: test)),
                          onTap: (){

                          },
                          value: "Misc",
                        ),
                        DropdownMenuItem(
                          child: Text("Hindi",style: TextStyle(fontFamily: 'Londrina',color: test)),
                          onTap: (){

                          },
                          value: "Hindi",
                        ),

                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 0),
                    child: Text(
                      "Choose a category",
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Londrina'
                      ),
                    ),
                  ),
                  Flexible(
                    child: DropdownButton(
                      value: type,
                      onChanged: (s){
                        setState((){
                          type=s;
                        });
                      },
                      hint: Text("Who wants who to see"),
                      items: [
                        DropdownMenuItem(
                          child: Text("Dana -> Sanil",style: TextStyle(fontFamily: 'Londrina',color: test),),
                          onTap: (){

                          },
                          value: "Dana -> Sanil",
                        ),
                        DropdownMenuItem(
                          child: Text("Sanil -> Dana",style: TextStyle(fontFamily: 'Londrina',color: test)),
                          onTap: (){

                          },
                          value: "Sanil -> Dana",
                        ),
                        DropdownMenuItem(
                          child: Text("Both Haven\'t",style: TextStyle(fontFamily: 'Londrina',color: test)),
                          onTap: (){

                          },
                          value: "Both Haven\'t",
                        ),
                        DropdownMenuItem(
                          child: Text("Rewatch",style: TextStyle(fontFamily: 'Londrina',color: test)),
                          onTap: (){

                          },
                          value: "Rewatch",
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 0),
                    child: Row(
                      children: [
                        Text(
                          "Have Both Of Us Seen It?",
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Londrina'
                          ),
                        ),
                        Theme(
                          data: ThemeData(unselectedWidgetColor: test),
                          child: Checkbox(
                            checkColor: main,
                            activeColor: test,
                            value: seen,
                            onChanged: (s){
                              setState((){
                                seen=s;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),

                ],
              );
            },
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
                  int genre=0;
                  int t=0;
                  switch(curr){
                    case "Rom-Com":
                      genre=0;
                      break;
                    case "Thriller":
                      genre=1;
                      break;
                    case "Marvel":
                      genre=2;
                      break;
                    case "Shows":
                      genre=3;
                      break;
                    case "Misc":
                      genre=4;
                      break;
                    case "Hindi":
                      genre=5;
                      break;
                    default:
                      genre=0;
                      break;
                  }
                  switch(type){
                    case "Dana -> Sanil":
                      t=1;
                      break;
                    case "Sanil -> Dana":
                      t=0;
                      break;
                    case "Both Haven\'t":
                      t=2;
                      break;
                    case "Rewatch":
                      t=3;
                      break;
                    default:
                      t=2;
                      break;
                  }
                  if (
                  nameInputController.text.isNotEmpty) {
                    Firestore.instance
                        .collection('movietime')
                        .add({
                      "name": nameInputController.text,
                      "genre": genre,
                      'seen':seen,
                      'type':t
                    })
                        .then((result) => {
                      Navigator.pop(context),
                      nameInputController.clear(),
                    })
                        .catchError((err) => print(err));
                  }
                })
          ],
        );
      },
    );
  }

  _sendToRewatch(context,DocumentSnapshot document) async{
    return await showDialog<void>(
        context: context,
        child: AlertDialog(
          content: Text(
            'Do you wanna add this movie to rewatch category?',
            style: TextStyle(
              fontFamily: 'Londrina',
              color: test
            ),
          ),
          actions: [
            FlatButton(
              child: Text(
                'Yes',
              ),
              onPressed: (){
                Firestore.instance.collection('movietime').document(document.documentID).updateData({
                    'name':document['name'],
                    'genre':document['genre'],
                    'seen':true,
                    'type':3}
                ).then((value) => Navigator.pop(context));
              },
            ),
            FlatButton(
              child: Text(
                'No',
              ),
              onPressed: (){
                Navigator.pop(context);
              },
            )
          ],
        )
    );
  }

}
