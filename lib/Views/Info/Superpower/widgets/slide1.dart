import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sequence_animation/flutter_sequence_animation.dart';
import 'package:lottie/lottie.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:google_fonts/google_fonts.dart';
class SuperSlide1 extends StatefulWidget {
  const SuperSlide1({Key key}) : super(key: key);

  @override
  _SuperSlide1State createState() => _SuperSlide1State();
}

class _SuperSlide1State extends State<SuperSlide1>with SingleTickerProviderStateMixin {
  AnimationController controller;
  SequenceAnimation sequenceAnimation;

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
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,

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
                        Text("We need these germs that give us superpowers.").text.size(context.isMobile?25:30).semiBold.white.make().p8().opacity(value: sequenceAnimation["text1"].value),
                        Image.asset("assets/images/enemy.png",height:context.screenHeight*0.6,width:context.screenWidth,fit: BoxFit.contain,).opacity(value: sequenceAnimation["image1"].value),
                        10.heightBox,
                        Text("These germs can become our friends if we:").text.size(context.isMobile?25:30).semiBold.white.make().p8().opacity(value: sequenceAnimation["text2"].value),
                        60.heightBox,

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
