import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:surprise/Screens/BucketList.dart';
import 'package:surprise/Screens/Friends.dart';
import 'package:surprise/Screens/Letters.dart';
import 'package:surprise/Screens/Memories.dart';
import 'package:surprise/Screens/MovieTime.dart';
import 'package:surprise/Screens/Vouchers.dart';
import 'package:surprise/Utils/CustomColors.dart';
import 'package:surprise/Utils/Strings.dart';
import 'package:surprise/Utils/Utils.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    DateTime dateTimeCreatedAt = DateTime.utc(2019, 12, 26);
    DateTime dateTimeNow = DateTime.now();
    final differenceInDays = dateTimeNow.difference(dateTimeCreatedAt).inDays-3;
    int years = (differenceInDays / 365).floor();
    int months = (((differenceInDays % 365) / 30).floor());
    int days = (((differenceInDays % 365) % 30).floor());
    return Scaffold(
      backgroundColor: test,
      appBar: AppBar(
        backgroundColor: main,
        title: Text(
            "Hi Momo !!!",
          style: TextStyle(
              fontFamily: 'Londrina',
              fontSize: 24,
              color:test),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 8),
            width: MediaQuery.of(context).size.width * 0.95,
            child: Card(
              elevation: 5,
              color: main,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      'It\'s Been',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Londrina',
                          fontSize: 16,
                          color: test),
                    ),
                    Text(
                      '$years Years $months Months $days Days',
                      style: TextStyle(
                          fontSize: 24,
                          fontFamily: 'Londrina',
                          color: head),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Flexible(
            child: GridView.count(
              crossAxisCount: 2,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 4.0, 4, 4),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, new MaterialPageRoute(builder: (context)=>Memories()));
                    },
                    child: Card(
                      elevation: 2,
                      color: main,
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Memories",
                              style: TextStyle(
                                  color: test,
                                  fontWeight: FontWeight.w300,
                                  fontFamily: 'Londrina',
                                  fontSize: 20),
                            ),
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child:Container(width:50,height: 50,child: Image.asset("assets/memories.png",fit: BoxFit.contain,))
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(4, 4.0, 8, 4),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, new MaterialPageRoute(builder: (context)=>Friends()));
                    },
                    child: Card(
                      elevation: 2,
                      color: main,
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Friends & More",
                              style: TextStyle(
                                  color: test,
                                  fontWeight: FontWeight.w300,
                                  fontFamily: 'Londrina',
                                  fontSize: 20),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(width:50,height: 50,child: Image.asset("assets/friends.png",fit: BoxFit.contain,))
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 4.0, 4, 4),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, new MaterialPageRoute(builder: (context)=>Vouchers()));
                    },
                    child: Card(
                      elevation: 2,
                      color: main,
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Vouchers",
                              style: TextStyle(
                                  color: test,
                                  fontWeight: FontWeight.w300,
                                  fontFamily: 'Londrina',
                                  fontSize: 20),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(width:50,height: 50,child: Image.asset("assets/voucher.png",fit: BoxFit.contain,))
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(4, 4.0, 8, 4),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, new MaterialPageRoute(builder: (context)=>BucketList()));
                    },
                    child: Card(
                      elevation: 2,
                      color: main,
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Bucket List",
                              style: TextStyle(
                                  color: test,
                                  fontWeight: FontWeight.w300,
                                  fontFamily: 'Londrina',
                                  fontSize: 20),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(width:50,height: 50,child: Image.asset("assets/bucketlist.png",fit: BoxFit.contain,)),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 4.0, 4, 4),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context,new MaterialPageRoute(builder: (context)=>MovieTime()));
                    },
                    child: Card(
                      elevation: 2,
                      color: main,
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "MovieTime",
                              style: TextStyle(
                                  color: test,
                                  fontWeight: FontWeight.w300,
                                  fontFamily: 'Londrina',
                                  fontSize: 20),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(width:50,height: 50,child: Image.asset("assets/movies.png",fit: BoxFit.contain,))
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(4, 4.0, 8, 4),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context,new MaterialPageRoute(builder: (context)=>Letters()));
                    },
                    child: Card(
                      elevation: 2,
                      color: main,
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Letters",
                              style: TextStyle(
                                  color: test,
                                  fontWeight: FontWeight.w300,
                                  fontFamily: 'Londrina',
                                  fontSize: 20),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(width:50,height: 50,child: Image.asset("assets/letters.png",fit: BoxFit.contain,))
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  String _timeString;

  @override
  void initState() {
    //Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime(DateTime.utc(2019,12,26)));
    super.initState();
  }
}
