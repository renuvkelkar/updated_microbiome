import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sequence_animation/flutter_sequence_animation.dart';
import 'package:lottie/lottie.dart';
import 'package:velocity_x/velocity_x.dart';
class Page3 extends StatefulWidget {
  const Page3({Key key}) : super(key: key);

  @override
  _Page3State createState() => _Page3State();
}

class _Page3State extends State<Page3> with SingleTickerProviderStateMixin {
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
        to: const Duration(seconds: 1),
        tag: "opacity",
        curve: Curves.easeOut)
        .addAnimatable(
        animatable: new Tween<double>(begin: 0.0, end: 1.0),
        from: const Duration(seconds: 0),
        to: const Duration(seconds: 4),
        tag: "text1",
        curve: Curves.easeOut)
        .addAnimatable(
        animatable: new Tween<double>(begin: 0.0, end: 1.0),
        from: const Duration(seconds: 0),
        to: const Duration(seconds: 9),
        tag: "image1",
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
      backgroundColor: Colors.blue.shade800,
      body: Column(
        children: [
          AnimatedBuilder(
            builder: (context, child) {
              return VxBox(
                  child: Column(

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
                      Text("These germs are everywhere inside and on our bodies.")
                          .text
                          .size(context.isMobile ? 25 : 30)
                          .semiBold
                          .white
                          .makeCentered().p8()
                          // .pOnly(top: context.screenHeight * 0.09,left: context.screenWidth * 0.4)
                          .opacity(value: sequenceAnimation["text1"].value),
                      10.heightBox,
                      Image.asset(
                        "assets/images/inside1.png",
                        height: context.screenHeight * 0.3,
                        width: context.screenWidth,
                        fit: BoxFit.contain,
                      ).opacity(value: sequenceAnimation["image1"].value),
                      10.heightBox,
                      Image.asset(

                        "assets/images/outside.png",
                        height: context.screenHeight * 0.3,
                        width: context.screenWidth,
                        fit: BoxFit.contain,
                      ).opacity(value: sequenceAnimation["text1"].value),

                    ],
                  )).makeCentered();
            },
            animation: controller,
          )
        ],
      ).scrollVertical(),
    );
  }
}