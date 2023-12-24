import 'package:animate_do/animate_do.dart';
import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:flutter/material.dart';

class Thala extends StatefulWidget {
  const Thala({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ThalaState createState() => _ThalaState();
}

class _ThalaState extends State<Thala> {
  late CustomVideoPlayerController _customVideoPlayerController;

  void initState() {
    super.initState();
    initializeVideoPlayer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.yellowAccent,
          title: FadeIn(
            child: const Text(
              "THALA SPOTEDDD!!!!",
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
        body: Stack(
          //fit: StackFit.loose,
          children: [
            ListView(
              children: [
                SlideInLeft(
                    child: Pulse(
                        infinite: true,
                        child: Image.asset("assets/thala.png"))),
                SlideInRight(
                    child: Pulse(
                        infinite: true,
                        child: Image.asset("assets/thala.png"))),
                SlideInLeft(
                    child: Pulse(
                        infinite: true,
                        child: Image.asset("assets/thala.png"))),
                SlideInRight(
                    child: Pulse(
                        infinite: true,
                        child: Image.asset("assets/thala.png"))),
                SlideInLeft(
                    child: Pulse(
                        infinite: true,
                        child: Image.asset("assets/thala.png"))),
              ],
            ),
            ZoomIn(
              child: Center(
                child: ShakeX(
                  delay: const Duration(microseconds: 100),
                  infinite: true,
                  child: Container(
                    padding: EdgeInsets.all(2),
                    margin: EdgeInsets.all(2),
                    child: CustomVideoPlayer(
                        customVideoPlayerController:
                            _customVideoPlayerController),
                  ),
                ),
              ),
            )
          ],
        ));
  }

  void initializeVideoPlayer() {
    VideoPlayerController videoPlayerController;
    videoPlayerController = VideoPlayerController.asset("assets/thala.mp4")
      ..initialize().then((value) {
        setState(() {});
      });
    _customVideoPlayerController = CustomVideoPlayerController(
        context: context, videoPlayerController: videoPlayerController);
  }
}
