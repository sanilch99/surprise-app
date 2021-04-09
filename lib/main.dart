import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:surprise/Screens/Home.dart';
import 'package:surprise/Utils/CustomColors.dart';
import 'package:surprise/Utils/Strings.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        scaffoldBackgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
        loadingText: Text("Collecting Memories..",
            style: new TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
            fontFamily: 'Londrina'
        ),
        ),
        seconds: 4,
        navigateAfterSeconds: new Home(),
        title: new Text('Welcome Dana',
          style: new TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            fontFamily: 'Londrina'
          ),),
        image: new Image.asset("assets/friends.png"),
        backgroundColor: test,
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 100.0,
        onClick: ()=>print("Flutter Egypt"),
        loaderColor:head
    );
  }
}
