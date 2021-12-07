import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_sequence_animation/flutter_sequence_animation.dart';
import 'package:lottie/lottie.dart';
import 'package:velocity_x/velocity_x.dart';

class Page2 extends StatefulWidget {
  const Page2({Key key}) : super(key: key);

  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> with SingleTickerProviderStateMixin {
  AnimationController controller;
  SequenceAnimation sequenceAnimation;

  bool forward;

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
        to: const Duration(seconds: 10),
        tag: "opacity_germs1",
        curve: Curves.easeOut)
        .addAnimatable(
        animatable: new Tween<double>(begin: 0.0, end: 1.0),
        from: const Duration(seconds: 3),
        to: const Duration(seconds: 10),
        tag: "opacity_germs2",
        curve: Curves.easeOut)
        .addAnimatable(
        animatable: new Tween<double>(begin: 0.0, end: 1.0),
        from: const Duration(seconds: 4),
        to: const Duration(seconds: 10),
        tag: "opacity_germs3",
        curve: Curves.easeOut)
        .addAnimatable(
        animatable: new Tween<double>(begin: 0.0, end: 1.0),
        from: const Duration(seconds: 5),
        to: const Duration(seconds: 10),
        tag: "opacity_germs4",
        curve: Curves.easeOut)
        .addAnimatable(
        animatable: new Tween<double>(begin: 0.0, end: 1.0),
        from: const Duration(seconds: 6),
        to: const Duration(seconds: 10),
        tag: "opacity_germs5",
        curve: Curves.easeOut)
        .animate(controller);
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
      backgroundColor: Colors.green,
      body: AnimatedBuilder(
        builder: (context, child) {
          return Stack(
              children:[
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

                Align(
                  alignment: Alignment.bottomCenter,
                  child:  Text("All these germs in our body are called our Microbiome. ")
                      .text
                      .size(context.isMobile ? 20 : 25)
                      .semiBold
                      .black
                      .make()
                      .p8()
                      .opacity(value: sequenceAnimation["text1"].value),
                ),
                Center(
                  child: Container(
                      height: MediaQuery.of(context).size.height*0.9,
                      width: MediaQuery.of(context).size.height*0.9,
                      child: Center(
                        child: Stack(
                          children: [
                            Container(
                              child: Image.asset("assets/images/body.png",
                                  height: context.screenHeight * 0.6,
                                  fit: BoxFit.cover)
                                  .pOnly()
                                  .opacity(value: sequenceAnimation["opacity"].value),
                            ),
                            Image.asset(
                              "assets/images/germs1.png",
                              height: context.screenHeight * 0.07,
                              fit: BoxFit.cover,
                            ).pOnly( top: context.screenHeight*0.33,
                                right: 92).opacity(
                                value: sequenceAnimation["opacity_germs1"].value),
                            Positioned(
                              top: context.screenHeight*0.33,
                              left: context.screenHeight*0.3,
                              child: Image.asset(
                                "assets/images/germs2.png",
                                height: context.screenHeight * 0.07,
                                fit: BoxFit.cover,
                              ).pOnly().opacity(
                                  value: sequenceAnimation["opacity_germs2"].value),
                            ),
                            Positioned(
                              top: context.screenHeight*0.3,
                              left: context.screenHeight*0.12,
                              child: Image.asset(
                                "assets/images/germs3.png",
                                height: context.screenHeight * 0.09,
                                fit: BoxFit.cover,
                              ).pOnly( left: 20
                              ).opacity(
                                  value: sequenceAnimation["opacity_germs3"].value),
                            ),
                            Image.asset(
                              "assets/images/microb.png",
                              height: context.screenHeight * 0.2,
                              fit: BoxFit.cover,
                            ).pOnly( top: context.screenHeight*0.07,left: 60
                            ).opacity(
                                value: sequenceAnimation["opacity_germs5"].value),

                          ],
                        ),
                      )),
                ),
              ]
          );
        },
        animation: controller,
      ),
    );
  }
}