import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:slimy_card/slimy_card.dart';
import 'package:surprise/Utils/CustomColors.dart';
import 'package:http/http.dart' as http;

class Vouchers extends StatefulWidget {
  @override
  _VouchersState createState() => _VouchersState();
}

class _VouchersState extends State<Vouchers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: main,
        title: Text(
          "Vouchers",
          style: TextStyle(fontFamily: 'Londrina', color: test),
        ),
        titleSpacing: 0,
      ),
      body: Stack(
        children: [
          RotatedBox(
            quarterTurns: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    color: head,
                    padding: EdgeInsets.all(8),
                    height: MediaQuery.of(context).size.width * 0.35,
                    width: MediaQuery.of(context).size.height * 0.9,
                    child: Text(
                      'PICK ANY VOUCHER CUDU',
                      style: TextStyle(fontSize: 75, fontFamily: 'Grace'),
                    )),
                Container(
                  color: test,
                  padding: EdgeInsets.all(8),
                  height: MediaQuery.of(context).size.width * 0.65,
                  width: MediaQuery.of(context).size.height * 0.91,
                ),
              ],
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Flexible(
                  child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: RotatedBox(
                      quarterTurns: 3,
                      child: SlimyCard(
                        color: main,
                        width: 100,
                        topCardHeight: MediaQuery.of(context).size.width * 0.55,
                        bottomCardHeight:
                            MediaQuery.of(context).size.width * 0.25,
                        borderRadius: 15,
                        topCardWidget: Card(
                          color: main,
                          child: Center(
                            child: RotatedBox(
                                quarterTurns: 1,
                                child: Column(
                                  children: [
                                    Container(
                                      width: 50,
                                      height: 50,
                                      child: Image.asset('assets/vouchers/rant.png'),
                                    ),
                                    Text(
                                      "Wanna rant, call me?",
                                      style: TextStyle(
                                          color: test, fontFamily: 'Londrina'),
                                    ),
                                  ],
                                )),
                          ),
                        ),
                        bottomCardWidget: RotatedBox(
                            quarterTurns: 1,
                            child: IconButton(
                              icon: Icon(
                                Icons.check_circle_outline,
                                color: quad,
                              ),
                              onPressed: () async{
                                var res=await http.get('http://127.0.0.1:5000/surprise-61949/us-central1/sendMail?title=Wanna Rant&index=0');
                                print(res.body);
                                Fluttertoast.showToast(msg: "Check your email cudu");
                              },
                            )),
                        slimeEnabled: true,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: RotatedBox(
                      quarterTurns: 3,
                      child: SlimyCard(
                        color: main,
                        width: 100,
                        topCardHeight: MediaQuery.of(context).size.width * 0.55,
                        bottomCardHeight:
                            MediaQuery.of(context).size.width * 0.25,
                        borderRadius: 15,
                        topCardWidget: Card(
                          color: main,
                          child: Center(
                            child: RotatedBox(
                                quarterTurns: 1,
                                child: Column(
                                  children: [
                                    Container(
                                      width: 50,
                                      height: 50,
                                      child: Image.asset('assets/vouchers/tired.png'),
                                    ),
                                    Text(
                                      "Tired. Need a massage ?",
                                      style: TextStyle(
                                          color: test, fontFamily: 'Londrina'),
                                    ),
                                  ],
                                )),
                          ),
                        ),
                        bottomCardWidget: RotatedBox(
                            quarterTurns: 1,
                            child: IconButton(
                              icon: Icon(
                                Icons.check_circle_outline,
                                color: quad,
                              ),
                              onPressed: () async{
                                var res=await http.get('http://127.0.0.1:5000/surprise-61949/us-central1/sendMail?title=Massage Timeee&index=1');
                                print(res.body);
                                Fluttertoast.showToast(msg: "Check your email cudu");
                              },
                            )),
                        slimeEnabled: true,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: RotatedBox(
                      quarterTurns: 3,
                      child: SlimyCard(
                        color: main,
                        width: 100,
                        topCardHeight: MediaQuery.of(context).size.width * 0.55,
                        bottomCardHeight:
                            MediaQuery.of(context).size.width * 0.25,
                        borderRadius: 15,
                        topCardWidget: Card(
                          color: main,
                          child: Center(
                            child: RotatedBox(
                                quarterTurns: 1,
                                child: Column(
                                  children: [
                                    Container(
                                      width: 50,
                                      height: 50,
                                      child: Image.asset('assets/vouchers/cuddle.png'),
                                    ),
                                    Text(
                                      "Free Cuddles ?",
                                      style: TextStyle(
                                          color: test, fontFamily: 'Londrina'),
                                    ),
                                  ],
                                )),
                          ),
                        ),
                        bottomCardWidget: RotatedBox(
                            quarterTurns: 1,
                            child: IconButton(
                              icon: Icon(
                                Icons.check_circle_outline,
                                color: quad,
                              ),
                              onPressed: () async{
                                var res=await http.get('http://127.0.0.1:5000/surprise-61949/us-central1/sendMail?title=Cuddlu Time&index=2');
                                print(res.body);
                                Fluttertoast.showToast(msg: "Check your email cudu");
                              },
                            )),
                        slimeEnabled: true,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: RotatedBox(
                      quarterTurns: 3,
                      child: SlimyCard(
                        color: main,
                        width: 100,
                        topCardHeight: MediaQuery.of(context).size.width * 0.55,
                        bottomCardHeight:
                            MediaQuery.of(context).size.width * 0.25,
                        borderRadius: 15,
                        topCardWidget: Card(
                          color: main,
                          child: Center(
                            child: RotatedBox(
                                quarterTurns: 1,
                                child: Column(
                                  children: [
                                    Container(
                                      width: 50,
                                      height: 50,
                                      child: Image.asset('assets/vouchers/momo.png'),
                                    ),
                                    Text(
                                      "Want Momos ?",
                                      style: TextStyle(
                                          color: test, fontFamily: 'Londrina'),
                                    ),
                                  ],
                                )),
                          ),
                        ),
                        bottomCardWidget: RotatedBox(
                            quarterTurns: 1,
                            child: IconButton(
                              icon: Icon(
                                Icons.check_circle_outline,
                                color: quad,
                              ),
                              onPressed: () async{
                                var res=await http.get('http://127.0.0.1:5000/surprise-61949/us-central1/sendMail?title=Momo Timeeeee&index=3');
                                print(res.body);
                                Fluttertoast.showToast(msg: "Check your email cudu");
                              },
                            )),
                        slimeEnabled: true,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: RotatedBox(
                      quarterTurns: 3,
                      child: SlimyCard(
                        color: main,
                        width: 100,
                        topCardHeight: MediaQuery.of(context).size.width * 0.55,
                        bottomCardHeight:
                            MediaQuery.of(context).size.width * 0.25,
                        borderRadius: 15,
                        topCardWidget: Card(
                          color: main,
                          child: Center(
                            child: RotatedBox(
                                quarterTurns: 1,
                                child: Column(
                                  children: [
                                    Container(
                                      width: 50,
                                      height: 50,
                                      child: Image.asset('assets/vouchers/shshs.png'),
                                    ),
                                    Text(
                                      "Just wanna be shshshsed?",
                                      style: TextStyle(
                                          color: test, fontFamily: 'Londrina'),
                                    ),
                                  ],
                                )),
                          ),
                        ),
                        bottomCardWidget: RotatedBox(
                            quarterTurns: 1,
                            child: IconButton(
                              icon: Icon(
                                Icons.check_circle_outline,
                                color: quad,
                              ),
                                onPressed: () async{
                                  var res=await http.get('http://127.0.0.1:5000/surprise-61949/us-central1/sendMail?title=Shshshsh Cuduu&index=4');
                                  print(res.body);
                                  Fluttertoast.showToast(msg: "Check your email cudu");
                                },
                            )),
                        slimeEnabled: true,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: RotatedBox(
                      quarterTurns: 3,
                      child: SlimyCard(
                        color: main,
                        width: 100,
                        topCardHeight: MediaQuery.of(context).size.width * 0.55,
                        bottomCardHeight:
                        MediaQuery.of(context).size.width * 0.25,
                        borderRadius: 15,
                        topCardWidget: Card(
                          color: main,
                          child: Center(
                            child: RotatedBox(
                                quarterTurns: 1,
                                child: Column(
                                  children: [
                                    Container(
                                      width: 50,
                                      height: 50,
                                      child: Image.asset('assets/vouchers/date.png'),
                                    ),
                                    Text(
                                      "Is it a Date Night?",
                                      style: TextStyle(
                                          color: test, fontFamily: 'Londrina'),
                                    ),
                                  ],
                                )),
                          ),
                        ),
                        bottomCardWidget: RotatedBox(
                            quarterTurns: 1,
                            child: IconButton(
                              icon: Icon(
                                Icons.check_circle_outline,
                                color: quad,
                              ),
                                onPressed: () async{
                                  var res=await http.get('http://127.0.0.1:5000/surprise-61949/us-central1/sendMail?title=Date Night Baby&index=5');
                                  print(res.body);
                                  Fluttertoast.showToast(msg: "Check your email cudu");
                                },
                            )),
                        slimeEnabled: true,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: RotatedBox(
                      quarterTurns: 3,
                      child: SlimyCard(
                        color: main,
                        width: 100,
                        topCardHeight: MediaQuery.of(context).size.width * 0.55,
                        bottomCardHeight:
                            MediaQuery.of(context).size.width * 0.25,
                        borderRadius: 15,
                        topCardWidget: Card(
                          color: main,
                          child: Center(
                            child: RotatedBox(
                                quarterTurns: 1,
                                child: Column(
                                  children: [
                                    Container(
                                      width: 50,
                                      height: 50,
                                      child: Image.asset('assets/vouchers/cooking.png'),
                                    ),
                                    Text(
                                      "Hungry. I'll cook 4 u?",
                                      style: TextStyle(
                                          color: test, fontFamily: 'Londrina'),
                                    ),
                                  ],
                                )),
                          ),
                        ),
                        bottomCardWidget: RotatedBox(
                            quarterTurns: 1,
                            child: IconButton(
                              icon: Icon(
                                Icons.check_circle_outline,
                                color: quad,
                              ),
                                onPressed: () async{
                                  var res=await http.get('http://127.0.0.1:5000/surprise-61949/us-central1/sendMail?title=Im Your Chef Today&index=6');
                                  print(res.body);
                                  Fluttertoast.showToast(msg: "Check your email cudu");
                                },
                            )),
                        slimeEnabled: true,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: RotatedBox(
                      quarterTurns: 3,
                      child: SlimyCard(
                        color: main,
                        width: 100,
                        topCardHeight: MediaQuery.of(context).size.width * 0.55,
                        bottomCardHeight:
                            MediaQuery.of(context).size.width * 0.25,
                        borderRadius: 15,
                        topCardWidget: Card(
                          color: main,
                          child: Center(
                            child: RotatedBox(
                                quarterTurns: 1,
                                child: Column(
                                  children: [
                                    Container(
                                      width: 50,
                                      height: 50,
                                      child: Image.asset('assets/vouchers/road-trip.png'),
                                    ),
                                    Text(
                                      "Adventure Much. Road trip?",
                                      style: TextStyle(
                                          color: test, fontFamily: 'Londrina'),
                                    ),
                                  ],
                                )),
                          ),
                        ),
                        bottomCardWidget: RotatedBox(
                            quarterTurns: 1,
                            child: IconButton(
                              icon: Icon(
                                Icons.check_circle_outline,
                                color: quad,
                              ),
                                onPressed: () async{
                                  var res=await http.get('http://127.0.0.1:5000/surprise-61949/us-central1/sendMail?title=Leggo&index=7');
                                  print(res.body);
                                  Fluttertoast.showToast(msg: "Check your email cudu");
                                },
                            )),
                        slimeEnabled: true,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: RotatedBox(
                      quarterTurns: 3,
                      child: SlimyCard(
                        color: main,
                        width: 100,
                        topCardHeight: MediaQuery.of(context).size.width * 0.55,
                        bottomCardHeight:
                        MediaQuery.of(context).size.width * 0.25,
                        borderRadius: 15,
                        topCardWidget: Card(
                          color: main,
                          child: Center(
                            child: RotatedBox(
                                quarterTurns: 1,
                                child: Column(
                                  children: [
                                    Container(
                                      width: 50,
                                      height: 50,
                                      child: Image.asset('assets/vouchers/wine.png'),
                                    ),
                                    Text(
                                      "Wine & Dine.Fancy?",
                                      style: TextStyle(
                                          color: test, fontFamily: 'Londrina'),
                                    ),
                                  ],
                                )),
                          ),
                        ),
                        bottomCardWidget: RotatedBox(
                            quarterTurns: 1,
                            child: IconButton(
                              icon: Icon(
                                Icons.check_circle_outline,
                                color: quad,
                              ),
                                onPressed: () async{
                                  var res=await http.get('http://127.0.0.1:5000/surprise-61949/us-central1/sendMail?title=Wine Time&index=8');
                                  print(res.body);
                                  Fluttertoast.showToast(msg: "Check your email cudu");
                                },
                            )),
                        slimeEnabled: true,
                      ),
                    ),
                  ),
                ],
              ))
            ],
          ),
        ],
      ),
    );
  }
}
