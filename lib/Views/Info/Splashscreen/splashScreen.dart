import 'dart:async';

import 'package:aahaarkranti_app/Views/Main_Dashbord.dart/Main_Dashbord.dart';
import 'package:flutter/material.dart';
import "package:velocity_x/velocity_x.dart";






class Splashscreen extends StatefulWidget {
  @override
  _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen>with SingleTickerProviderStateMixin  {
   AnimationController _controller;

  //
  // @override
  // void dispose() {
  //   super.dispose();
  //   _controller.dispose();
  // }


  @override
  void initState(){
    super.initState();
    _controller =
    AnimationController(duration: Duration(seconds: 30), vsync: this)
      ..repeat();
    Timer(Duration(seconds: 7), (){
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => DashBord(),
      ));
    });
  }
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  Widget build(BuildContext context) {


    return MaterialApp(

      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.orange,
          body: ListView(
            children: <Widget>[
              Center(
                child: Column
                  (mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      height: context.screenHeight*0.2,
                      width: context.screenWidth,

                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(text: "Aahaar "),

                                TextSpan(text: "Chart"),
                              ],
                            ),
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.red.shade600,
                        borderRadius: BorderRadius.only(bottomRight: Radius.circular(100),bottomLeft: Radius.circular(100),topLeft:Radius.circular(0),topRight: Radius.circular(0), ),
                      ),
                    ),


                  ],
                ),
              ),
              SizedBox(height: 10,),


             context.isMobile? Container(
                alignment: Alignment.center,

                child: Stack(
                  children: [
                    RotationTransition(
                        alignment: Alignment.center,
                        turns: _controller,
                        child: Image.asset("assets/images/microb.png",height: context.screenHeight*0.70, fit: BoxFit.cover,)),
                    CircleAvatar(
                      radius: 100,
                      backgroundImage: AssetImage('assets/Images/logo.png'),
                      // child: Image.asset("assets/Images/logo.png")
                    ).pOnly(left: 150,top: 170)
                  ],
                ),

              ):
             Container(
               alignment: Alignment.center,

               child: Stack(
                 children: [
                   RotationTransition(
                       alignment: Alignment.center,
                       turns: _controller,
                       child: Image.asset("assets/Images/microb.png",height: context.screenHeight*0.75, fit: BoxFit.cover,)),
                   CircleAvatar(
                     radius: 120,
                     backgroundImage: AssetImage('assets/Images/logo.png'),
                     // child: Image.asset("assets/Images/logo.png")
                   ).pOnly(left: 150,top: 150)
                 ],
               ),

             )


            ],
          ),
        ),
      ),
    );
  }
}
