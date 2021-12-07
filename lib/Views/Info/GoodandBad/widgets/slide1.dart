import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sequence_animation/flutter_sequence_animation.dart';
import 'package:lottie/lottie.dart';
import 'package:velocity_x/velocity_x.dart';
class Slide1 extends StatefulWidget {
  const Slide1({Key key}) : super(key: key);

  @override
  _Slide1State createState() => _Slide1State();
}

class _Slide1State extends State<Slide1>with SingleTickerProviderStateMixin {
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
        animatable: new Tween<double>(begin: 1.0, end: 0.0),
        from:  const Duration(seconds: 3),
        to: const Duration(seconds: 4),
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
        animatable: new Tween<dynamic>(begin: -300, end: 10),
        //  animatable: new Tween<double>(begin: 200.0, end: 40.0),
        from:  const Duration(seconds: 0),
        to: const Duration(seconds: 1),
        tag: "offsetL",
        curve: Curves.fastOutSlowIn
    )
        .addAnimatable(
        animatable: new Tween<dynamic>(begin: 500, end: 20),
        //  animatable: new Tween<double>(begin: 200.0, end: 40.0),
        from:  const Duration(seconds: 1),
        to: const Duration(seconds: 2),
        tag: "offsetR",
        curve: Curves.fastOutSlowIn
    )
        .addAnimatable(
        animatable: new Tween<double>(begin: 0.0, end: 1.0),
        from:  const Duration(seconds: 10),
        to: const Duration(seconds: 13),
        tag: "bacteria",
        curve: Curves.easeOut
    ).

    animate(controller);
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
      backgroundColor: Colors.orange,

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
            builder: (context, child){
              return
               context.isMobile? VxBox(
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            30.heightBox,
                            Wrap(
                             // mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0,0.7),
                                  child: Transform.translate(
                                    offset: Offset(sequenceAnimation["offsetL"].value.toDouble(),0 ),
                                    child: Column(
                                      children: [
                                        Container(
                                          height: context.isMobile?250:400,
                                          width: context.isMobile?170:300,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage('assets/images/goodbat.png'),
                                              )),
                                        ),
                                        Text("Good Microbiome ").text.size(context.isMobile?20:30).bold.white.make()
                                      ],
                                    )
                                  ),
                                ),
                                // Image.network("https://cdn-icons-png.flaticon.com/512/478/478793.png",height: 80,width: 80,fit: BoxFit.cover,),
                                Align(
                                  alignment: AlignmentDirectional(0,0.7),
                                  child: Transform.translate(
                                    offset: Offset(sequenceAnimation["offsetR"].value.toDouble(),0 ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        // Image.asset("assets/images/bad.png",height:context.isMobile?250:400,width:context.isMobile?170:300,fit: BoxFit.contain,).opacity(value: sequenceAnimation["opacity"].value),
                                        Container(
                                          height: context.isMobile?250:400,
                                          width: context.isMobile?170:300,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage('assets/images/bad.png'),
                                              )),
                                        ),
                                        Text("Bad Microbiome ").text.size(context.isMobile?20:30).bold.white.make()
                                            // .opacity(value: sequenceAnimation["opacity"].value)
                                      ],
                                    ),
                                  ),
                                ),
                                // Image.asset("assets/images/goodbat.png",height:context.screenHeight*0.4,width:context.screenWidth*0.4,fit: BoxFit.contain,).opacity(value: sequenceAnimation["opacity"].value),
                                // Image.asset("assets/images/bad.png",height:context.screenHeight*0.4,width:context.screenWidth*0.4,fit: BoxFit.contain,).opacity(value: sequenceAnimation["opacity"].value),
                              ],
                            ).p4(),
                            100.heightBox,

                          ],
                        ),



                      ],
                    )
                ).make():VxBox(
                   child: Stack(
                     children: [
                       Column(
                         children: [
                           30.heightBox,
                           Row(
                             mainAxisAlignment: MainAxisAlignment.spaceAround,
                             children: [
                               Align(
                                 alignment: AlignmentDirectional(0,0.7),
                                 child: Transform.translate(
                                     offset: Offset(sequenceAnimation["offsetL"].value.toDouble(),0 ),
                                     child: Column(
                                       children: [
                                         Container(
                                           height: context.isMobile?250:400,
                                           width: context.isMobile?170:300,
                                           decoration: BoxDecoration(
                                               image: DecorationImage(
                                                 image: AssetImage('assets/images/goodbat.png'),
                                               )),
                                         ),
                                         Text("Good Microbiome ").text.size(context.isMobile?20:30).bold.white.make()
                                       ],
                                     )
                                 ),
                               ),
                               // Image.network("https://cdn-icons-png.flaticon.com/512/478/478793.png",height: 80,width: 80,fit: BoxFit.cover,),
                               Align(
                                 alignment: AlignmentDirectional(0,0.7),
                                 child: Transform.translate(
                                   offset: Offset(sequenceAnimation["offsetR"].value.toDouble(),0 ),
                                   child: Column(
                                     mainAxisAlignment: MainAxisAlignment.center,
                                     children: [
                                       // Image.asset("assets/images/bad.png",height:context.isMobile?250:400,width:context.isMobile?170:300,fit: BoxFit.contain,).opacity(value: sequenceAnimation["opacity"].value),
                                       Container(
                                         height: context.isMobile?250:400,
                                         width: context.isMobile?170:300,
                                         decoration: BoxDecoration(
                                             image: DecorationImage(
                                               image: AssetImage('assets/images/bad.png'),
                                             )),
                                       ),
                                       Text("Bad Microbiome ").text.size(context.isMobile?20:30).bold.white.make()
                                       // .opacity(value: sequenceAnimation["opacity"].value)
                                     ],
                                   ),
                                 ),
                               ),
                               // Image.asset("assets/images/goodbat.png",height:context.screenHeight*0.4,width:context.screenWidth*0.4,fit: BoxFit.contain,).opacity(value: sequenceAnimation["opacity"].value),
                               // Image.asset("assets/images/bad.png",height:context.screenHeight*0.4,width:context.screenWidth*0.4,fit: BoxFit.contain,).opacity(value: sequenceAnimation["opacity"].value),
                             ],
                           ).p4(),
                           100.heightBox,

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
