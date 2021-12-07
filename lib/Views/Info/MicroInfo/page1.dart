import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_sequence_animation/flutter_sequence_animation.dart';
import 'package:velocity_x/velocity_x.dart';
class Page1 extends StatefulWidget {
  const Page1({Key key}) : super(key: key);

  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1>with SingleTickerProviderStateMixin {
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
        animatable: new ColorTween(begin: Colors.red, end: Colors.yellow),
        from:  const Duration(seconds: 0),
        to: const Duration(seconds: 2),
        tag: "color"
    ).addAnimatable(
        animatable: new Tween<double>(begin: 0.0, end: 1.0),
        from:  const Duration(seconds: 0),
        to: const Duration(seconds: 1),
        tag: "opacity",
        curve: Curves.easeOut

    ).addAnimatable(
        animatable: new Tween<double>(begin: 0.0, end: 1.0),
        from:  const Duration(seconds: 1),
        to: const Duration(seconds: 13),
        tag: "opacity_germs1",
        curve: Curves.easeOut

    ).addAnimatable(
        animatable: new Tween<double>(begin: 0.0, end: 1.0),
        from:  const Duration(seconds: 2),
        to: const Duration(seconds: 7),
        tag: "opacity1",
        curve: Curves.easeOut
    ).addAnimatable(
        animatable: new Tween<double>(begin: 0.0, end: 1.0),
        //  animatable: new Tween<double>(begin: 200.0, end: 40.0),
        from:  const Duration(seconds: 8),
        to: const Duration(seconds: 9),
        tag: "opacity2",
        curve: Curves.fastOutSlowIn
    ).addAnimatable(
        animatable: new Tween<double>(begin: 0.0, end: 40),
        //  animatable: new Tween<double>(begin: 200.0, end: 40.0),
        from:  const Duration(seconds: 7),
        to: const Duration(seconds: 10),
        tag: "size1",
        curve: Curves.fastOutSlowIn
    ).addAnimatable(
        animatable: new Tween<double>(begin: 0.0, end: 1.0),
        from:  const Duration(seconds: 10),
        to: const Duration(seconds: 11),
        tag: "opacity3",
        curve: Curves.easeOut
    ).addAnimatable(
        animatable: new Tween<double>(begin: 0.0, end: 1.0),
        from:  const Duration(seconds: 12),
        to: const Duration(seconds: 13),
        tag: "opacity4",
        curve: Curves.easeOut
    )
        .addAnimatable(
        animatable: new Tween<double>(begin: 0, end: 500),
        //  animatable: new Tween<double>(begin: 200.0, end: 40.0),
        from:  const Duration(seconds: 4),
        to: const Duration(seconds: 8),
        tag: "scale",
        curve: Curves.fastOutSlowIn
    ).animate(controller);
    controller.forward();


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Page1"),
      // ),
      body: Column(
        children: [
          AnimatedBuilder(
            builder: (context, child){
              return
                  VxBox(
                    child: Stack(
                      children: [
                        Image.asset("assets/images/body.png",height:context.screenHeight*0.7,width:context.screenWidth,fit: BoxFit.contain,).opacity(value: sequenceAnimation["opacity"].value),

                      ],
                    )
                  ).makeCentered();

                // Stack(
                //   children: [
                //     VxBox(child: Column(
                //       children: [
                //         Image.asset("assets/images/body.png",height:context.screenHeight*0.8,fit: BoxFit.cover,).opacity(value: sequenceAnimation["opacity"].value),
                //
                //       ],
                //     )).color(Color(0xFF71D7FF)).height(context.screenHeight).width(context.screenWidth).makeCentered(),
                //     Image.asset("assets/images/germs1.png",height:context.screenHeight*0.1,fit: BoxFit.cover,).opacity(value: sequenceAnimation["opacity_germs1"].value),
                //     Image.network("https://image.freepik.com/free-vector/mom-little-son-studying-letters-woman-kid-playing-toy-blocks-flat-vector-illustration-preschool-education-learning-concept_74855-10114.jpg",width: sequenceAnimation["scale"].value,).pOnly(top:350,left: 20).opacity(value: sequenceAnimation["opacity1"].value),
                //     "Flutter Engage".text.white.bold.size(sequenceAnimation["size1"].value).makeCentered().opacity(value: sequenceAnimation["opacity2"].value),
                //     "03.03.21".text.xl2.semiBold.makeCentered().opacity(value: sequenceAnimation["opacity3"].value).pOnly(top: 70),
                //     "9:30am - 1:00pm PST".text.gray700.makeCentered().opacity(value: sequenceAnimation["opacity3"].value).pOnly(top: 110),
                //     VxBox(child: "Sign up for Updates".text.semiBold.white.makeCentered()).height(30).width(200).roundedSM.color(Colors.blue).makeCentered().opacity(value: sequenceAnimation["opacity4"].value).pOnly(top: 110).pOnly(top: 400)
                //
                //   ],
                // );

            },
            animation: controller,

          )

        ],
      ).scrollVertical(),
    );
  }
}
