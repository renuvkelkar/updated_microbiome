import 'dart:async';

import 'package:aahaarkranti_app/Views/Main_Dashbord.dart/Main_Dashbord.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sequence_animation/flutter_sequence_animation.dart';
import 'package:velocity_x/velocity_x.dart';
class Type1 extends StatefulWidget {
  const Type1({Key key}) : super(key: key);

  @override
  _Type1State createState() => _Type1State();
}

class _Type1State extends State<Type1>with SingleTickerProviderStateMixin {
  AnimationController controller;
  SequenceAnimation sequenceAnimation;

  bool forward;

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 15), (){
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => DashBord(),
      ));
    });
    controller = new AnimationController(vsync: this);

    sequenceAnimation = new SequenceAnimationBuilder()
        .addAnimatable(
        animatable: new Tween<dynamic>(begin: 1.0, end: 0.0),
        from:  const Duration(seconds: 0),
        to: const Duration(seconds: 7),
        tag: "gist",
        curve: Curves.easeOut

    )
        .addAnimatable(
        animatable: new Tween<dynamic>(begin: 1.0, end: 0.0),
        from:  const Duration(seconds: 0),
        to: const Duration(seconds: 7),
        tag: "opacity",
        curve: Curves.easeOut

    ).addAnimatable(
        animatable: new Tween<dynamic>(begin: 1.0, end: 0.0),
        from:  const Duration(seconds: 0),
        to: const Duration(seconds: 7),
        tag: "fungi",
        curve: Curves.easeOut

    ).addAnimatable(
        animatable: new Tween<dynamic>(begin: 0.0, end: 1.0),
        from:  const Duration(seconds: 5),
        to: const Duration(seconds: 7),
        tag: "text1",
        curve: Curves.easeOut
    ).addAnimatable(
        animatable: new Tween<dynamic>(begin: 0.0, end: 1.0),
        //  animatable: new Tween<double>(begin: 200.0, end: 40.0),
        from:  const Duration(seconds: 6),
        to: const Duration(seconds: 8),
        tag: "virus",
        curve: Curves.fastOutSlowIn
    ).addAnimatable(
        animatable: new Tween<dynamic>(begin: -600, end: 10),
        //  animatable: new Tween<double>(begin: 200.0, end: 40.0),
        from:  const Duration(seconds: 4),
        to: const Duration(seconds: 6),
        tag: "offsetL",
        curve: Curves.fastOutSlowIn
    )
        .addAnimatable(
        animatable: new Tween<dynamic>(begin: 600, end: 20),
        //  animatable: new Tween<double>(begin: 200.0, end: 40.0),
        from:  const Duration(seconds: 4),
        to: const Duration(seconds: 6),
        tag: "offsetR",
        curve: Curves.fastOutSlowIn
    )
        .addAnimatable(
        animatable: new Tween<dynamic>(begin: -750, end: 10),
        //  animatable: new Tween<double>(begin: 200.0, end: 40.0),
        from:  const Duration(seconds: 6),
        to: const Duration(seconds: 8),
        tag: "offsetL1",
        curve: Curves.fastOutSlowIn
    )
        .addAnimatable(
        animatable: new Tween<dynamic>(begin: 750, end: 20),
        //  animatable: new Tween<double>(begin: 200.0, end: 40.0),
        from:  const Duration(seconds: 6),
        to: const Duration(seconds: 8),
        tag: "offsetR1",
        curve: Curves.fastOutSlowIn
    )

        .addAnimatable(
        animatable: new Tween<dynamic>(begin: -600, end: 10),
        //  animatable: new Tween<double>(begin: 200.0, end: 40.0),
        from:  const Duration(seconds: 8),
        to: const Duration(seconds: 10),
        tag: "offsetL2",
        curve: Curves.fastOutSlowIn
    )
        .addAnimatable(
        animatable: new Tween<dynamic>(begin: 600, end: 20),
        //  animatable: new Tween<double>(begin: 200.0, end: 40.0),
        from:  const Duration(seconds: 8),
        to: const Duration(seconds: 10),
        tag: "offsetR2",
        curve: Curves.fastOutSlowIn
    ).addAnimatable(
        animatable: new Tween<dynamic>(begin: 0.0, end: 1.0),
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
       backgroundColor: Color(0xe60841ce),

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

                            Image.asset("assets/images/gist-logo-1.png",height:context.screenHeight*0.15,width:context.screenWidth*0.3,fit: BoxFit.contain,).opacity(value: sequenceAnimation["gist"].value),

                            SizedBox(height: context.isMobile?5:30,),
                            Text("Microbiome Our Superhero").text.size(context.isMobile?30:50).white.fontFamily("Google").bold.makeCentered().opacity(value: sequenceAnimation["fungi"].value),
                            Image.asset("assets/images/ninja.png",height:context.isMobile?context.screenHeight*0.5:context.screenHeight*0.4,width:context.isMobile?context.screenWidth*0.7:context.screenWidth*0.65,fit: BoxFit.contain,).opacity(value: sequenceAnimation["opacity"].value),
                           SizedBox(height: context.isMobile?5:30,),
                            Container(

                              child: Column(
                                children: [
                                  Text("Developed by").opacity(value: sequenceAnimation["opacity"].value),
                                  Image.asset("assets/images/logo_new.png",height: 60,width: 100,fit: BoxFit.contain,).opacity(value: sequenceAnimation["opacity"].value),
                                ],
                              ),
                            )






                            // Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //   children: [
                            //     Icon(Icons.arrow_back_ios_rounded,size: 50,color: Colors.white.withOpacity(0.3),),
                            //     Icon(Icons.arrow_forward_ios_rounded,size: 50,color: Colors.white.withOpacity(0.3),),
                            //
                            //   ],).p4(),
                          ],
                        ),
                        Column(
                          children: [
                            SizedBox(height: context.isMobile?40:20,),
                            Text("Learn more about").text.size(context.isMobile?25:40).white.fontFamily("Google").bold.makeCentered().opacity(value: sequenceAnimation["text1"].value),
                            Text("Microbiomes the FUN WAY").text.size(context.isMobile?25:40).white.fontFamily("Google").bold.makeCentered().opacity(value: sequenceAnimation["text1"].value),
                            SizedBox(height: context.isMobile?60:20,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0,0.7),
                                  child: Transform.translate(
                                      offset: Offset(sequenceAnimation["offsetL"].value.toDouble(),0 ),
                                      child: Column(
                                        children: [
                                          Column(
                                            children: [
                                              VxBox(
                                                child: Image.asset('assets/images/micro2.png'),
                                              ).red500.height(context.isMobile?100:120,).width(context.isMobile?100:120,).roundedFull.p8.shadowLg.makeCentered(),
                                              5.heightBox,
                                              Text("What is Microbiome?").text.xl.white.semiBold.make()
                                            ],
                                          ),
                                         // Text("Good Microbiome ").text.size(context.isMobile?20:30).bold.white.make()
                                        ],
                                      )
                                  ),
                                ),

                                // Image.network("https://cdn-icons-png.flaticon.com/512/478/478793.png",height: 80,width: 80,fit: BoxFit.cover,),
                                Align(
                                  alignment: AlignmentDirectional(0,0.7),
                                  child: Transform.translate(
                                    offset: Offset(sequenceAnimation["offsetR"].value.toDouble(),0 ),
                                    child:  Column(
                                      children: [
                                        VxBox(
                                          child: Image.asset('assets/images/micro1.png'),
                                        ).orange400.height(context.isMobile?100:120,).width(context.isMobile?100:120,).roundedFull.p8.shadowLg.makeCentered(),
                                        Text("Good V/S Bad ").text.xl.white.semiBold.make().p4()
                                      ],
                                    ),
                                  ),
                                ),
                                // Image.asset("assets/images/goodbat.png",height:context.screenHeight*0.4,width:context.screenWidth*0.4,fit: BoxFit.contain,).opacity(value: sequenceAnimation["opacity"].value),
                                // Image.asset("assets/images/bad.png",height:context.screenHeight*0.4,width:context.screenWidth*0.4,fit: BoxFit.contain,).opacity(value: sequenceAnimation["opacity"].value),
                              ],
                            ).p4(),
                            20.heightBox,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0,0.7),
                                  child: Transform.translate(
                                      offset: Offset(sequenceAnimation["offsetL1"].value.toDouble(),0 ),
                                      child:  Column(
                                        children: [
                                          VxBox(
                                            child: Image.asset('assets/images/micro3.png'),
                                          ).red500.height(context.isMobile?100:120,).width(context.isMobile?100:120,).roundedFull.p8.shadowLg.makeCentered(),
                                          5.heightBox,
                                          Text("Types of Microbiome").text.white.xl.semiBold.make()
                                        ],
                                      ),
                                  ),
                                ),

                                // Image.network("https://cdn-icons-png.flaticon.com/512/478/478793.png",height: 80,width: 80,fit: BoxFit.cover,),
                                Align(
                                  alignment: AlignmentDirectional(0,0.7),
                                  child: Transform.translate(
                                    offset: Offset(sequenceAnimation["offsetR1"].value.toDouble(),0 ),
                                    child:  Column(
                                      children: [
                                        VxBox(
                                          child: Image.asset('assets/images/super.png'),
                                        ).orange400.height(context.isMobile?100:120,).width(context.isMobile?100:120,).roundedFull.p8.shadowLg.makeCentered(),
                                        5.heightBox,
                                        Text("Gaining Superpower").text.xl.white.semiBold.maxLines(2).ellipsis.make().box.width(100).make()
                                      ],
                                    ),
                                  ),
                                ),
                                // Image.asset("assets/images/goodbat.png",height:context.screenHeight*0.4,width:context.screenWidth*0.4,fit: BoxFit.contain,).opacity(value: sequenceAnimation["opacity"].value),
                                // Image.asset("assets/images/bad.png",height:context.screenHeight*0.4,width:context.screenWidth*0.4,fit: BoxFit.contain,).opacity(value: sequenceAnimation["opacity"].value),
                              ],
                            ).p4(),
                            20.heightBox,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0,0.7),
                                  child: Transform.translate(
                                      offset: Offset(sequenceAnimation["offsetL2"].value.toDouble(),0 ),
                                      child:  Column(
                                        children: [
                                          VxBox(
                                            child: Image.asset('assets/images/avoiding.png'),
                                          ).red500.height(context.isMobile?100:120,).width(context.isMobile?100:120,).roundedFull.p8.shadowLg.makeCentered(),
                                          5.heightBox,
                                          Text("Avoiding Enemies").text.white.xl.semiBold.make()
                                        ],
                                      ),
                                  ),
                                ),

                                // Image.network("https://cdn-icons-png.flaticon.com/512/478/478793.png",height: 80,width: 80,fit: BoxFit.cover,),
                                Align(
                                  alignment: AlignmentDirectional(0,0.7),
                                  child: Transform.translate(
                                    offset: Offset(sequenceAnimation["offsetR2"].value.toDouble(),0 ),
                                    child:  Column(
                                      children: [
                                        VxBox(
                                          child: Image.asset('assets/images/diseses.png'),
                                        ).orange400.height(context.isMobile?100:120,).width(context.isMobile?100:120,).roundedFull.p8.shadowLg.makeCentered(),
                                        5.heightBox,
                                        Text("Diseases ").text.white.xl.white.semiBold.make()
                                      ],
                                    ),
                                  ),
                                ),
                                // Image.asset("assets/images/goodbat.png",height:context.screenHeight*0.4,width:context.screenWidth*0.4,fit: BoxFit.contain,).opacity(value: sequenceAnimation["opacity"].value),
                                // Image.asset("assets/images/bad.png",height:context.screenHeight*0.4,width:context.screenWidth*0.4,fit: BoxFit.contain,).opacity(value: sequenceAnimation["opacity"].value),
                              ],
                            ).p4(),

                          ],
                        ),





                      ],
                    )
                ).make();



            },
            animation: controller,

          )

        ],
      ).scrollVertical(),
    );
  }
}
