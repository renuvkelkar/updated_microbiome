import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_sequence_animation/flutter_sequence_animation.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:lottie/lottie.dart';
import 'package:velocity_x/velocity_x.dart';

class Page1 extends StatefulWidget {
  const Page1({Key key}) : super(key: key);

  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> with SingleTickerProviderStateMixin {
  AnimationController controller;
  SequenceAnimation sequenceAnimation;

  bool forward;
  bool isSpeaking = false;
  final FlutterTts flutterTts = FlutterTts();
  String des= "Do you know that our body has trillions of germs?";


  @override
  void initState() {
    super.initState();
    controller = new AnimationController(vsync: this);

    sequenceAnimation = new SequenceAnimationBuilder()
        .addAnimatable(
        animatable: new Tween<double>(begin: 0.0, end: 1.0),
        from: const Duration(seconds: 0),
        to: const Duration(seconds: 6),
        tag: "text1",
        curve: Curves.easeOut)
        .addAnimatable(
        animatable: new ColorTween(begin: Colors.red, end: Colors.yellow),
        from: const Duration(seconds: 0),
        to: const Duration(seconds: 2),
        tag: "color")
        .addAnimatable(
        animatable: new Tween<double>(begin: 0.0, end: 1.0),
        from: const Duration(seconds: 0),
        to: const Duration(seconds: 1),
        tag: "opacity",
        curve: Curves.easeOut)
        .addAnimatable(
        animatable: new Tween<double>(begin: 0.0, end: 1.0),
        from: const Duration(seconds: 1),
        to: const Duration(seconds: 13),
        tag: "opacity_germs1",
        curve: Curves.easeOut)
        .addAnimatable(
        animatable: new Tween<double>(begin: 0.0, end: 1.0),
        from: const Duration(seconds: 1),
        to: const Duration(seconds: 13),
        tag: "opacity_germs2",
        curve: Curves.easeOut)
        .addAnimatable(
        animatable: new Tween<double>(begin: 0.0, end: 1.0),
        from: const Duration(seconds: 1),
        to: const Duration(seconds: 13),
        tag: "opacity_germs3",
        curve: Curves.easeOut)
        .addAnimatable(
        animatable: new Tween<double>(begin: 0.0, end: 1.0),
        from: const Duration(seconds: 1),
        to: const Duration(seconds: 13),
        tag: "opacity_germs4",
        curve: Curves.easeOut)
        .addAnimatable(
        animatable: new Tween<double>(begin: 0.0, end: 1.0),
        from: const Duration(seconds: 1),
        to: const Duration(seconds: 13),
        tag: "opacity_germs5",
        curve: Curves.easeOut)
        .addAnimatable(
        animatable: new Tween<double>(begin: 0.0, end: 1.0),
        from: const Duration(seconds: 1),
        to: const Duration(seconds: 13),
        tag: "microbes",
        curve: Curves.easeOut)
        .animate(controller);
    controller.forward();
  }
  void initializeTts() {
    flutterTts.setStartHandler(() {
      setState(() {
        isSpeaking = true;
      });
    });
    flutterTts.setCompletionHandler(() {
      setState(() {
        isSpeaking = false;
      });
    });
    flutterTts.setErrorHandler((message) {
      setState(() {
        isSpeaking = false;
      });
    });
  }
  void speechSettings1() {
    flutterTts.setLanguage("hi-IN");
    flutterTts.setPitch(1);
    flutterTts.setSpeechRate(.9);
  }
  Future speak(String text) async {
    if (text != null && text.isNotEmpty) {
      var result = await flutterTts.speak(text);
      if (result == 1)
        setState(() {
          isSpeaking = true;
        });
    }
  }

  Future stop() async {
    var result = await flutterTts.stop();
    if (result == 1)
      setState(() {
        isSpeaking = false;
      });
  }
  // speak() async {
  //   await flutterTts.speak(des);
  //   flutterTts.setLanguage("en-GB");
  //   flutterTts.setPitch(50);
  //   flutterTts.setSpeechRate(1);
  //
  // }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue.shade100,
      body: AnimatedBuilder(
        builder: (context, child) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Lottie.network(
                        'https://assets7.lottiefiles.com/packages/lf20_zmKJtL.json',
                        height: 40,
                        width: 40,
                        fit: BoxFit.cover),
                    Text("Swipe to left")
                  ],
                ),
                Container(
                  height: MediaQuery.of(context).size.height*0.6,
                  child: Stack(
                    children: [
                      Center(
                        child: Image.asset("assets/images/body.png",
                            height: context.screenHeight * 0.8,
                            fit: BoxFit.cover)
                            .pOnly()
                            .opacity(value: sequenceAnimation["opacity"].value),
                      ),
                      Center(
                        child: Image.asset(
                          "assets/images/microb.png",
                          height: context.screenHeight * 0.15,
                          fit: BoxFit.cover,
                        ).pOnly( top: context.screenHeight*0.15
                        ).opacity(
                            value: sequenceAnimation["opacity_germs2"].value),
                      ),

                    ],
                  ),
                ),
                SizedBox(height: 30,),
                Text("Do you know that our body has trillions of germs? ")
                    .text
                    .size(context.isMobile ? 20 : 25)
                    .semiBold
                    .black
                    .make()
                    .p8()
                    .opacity(value: sequenceAnimation["text1"].value),
                Container(child: IconButton(onPressed: (){isSpeaking ? stop() : speak(des);}, icon: isSpeaking?Icon(Icons.volume_up,color: Colors.white,):Icon(Icons.volume_mute,color: Colors.black,))).opacity(value: sequenceAnimation["text1"].value),
              ],
            ),
          );
        },
        animation: controller,
      ),
    );
  }
}