import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sequence_animation/flutter_sequence_animation.dart';
import 'package:lottie/lottie.dart';
import 'package:velocity_x/velocity_x.dart';
class DType1 extends StatefulWidget {
  const DType1({Key key}) : super(key: key);

  @override
  _DType1State createState() => _DType1State();
}

class _DType1State extends State<DType1>with SingleTickerProviderStateMixin {
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
        from:  const Duration(seconds: 1),
        to: const Duration(seconds: 4),
        tag: "fungi",
        curve: Curves.easeOut

    ).addAnimatable(
        animatable: new Tween<double>(begin: 0.0, end: 1.0),
        from:  const Duration(seconds: 4),
        to: const Duration(seconds: 7),
        tag: "Protozoa",
        curve: Curves.easeOut
    ).addAnimatable(
        animatable: new Tween<double>(begin: 0.0, end: 1.0),
        //  animatable: new Tween<double>(begin: 200.0, end: 40.0),
        from:  const Duration(seconds: 8),
        to: const Duration(seconds: 11),
        tag: "virus",
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
                    child: Stack(
                      children: [
                        Column(
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
                            Image.asset("assets/images/intenstine.png",height:context.screenHeight*0.6,width:context.screenWidth,fit: BoxFit.contain,).opacity(value: sequenceAnimation["opacity"].value),
                            Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  children: [
                                    VxBox(
                                      // backgroundColor: Colors.orange,
                                        child: Image.asset("assets/images/bat1.png",height:50,width:50,fit: BoxFit.fill,)).roundedFull.green400.height(context.isMobile?100:150).width(context.isMobile?100:150).p16.make().opacity( value: sequenceAnimation["fungi"].value),
                                    Text("Protozoa ").text.size(context.isMobile?15:20).semiBold.make().opacity(value: sequenceAnimation["fungi"].value)
                                  ],
                                ),
                                Column(
                                  children: [
                                    VxBox(
                                      // backgroundColor: Colors.orange,
                                        child: Image.asset("assets/images/bat5.png",height:50,width:50,fit: BoxFit.fill,)).roundedFull.orange400.height(context.isMobile?100:150).width(context.isMobile?100:150).p16.make().opacity( value: sequenceAnimation["Protozoa"].value),
                                    Text("Viruses ").text.size(context.isMobile?15:20).semiBold.make().opacity(value: sequenceAnimation["Protozoa"].value)
                                  ],
                                ),
                                Column(
                                  children: [
                                    VxBox(
                                      // backgroundColor: Colors.orange,
                                        child: Image.asset("assets/images/bat4.png",height:50,width:50,fit: BoxFit.fill,)).roundedFull.yellow400.height(context.isMobile?100:150).width(context.isMobile?100:150).p16.make().opacity( value: sequenceAnimation["virus"].value),
                                    Text("Bacteria").text.size(context.isMobile?15:20).semiBold.make().p4().opacity(value: sequenceAnimation["virus"].value)
                                  ],
                                ),
                                Column(
                                  children: [
                                    VxBox(
                                      // backgroundColor: Colors.orange,
                                        child: Image.asset("assets/images/bat2.png",height:50,width:50,fit: BoxFit.fill,)).roundedFull.red400.height(context.isMobile?100:150).width(context.isMobile?100:150).p20.make().opacity( value: sequenceAnimation["bacteria"].value),
                                    Text("Fungi").text.size(context.isMobile?15:20).semiBold.make().opacity(value: sequenceAnimation["bacteria"].value)
                                  ],
                                ),

                              ],
                            ),

                          ],
                        ),



                      ],
                    )
                ).make();

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
