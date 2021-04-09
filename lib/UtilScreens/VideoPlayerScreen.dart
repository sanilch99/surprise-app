import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:surprise/Screens/Friends.dart';
import 'package:surprise/Utils/CustomColors.dart';
import 'package:surprise/Utils/Globals.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  String url;
  String name;
  VideoPlayerScreen(this.name,this.url);


  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState(this.name,this.url);
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  VideoPlayerController _controller;
  Future<void> _initVideoFuture;
  String url;
  String name;
  _VideoPlayerScreenState(this.name,this.url);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = VideoPlayerController.network(
        widget.url);
    _initVideoFuture=_controller.initialize();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.black12,
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.black87,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height*0.80,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)
                  ),
                  color: main,
                  elevation: 5,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          RaisedButton(
                            elevation: 0,
                            color: main,
                            child: Icon(Icons.arrow_back,color: test,),
                            onPressed: (){
                              _controller.pause();
                              Navigator.pop(context);
                            },
                          ),
                          Text(
                            "${name}'s Video",
                            style: TextStyle(
                              fontSize: 24,
                              fontFamily: 'Londrina',
                              color: test
                            ),
                          ),
                        ],
                      ),
                      Flexible(
                          child: FutureBuilder(
                            future: _initVideoFuture,
                            builder: (context,snapshot){
                              if(snapshot.connectionState==ConnectionState.done){
                                return Center(
                                  child: AspectRatio(
                                    aspectRatio: _controller.value.aspectRatio,
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Stack(
                                         children: [
                                           VideoPlayer(_controller),
                                           Column(
                                             mainAxisSize: MainAxisSize.max,
                                             mainAxisAlignment: MainAxisAlignment.end,
                                             children: [
                                               VideoProgressIndicator(_controller, allowScrubbing: true,padding: EdgeInsets.only(bottom: 5),),
                                             ],
                                           ),
                                         ],
                                      ),
                                    ),
                                  ),
                                );
                              }else{
                                return Center(
                                  child: CircularProgressIndicator(
                                  ),
                                );

                              }
                            },
                          )
                          ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RaisedButton(
                          shape: CircleBorder(side: BorderSide.none),
                          onPressed: () {
                            setState(() {
                              _controller.value.isPlaying
                                  ? _controller.pause()
                                  : _controller.play();
                            });
                          },
                          child: Icon(
                            _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
