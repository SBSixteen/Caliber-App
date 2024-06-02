// ignore_for_file: file_names

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:calibre/Provider/AuthService.dart';
import 'package:calibre/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:video_player/video_player.dart';
import 'package:sign_in_button/sign_in_button.dart';

class SignInScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(
        Uri.parse('https://localhost:7069/api/Video/LoginVideo'))
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {
          _controller.play();
          _controller.setLooping(true);
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(color: Colors.black),
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: [
              _controller.value.isInitialized
                  ? SizedBox(
                      child: VideoPlayer(_controller),
                    )
                  : Container(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Row(
                          children: [
                            Text(
                              "Caliber",
                              style: TextStyle(
                                  fontFamily: "Inter SemiBold",
                                  fontSize: 64,
                                  color: Colors.white),
                            ),
                            Text(
                              ".",
                              style: TextStyle(
                                  fontFamily: "Inter SemiBold",
                                  fontSize: 64,
                                  color: Colors.red),
                            ),
                            Spacer(),
                          ],
                        ).animate().fadeIn(duration: 7000.ms, delay: 1500.ms),
                      ],
                    )),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        const Spacer(),
                        InkWell(
                            child: Image.network(
                              "https://th.bing.com/th/id/R.0dd54f853a1bffb0e9979f8146268af3?rik=qTQlRtQRV5AliQ&riu=http%3a%2f%2fpluspng.com%2fimg-png%2fgoogle-logo-png-google-logo-icon-png-transparent-background-1000.png&ehk=VlcCHZ7jyV%2fCI7dZfbUl8Qb9%2f7uibkF6I6MBoqTtpRU%3d&risl=&pid=ImgRaw&r=0",
                              width: 40,
                              height: 40,
                            ),
                            onTap: () {
                              AuthService().handleGoogleSignIn();
                            }),
                      ],
                    ),
                  ),
                                    Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Row(
                                                          children: [
                                                            const Spacer(),
                                                            InkWell(
                                                                child: Image.network(
                                                                  "https://clipartcraft.com/images/facebook-logo-circle-2.png",
                                                                  width: 40,
                                                                  height: 40,
                                                                ),
                                                                onTap: () {
                                                                }),
                                                          ],
                                                        ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Row(
                                                          children: [
                                                            const Spacer(),
                                                            InkWell(
                                                                child: Image.network(
                                                                  "https://th.bing.com/th/id/R.9230943f4e960d4311f3c8b9c28d92ab?rik=SCK0sB8EXFwNkA&pid=ImgRaw&r=0",
                                                                  width: 40,
                                                                  height: 40,
                                                                ),
                                                                onTap: () {
                                      
                                                                }),
                                                          ],
                                                        ),
                                    ),

                ],
              ).animate().fadeIn(duration: 2000.ms, delay: 7000.ms)
            ],
          ),
        ),
      ),
    );
  }
}
