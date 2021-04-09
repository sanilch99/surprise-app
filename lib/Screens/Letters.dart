import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:surprise/Utils/CustomColors.dart';

class Letters extends StatefulWidget {
  @override
  _LettersState createState() => _LettersState();
}

class _LettersState extends State<Letters> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: main,
        title: Text(
          "Letters",
          style: TextStyle(fontFamily: 'Londrina', color: test),
        ),
        titleSpacing: 0,
      ),
      body: Column(
        children: [
          Flexible(
            child: GridView.count(
              crossAxisCount: 2,
              children: [
                GestureDetector(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (_)=>new AlertDialog(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.all(
                                  Radius.circular(10.0))),
                          content: Builder(
                            builder: (context) {
                              // Get available height and width of the build area of this widget. Make a choice depending on the size.
                              var height = MediaQuery.of(context).size.height*0.5;
                              var width = MediaQuery.of(context).size.width*0.5;

                              return Container(
                                height: height ,
                                width: width ,
                                child: FutureBuilder(
                                    future: Future.delayed(Duration(seconds: 3)),
                                    builder: (c, s) =>
                                    s.connectionState == ConnectionState.done
                                        ? Column(
                                          children: [
                                            Text(
                                                "Hi baby,I know it's hard that we stay far, and not exactly close cudu, and u opened this letter cos momo boi wasn't able to contact me,cudu i love you so so much and the only reason i wouldn't have answered your call would be because \n1.I'm Sleeping \n2.I'm having a bath \n3.It's one of those rare times that I'm busy cudu\nI just want you to know that there's nothing I love more than you",
                                              style: TextStyle(
                                                  fontFamily: 'Indie'
                                              ),
                                            ),
                                          ],
                                        )
                                        : Lottie.asset('assets/anims/envelopeheart.json')),
                              );
                            },
                          ),
                        ),
                        );
                  },
                  child: Card(
                    color: main,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                width: 50,
                                height: 50,
                                child: Image.asset(
                                  "assets/letters.png",
                                  fit: BoxFit.contain,
                                ))),
                        Text(
                          'When I\'m not around you',
                          style: TextStyle(
                              fontFamily: 'Londrina',
                              color: quad,
                              fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (_)=>new AlertDialog(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.all(
                                Radius.circular(10.0))),
                        content: Builder(
                          builder: (context) {
                            // Get available height and width of the build area of this widget. Make a choice depending on the size.
                            var height = MediaQuery.of(context).size.height*0.5;
                            var width = MediaQuery.of(context).size.width*0.5;

                            return Container(
                              height: height ,
                              width: width ,
                              child: FutureBuilder(
                                  future: Future.delayed(Duration(seconds: 3)),
                                  builder: (c, s) =>
                                  s.connectionState == ConnectionState.done
                                      ? Column(
                                    children: [
                                      Text(
                                        "Hi cuddlu, so disclaimer - u is probably angry at me right now cos im being damn annoying, yes thats how u say DAMN ANNOYING, anywhoo momo just shshsshs me pls, i may be wrong , infact i myself believe that 99.99% im wrong but just deal a lil nah, if i say something mean dont take it just call me out but if im aise not hurting u or like bohot hi stupid nahi banra toh plez. AND IM SORRY CUDU.",
                                        style: TextStyle(
                                            fontFamily: 'Indie'
                                        ),
                                      ),
                                    ],
                                  )
                                      : Lottie.asset('assets/anims/envelopeheart.json')),
                            );
                          },
                        ),
                      ),
                    );
                  },
                  child: Card(
                    color: main,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                width: 50,
                                height: 50,
                                child: Image.asset(
                                  "assets/letters.png",
                                  fit: BoxFit.contain,
                                ))),
                        Text(
                          'When I\'m being a lil bitch',
                          style: TextStyle(
                              fontFamily: 'Londrina',
                              color: quad,
                              fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (_)=>new AlertDialog(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.all(
                                Radius.circular(10.0))),
                        content: Builder(
                          builder: (context) {
                            // Get available height and width of the build area of this widget. Make a choice depending on the size.
                            var height = MediaQuery.of(context).size.height*0.5;
                            var width = MediaQuery.of(context).size.width*0.5;

                            return Container(
                              height: height ,
                              width: width ,
                              child: FutureBuilder(
                                  future: Future.delayed(Duration(seconds: 3)),
                                  builder: (c, s) =>
                                  s.connectionState == ConnectionState.done
                                      ? Column(
                                    children: [
                                      Text(
                                        "Hi momo,Once u told me crying se chehre pe glow aata,so let out all the tears just like the famous EVAN night or like the night we cried like smol bois ainvayi. Cry during ur period,Cry during all those tough weeks,if it doesnt stop CALL ME, and if u reading this after u have told me u dont wanna talk to anyone ,just read what i would say MOMO DONT CRY NAH,SHSHSHHSHS EKDUM SHSHSHHSSHSH, I KNOW MOMO KO FACE GLOW PASAND BUT AISE KYU RONA WITH THE RED CHEEKS AND BIG NOSY SHSHSHSHSHSHH CUDDLU",
                                        style: TextStyle(
                                            fontFamily: 'Indie'
                                        ),
                                      ),
                                    ],
                                  )
                                      : Lottie.asset('assets/anims/envelopeheart.json')),
                            );
                          },
                        ),
                      ),
                    );
                  },
                  child: Card(
                    color: main,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                width: 50,
                                height: 50,
                                child: Image.asset(
                                  "assets/letters.png",
                                  fit: BoxFit.contain,
                                ))),
                        Text(
                          'When u wanna cry :(',
                          style: TextStyle(
                              fontFamily: 'Londrina',
                              color: quad,
                              fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (_)=>new AlertDialog(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.all(
                                Radius.circular(10.0))),
                        content: Builder(
                          builder: (context) {
                            // Get available height and width of the build area of this widget. Make a choice depending on the size.
                            var height = MediaQuery.of(context).size.height*0.5;
                            var width = MediaQuery.of(context).size.width*0.5;

                            return Container(
                              height: height ,
                              width: width ,
                              child: FutureBuilder(
                                  future: Future.delayed(Duration(seconds: 3)),
                                  builder: (c, s) =>
                                  s.connectionState == ConnectionState.done
                                      ? Column(
                                    children: [
                                      Text(
                                        "Hi angry lady, i see you have opened the anger letter, well u r probably fuming, i probably would have done something trash, so dana just text me,call me or read this. Im really really sorry for whatever i did babe,i might have made a mistake and im just saying sshshshsh pls im sorry. If this doesnt calm dana at all then close your eyes, remember my lip falling face and me saying KAAN PAKADKE SORRY",
                                        style: TextStyle(
                                            fontFamily: 'Indie'
                                        ),
                                      ),
                                    ],
                                  )
                                      : Lottie.asset('assets/anims/envelopeheart.json')),
                            );
                          },
                        ),
                      ),
                    );
                  },
                  child: Card(
                    color: main,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                width: 50,
                                height: 50,
                                child: Image.asset(
                                  "assets/letters.png",
                                  fit: BoxFit.contain,
                                ))),
                        Text(
                          'When U angry at me',
                          style: TextStyle(
                              fontFamily: 'Londrina',
                              color: quad,
                              fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (_)=>new AlertDialog(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.all(
                                Radius.circular(10.0))),
                        content: Builder(
                          builder: (context) {
                            // Get available height and width of the build area of this widget. Make a choice depending on the size.
                            var height = MediaQuery.of(context).size.height*0.5;
                            var width = MediaQuery.of(context).size.width*0.5;

                            return Container(
                              height: height ,
                              width: width ,
                              child: FutureBuilder(
                                  future: Future.delayed(Duration(seconds: 3)),
                                  builder: (c, s) =>
                                  s.connectionState == ConnectionState.done
                                      ? Column(
                                    children: [
                                      Text(
                                        "Hi momo, I hope that this is the letter you open/exploit the most.Well first of all cuddlu im so so so so proud of u rn cos baby abhi u happy - now u r happy cos u did something , cos u got something , cos u ate something , cos u felt something . If you happy, then theres only one person in this entire world (ok maybe 2 more sandhya and vinod) that are really smiling cos u smiling. And when im the reason for u to be happy, i promise this happiness is lesser than the next moment & I genuinely promise to do anthing to make u even happier",
                                        style: TextStyle(
                                            fontFamily: 'Indie'
                                        ),
                                      ),
                                    ],
                                  )
                                      : Lottie.asset('assets/anims/envelopeheart.json')),
                            );
                          },
                        ),
                      ),
                    );
                  },
                  child: Card(
                    color: main,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                width: 50,
                                height: 50,
                                child: Image.asset(
                                  "assets/letters.png",
                                  fit: BoxFit.contain,
                                ))),
                        Text(
                          'When You Happy',
                          style: TextStyle(
                              fontFamily: 'Londrina',
                              color: quad,
                              fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (_)=>new AlertDialog(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.all(
                                Radius.circular(10.0))),
                        content: Builder(
                          builder: (context) {
                            // Get available height and width of the build area of this widget. Make a choice depending on the size.
                            var height = MediaQuery.of(context).size.height*0.5;
                            var width = MediaQuery.of(context).size.width*0.5;

                            return Container(
                              height: height ,
                              width: width ,
                              child: FutureBuilder(
                                  future: Future.delayed(Duration(seconds: 3)),
                                  builder: (c, s) =>
                                  s.connectionState == ConnectionState.done
                                      ? Column(
                                    children: [
                                      Text(
                                        "Hi smolu, well we both know why this one has been opened, say the reason out loud, yes exactly - people around u dont do their task ache se nah. See i know you, and u just better than"
                                            "a lot of the peeps baby, u r just smarter and overall better and u want everyone to be at their best,but ur best is 2xBestDANA. So just breathe in "
                                            "and this will go away,its a phase - temporary one, and itll go away and vanish"
                                            "",
                                        style: TextStyle(
                                            fontFamily: 'Indie'
                                        ),
                                      ),
                                    ],
                                  )
                                      : Lottie.asset('assets/anims/envelopeheart.json')),
                            );
                          },
                        ),
                      ),
                    );
                  },
                  child: Card(
                    color: main,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                width: 50,
                                height: 50,
                                child: Image.asset(
                                  "assets/letters.png",
                                  fit: BoxFit.contain,
                                ))),
                        Text(
                          'When everyone is being damn annoying',
                          style: TextStyle(
                              fontFamily: 'Londrina',
                              color: quad,
                              fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (_)=>new AlertDialog(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.all(
                                Radius.circular(10.0))),
                        content: Builder(
                          builder: (context) {
                            // Get available height and width of the build area of this widget. Make a choice depending on the size.
                            var height = MediaQuery.of(context).size.height*0.5;
                            var width = MediaQuery.of(context).size.width*0.5;

                            return Container(
                              height: height ,
                              width: width ,
                              child: FutureBuilder(
                                  future: Future.delayed(Duration(seconds: 3)),
                                  builder: (c, s) =>
                                  s.connectionState == ConnectionState.done
                                      ? Column(
                                    children: [
                                      Text(
                                        "Hi Cuddlu, right now dana aka U is probably a mixture of sad ,annoyed, and u just wanna cry it out, well for  those scenarios there are different lettes, BUTTTT when we  think about  things not going your way its probably the other persons loss. Seeing that u is smart, and almost 100% right all the time, its probably gonna bite the other person's ass later. But anywhoo, things  might not always go ur way baby and that's  okay, sometimes its for the best, sometimes  its bad, but its OKAY momo.",
                                        style: TextStyle(
                                            fontFamily: 'Indie'
                                        ),
                                      ),
                                    ],
                                  )
                                      : Lottie.asset('assets/anims/envelopeheart.json')),
                            );
                          },
                        ),
                      ),
                    );
                  },
                  child: Card(
                    color: main,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                width: 50,
                                height: 50,
                                child: Image.asset(
                                  "assets/letters.png",
                                  fit: BoxFit.contain,
                                ))),
                        Text(
                          'When things dont go ur way',
                          style: TextStyle(
                              fontFamily: 'Londrina',
                              color: quad,
                              fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (_)=>new AlertDialog(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.all(
                                Radius.circular(10.0))),
                        content: Builder(
                          builder: (context) {
                            // Get available height and width of the build area of this widget. Make a choice depending on the size.
                            var height = MediaQuery.of(context).size.height*0.75;
                            var width = MediaQuery.of(context).size.width*0.5;

                            return Container(
                              height: height ,
                              width: width ,
                              child: FutureBuilder(
                                  future: Future.delayed(Duration(seconds: 3)),
                                  builder: (c, s) =>
                                  s.connectionState == ConnectionState.done
                                      ? Column(
                                    children: [
                                      Text("Hmmmmmm, so cuddlu the reasons why i love u  are as follows: \n1.You are honestly one of the best peeps that ive  "
                                          "ever met, by  best i  mean just overall wow\n2.The smile - you know how much i love the smile,the one that makes all"
                                          "probs go aways,the one that instantly wants me to smile as well,the one that just makes me happy\n3.The personality - cuddlu"
                                          "u one of the smartest friends  i have,like since  8th grade we all  know u is  smart af, plus the overall intellect just wow,\n"
                                          "4.YOU ARE HAWT, CUDU, PRETTY, SEXY,BOOTIFUL AF\n"
                                          "5.Lastly you feel  like home.  Home is the best\n"
                                          "I LOVE YOU",
                                        style: TextStyle(
                                            fontFamily: 'Indie'
                                        ),
                                      ),
                                    ],
                                  )
                                      : Lottie.asset('assets/anims/envelopeheart.json')),
                            );
                          },
                        ),
                      ),
                    );
                  },
                  child: Card(
                    color: main,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                width: 50,
                                height: 50,
                                child: Image.asset(
                                  "assets/letters.png",
                                  fit: BoxFit.contain,
                                ))),
                        Text(
                          'When you wanna  know why i lou u',
                          style: TextStyle(
                              fontFamily: 'Londrina',
                              color: quad,
                              fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (_)=>new AlertDialog(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.all(
                                Radius.circular(10.0))),
                        content: Builder(
                          builder: (context) {
                            // Get available height and width of the build area of this widget. Make a choice depending on the size.
                            var height = MediaQuery.of(context).size.height*0.5;
                            var width = MediaQuery.of(context).size.width*0.5;

                            return Container(
                              height: height ,
                              width: width ,
                              child: FutureBuilder(
                                  future: Future.delayed(Duration(seconds: 3)),
                                  builder: (c, s) =>
                                  s.connectionState == ConnectionState.done
                                      ? Column(
                                    children: [
                                      Text(
                                        "Hi momo,first of all i hope u open this all the time cos well  its ur constant mood. To  satisfy  this  craving we shall  list out "
                                            "things that you can order or make\n1. MOMO\n2. Pasta aglio olio\n3.  CHOCOLATE\n4. NOODS\n5. MUG CAKE\n6. KUNG PAO CHICKEN\n7. Biryani"
                                            "\n8. CHINESE FOOD\n9. CHICKEN POPCORN\n10. or just call me",
                                        style: TextStyle(
                                            fontFamily: 'Indie'
                                        ),
                                      ),
                                    ],
                                  )
                                      : Lottie.asset('assets/anims/envelopeheart.json')),
                            );
                          },
                        ),
                      ),
                    );
                  },
                  child: Card(
                    color: main,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                width: 50,
                                height: 50,
                                child: Image.asset(
                                  "assets/letters.png",
                                  fit: BoxFit.contain,
                                ))),
                        Text(
                          'When u is hungry',
                          style: TextStyle(
                              fontFamily: 'Londrina',
                              color: quad,
                              fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (_)=>new AlertDialog(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.all(
                                Radius.circular(10.0))),
                        content: Builder(
                          builder: (context) {
                            // Get available height and width of the build area of this widget. Make a choice depending on the size.
                            var height = MediaQuery.of(context).size.height*0.5;
                            var width = MediaQuery.of(context).size.width*0.5;

                            return Container(
                              height: height ,
                              width: width ,
                              child: FutureBuilder(
                                  future: Future.delayed(Duration(seconds: 3)),
                                  builder: (c, s) =>
                                  s.connectionState == ConnectionState.done
                                      ? Column(
                                    children: [
                                      Text(
                                        "Hi baby,\nthis is gonna be tough fun. i miss them too. i miss holding u and coming close to u and softly kissing u. i miss everything about it. how it feels so nice, the warmth, the butterfly feeling everytime,the dont go feeling, the i dont know when we will meet next so pls dont stop feeling. Its bad, u might feel u dont remember how  it  feels,but actually u do,in a weird way thats why u miss it. Trust me, i love u and the next kiss is gonna be great",
                                        style: TextStyle(
                                            fontFamily: 'Indie'
                                        ),
                                      ),
                                    ],
                                  )
                                      : Lottie.asset('assets/anims/envelopeheart.json')),
                            );
                          },
                        ),
                      ),
                    );
                  },
                  child: Card(
                    color: main,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                width: 50,
                                height: 50,
                                child: Image.asset(
                                  "assets/letters.png",
                                  fit: BoxFit.contain,
                                ))),
                        Text(
                          'When u miss a kiss',
                          style: TextStyle(
                              fontFamily: 'Londrina',
                              color: quad,
                              fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (_)=>new AlertDialog(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.all(
                                Radius.circular(10.0))),
                        content: Builder(
                          builder: (context) {
                            // Get available height and width of the build area of this widget. Make a choice depending on the size.
                            var height = MediaQuery.of(context).size.height*0.5;
                            var width = MediaQuery.of(context).size.width*0.5;

                            return Container(
                              height: height ,
                              width: width ,
                              child: FutureBuilder(
                                  future: Future.delayed(Duration(seconds: 3)),
                                  builder: (c, s) =>
                                  s.connectionState == ConnectionState.done
                                      ? Column(
                                    children: [
                                      Text(
                                        "But for now, I\'ll love you through the phone\nAnd for now, our friends will fill this home\nI\'m really gonna miss you, but I'll kiss you through the screen\nFor now, til you come home to me\n\nJust remember this song cudu,and close  ur eyes,i promise its as close to a hug i can give u,itll  feel close,itll feel warm,itll feel like home,and i hope u smile FOR NOW.",
                                        style: TextStyle(
                                            fontFamily: 'Indie'
                                        ),
                                      ),
                                    ],
                                  )
                                      : Lottie.asset('assets/anims/envelopeheart.json')),
                            );
                          },
                        ),
                      ),
                    );
                  },
                  child: Card(
                    color: main,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                width: 50,
                                height: 50,
                                child: Image.asset(
                                  "assets/letters.png",
                                  fit: BoxFit.contain,
                                ))),
                        Text(
                          'When u want a hug',
                          style: TextStyle(
                              fontFamily: 'Londrina',
                              color: quad,
                              fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (_)=>new AlertDialog(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.all(
                                Radius.circular(10.0))),
                        content: Builder(
                          builder: (context) {
                            // Get available height and width of the build area of this widget. Make a choice depending on the size.
                            var height = MediaQuery.of(context).size.height*0.5;
                            var width = MediaQuery.of(context).size.width*0.5;

                            return Container(
                              height: height ,
                              width: width ,
                              child: FutureBuilder(
                                  future: Future.delayed(Duration(seconds: 3)),
                                  builder: (c, s) =>
                                  s.connectionState == ConnectionState.done
                                      ? Column(
                                    children: [
                                      Text(
                                        "MOMO  just go  to the memories part nah  of the app, theses a whole lot  of ME making smiles,lip  pouts,and weird crazy faces. And if doesnt help  VIDEO CALl . If  that  doesnt help just come to  me :(.",
                                        style: TextStyle(
                                            fontFamily: 'Indie'
                                        ),
                                      ),
                                    ],
                                  )
                                      : Lottie.asset('assets/anims/envelopeheart.json')),
                            );
                          },
                        ),
                      ),
                    );
                  },
                  child: Card(
                    color: main,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                width: 50,
                                height: 50,
                                child: Image.asset(
                                  "assets/letters.png",
                                  fit: BoxFit.contain,
                                ))),
                        Text(
                          'When u miss my  face',
                          style: TextStyle(
                              fontFamily: 'Londrina',
                              color: quad,
                              fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Card(
              elevation: 5,
              child: Center(
                child: Text(
                  "More Letters Will Keep On Coming To Make You Smile",
                  style: TextStyle(
                    fontFamily: 'Londrina',
                    color: test
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
