import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sequence_animation/flutter_sequence_animation.dart';
import 'package:lottie/lottie.dart';
import 'package:velocity_x/velocity_x.dart';

class Page4 extends StatefulWidget {
  const Page4({Key key}) : super(key: key);

  @override
  _Page4State createState() => _Page4State();
}

class _Page4State extends State<Page4> with SingleTickerProviderStateMixin {
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
        from: const Duration(seconds: 0),
        to: const Duration(seconds: 1),
        tag: "opacity",
        curve: Curves.easeOut)
        .addAnimatable(
        animatable: new Tween<double>(begin: 0.0, end: 1.0),
        from: const Duration(seconds: 0),
        to: const Duration(seconds: 2),
        tag: "text1",
        curve: Curves.easeOut)
        .addAnimatable(
        animatable: new Tween<double>(begin: 0.0, end: 1.0),
        from: const Duration(seconds: 2),
        to: const Duration(seconds: 5),
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
      backgroundColor: Colors.teal,
      body: Column(
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
          AnimatedBuilder(
            builder: (context, child) {
              return VxBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/intenstine.png",
                        height: context.screenHeight * 0.6,
                        width: context.screenWidth,
                        fit: BoxFit.contain,
                      ).pOnly().opacity(value: sequenceAnimation["image1"].value),
                   10.heightBox,
                      Text("Germs in our gut are like an important organ in our body.")
                          .text
                          .size(context.isMobile ? 25 : 30)
                          .semiBold
                          .white
                          .makeCentered()
                          .p8()
                          .opacity(value: sequenceAnimation["text1"].value),
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
