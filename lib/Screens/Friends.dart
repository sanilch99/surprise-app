import 'package:flutter/material.dart';
import 'package:surprise/UtilScreens/VideoPlayerScreen.dart';
import 'package:surprise/Utils/CustomColors.dart';
import 'package:surprise/Utils/Globals.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';

class Friends extends StatefulWidget {
  @override
  _FriendsState createState() => _FriendsState();
}

class _FriendsState extends State<Friends> {
  VideoPlayerController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  List<String> url=[
    "https://res.cloudinary.com/dqt9jeyoy/video/upload/v1600605669/Kirtana_oesdsy.mp4",
    "https://thumbsnap.com/i/xJQdoMYW.mp4",
    "https://res.cloudinary.com/dqt9jeyoy/video/upload/v1600665519/vipin_czkrg9.mp4",
    "https://res.cloudinary.com/dqt9jeyoy/video/upload/v1600605447/Akshat_jnlxcw.mp4",
    "https://res.cloudinary.com/dqt9jeyoy/video/upload/v1600605553/Rishabh_w00okb.mp4",
    "https://res.cloudinary.com/dqt9jeyoy/video/upload/v1600605756/Vaishnavi_d1foyj.mp4",
    "https://res.cloudinary.com/dqt9jeyoy/video/upload/v1600606581/Ruhi_hdhazc.mp4",
    "https://res.cloudinary.com/dqt9jeyoy/video/upload/v1600606483/Aadish_ghgrp0.mp4",
    "https://res.cloudinary.com/dqt9jeyoy/video/upload/v1600606428/Sahil_umfiuv.mp4",
    "https://res.cloudinary.com/dqt9jeyoy/video/upload/v1600605889/Sarah_kujr4o.mp4",
    "https://res.cloudinary.com/dqt9jeyoy/video/upload/v1600606225/Vanshika_tgqlbz.mp4",
    "https://res.cloudinary.com/dqt9jeyoy/video/upload/v1600606362/Maulika_jamacw.mp4",
    "https://res.cloudinary.com/dqt9jeyoy/video/upload/v1600606407/Amritanshu_xjzj7t.mp4",
    "https://res.cloudinary.com/dqt9jeyoy/video/upload/v1600606222/Tiwari_l33ak8.mp4",
    "https://res.cloudinary.com/dqt9jeyoy/video/upload/v1600606262/Dheeraj_rrbq5r.mp4",
    "https://res.cloudinary.com/dqt9jeyoy/video/upload/v1600606161/Sachin_jntqzo.mp4",
    "https://res.cloudinary.com/dqt9jeyoy/video/upload/v1600606309/Rohan_q0hcji.mp4",
    "https://res.cloudinary.com/dqt9jeyoy/video/upload/v1600606564/Rajit_hhnt7v.mp4",
    "Janani&Ananya",
    "https://res.cloudinary.com/dqt9jeyoy/video/upload/v1600691422/shubz_qvayab.mp4",
    "https://res.cloudinary.com/dqt9jeyoy/video/upload/v1600680550/VID_20200921_143350_854x480_01_cpboh9.mp4",
  ];

  List<String>  names=[
    "Kirtana","Devika","Vipin","Akshat","Rishabh","Vaishnavi","Ruhi","Aadish","Sahil","Sarah","Vanshika","Maulika","Amritanshu","Tiwari","Dheeraj","Sachin",
    "Rohan","Rajit","Janani & Ananya","Shubhangi","Sanil"
  ];

  List<String>  images=[
    "assets/friends/kirtana.jpg","assets/friends/devika.jpg","assets/friends/Vipin.jpg","assets/friends/akshat.jpg","assets/friends.png","assets/friends/vaish.jpg","assets/friends/ruhi.jpg","assets/friends/aadish.jpg","assets/friends/sahil.jpg","assets/friends/sarah.jpg","assets/friends/vanshika.jpg","assets/friends/maulika.jpg","assets/friends/amrit.jpg","assets/friends/tiwari.jpg","assets/friends.png","assets/friends/sachin.jpg",
    "assets/friends/rohan.jpg","assets/friends/Rajit.jpg","assets/friends/jaa.jpg","assets/friends/shub.jpg","assets/friends/sanil.jpg"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: main,
        title: Text(
          "Friends & More",
          style: TextStyle(fontFamily: 'Londrina', color: test),
        ),
        titleSpacing: 0,
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.33,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: (){
                    String urltemp="https://res.cloudinary.com/dqt9jeyoy/video/upload/v1600665474/intro_kcyyqa.mp4";
                    Navigator.push(context, PageRouteBuilder(
                      opaque: false, // set to false
                      pageBuilder: (_, __, ___) =>
                          VideoPlayerScreen("Dana",urltemp),
                    ),);
                  },
                  child: Card(
                    color: Colors.lightBlue[100],
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              "All of your friends have something to \nsay about you, click here to see what we feel,",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'Londrina',
                                  fontSize: 20,
                                  color: main
                              ),
                            ),
                          ),

                          Container(
                            padding: EdgeInsets.all(16),
                            width: 100,
                            height: 100,
                            child: Image.asset("assets/friends/clapperboard.png",fit: BoxFit.fitWidth,),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(4,0,4,4),
                            child: Text(
                              "or scroll down to see the one\nthat you wanna see",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'Londrina',
                                  fontSize: 20
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ),
            ),
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.0,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0),
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return GestureDetector(
                  onTap: () {
                    if(index==18){
                      launch("https://drive.google.com/file/d/1ZKtTVlRQTUUSk0HK9KLt4yi9E6t_qXnO/view?usp=drivesdk");
                    }else {
                      Navigator.push(context, PageRouteBuilder(
                        opaque: false, // set to false
                        pageBuilder: (_, __, ___) =>
                            VideoPlayerScreen(names[index],url[index]),
                      ),);
                    }
                  },
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Stack(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.45,
                            height: MediaQuery.of(context).size.height * 0.25,
                            child: Card(
                              color: quad,
                              child: Image.asset(images[index],fit: BoxFit.cover,),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.45,
                            height: MediaQuery.of(context).size.height * 0.25,
                            child: Card(
                              color: Colors.black12,
                              child: Container(
                                padding: EdgeInsets.all(20),
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Text(
                                      names[index],
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontFamily: 'Londrina'
                                      ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              childCount: 21,
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(bottom: 80.0),
          )
        ],
      ),
    );
  }
}
