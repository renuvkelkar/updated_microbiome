import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sequence_animation/flutter_sequence_animation.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:lottie/lottie.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:google_fonts/google_fonts.dart';
class SuperSlide4 extends StatefulWidget {
  const SuperSlide4({Key key}) : super(key: key);

  @override
  _SuperSlide4State createState() => _SuperSlide4State();
}

class _SuperSlide4State extends State<SuperSlide4>with SingleTickerProviderStateMixin {
  AnimationController controller;
  SequenceAnimation sequenceAnimation;
  bool isSpeaking = false;
  final FlutterTts flutterTts = FlutterTts();
  String des= "Eating seasonal fruits and vegetables";

  bool forward;

  @override
  void initState() {
    super.initState();
    // Timer(Duration(seconds: 20), (){
    //   Navigator.of(context).pushReplacement(MaterialPageRoute(
    //     builder: (context) => HomePage(),
    //   ));
    // });
    controller = new AnimationController(vsync: this);

    sequenceAnimation = new SequenceAnimationBuilder()
        .addAnimatable(
        animatable: new Tween<double>(begin: 0.0, end: 1.0),
        from:  const Duration(seconds: 0),
        to: const Duration(seconds: 1),
        tag: "opacity",
        curve: Curves.easeOut

    ).addAnimatable(
        animatable: new Tween<double>(begin: 0.0, end: 1.0),
        from:  const Duration(seconds: 0),
        to: const Duration(seconds: 2),
        tag: "text1",
        curve: Curves.easeOut

    ).addAnimatable(
        animatable: new Tween<double>(begin: 0.0, end: 1.0),
        from:  const Duration(seconds: 2),
        to: const Duration(seconds: 5),
        tag: "image1",
        curve: Curves.easeOut
    ).addAnimatable(
        animatable: new Tween<double>(begin: 0.0, end: 1.0),
        //  animatable: new Tween<double>(begin: 200.0, end: 40.0),
        from:  const Duration(seconds: 5),
        to: const Duration(seconds: 7),
        tag: "text2",
        curve: Curves.fastOutSlowIn
    ).addAnimatable(
        animatable: new Tween<double>(begin: 0.0, end: 1.0),
        from:  const Duration(seconds: 10),
        to: const Duration(seconds: 13),
        tag: "bacteria",
        curve: Curves.easeOut
    ).animate(controller);
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
      backgroundColor: Colors.orange,

      body: Column(
        children: [
          AnimatedBuilder(
            builder: (context, child){
              return
                VxBox(
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.end,
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

                        //Text("We can get these germs superpowers by:").text.size(context.isMobile?25:30).semiBold.white.makeCentered().p8().opacity(value: sequenceAnimation["text1"].value),
                        Image.asset("assets/images/veg.png",height:context.screenHeight*0.5,width:context.screenWidth,fit: BoxFit.contain,).opacity(value: sequenceAnimation["image1"].value),

                        Text("Eating seasonal fruits and vegetables").text.size(context.isMobile?25:30).semiBold.white.make().p8().opacity(value: sequenceAnimation["text2"].value),
                        Container(child: IconButton(onPressed: (){isSpeaking ? stop() : speak(des);}, icon: isSpeaking?Icon(Icons.volume_up,color: Colors.white,):Icon(Icons.volume_mute,color: Colors.black,))).opacity(value: sequenceAnimation["text2"].value),

                      ],
                    )
                ).makeCentered();


            },
            animation: controller,

          )

        ],
      ).scrollVertical(),
    );
  }
}
