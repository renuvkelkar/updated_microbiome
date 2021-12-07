import 'package:aahaarkranti_app/Views/Main_Dashbord.dart/Drawer/MobileDrawer.dart';
import 'package:aahaarkranti_app/Views/Main_Dashbord.dart/Drawer/WebDrawer.dart';
import 'package:aahaarkranti_app/Views/Main_Dashbord.dart/Game/game.dart';

import 'package:aahaarkranti_app/Views/Main_Dashbord.dart/Microbium/about_microbium.dart';
import 'package:aahaarkranti_app/Views/Main_Dashbord.dart/Microbium/sub_dashboard.dart';
import 'package:aahaarkranti_app/Views/Main_Dashbord.dart/Quiz/quiz_play.dart';

import 'package:flutter/material.dart';

import 'package:velocity_x/velocity_x.dart';

class DashBord extends StatefulWidget {
  DashBord({Key key}) : super(key: key);

  @override
  _DashBordState createState() => _DashBordState();
}

class _DashBordState extends State<DashBord> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       elevation: 0.0,
       // flexibleSpace: Container(
       //   decoration: BoxDecoration(
       //              gradient: LinearGradient(colors: [
       //                Color(0xe60841ce),
       //                Color(0xe60841ce),
       //          ])),
       // ),
     ),
     drawer: Drawer(
      
        child: context.isMobile?MobileDrawer():WebDrawer()
      ),
        body: context.isMobile
            ? Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Color(0xe60841ce),
                  Color(0xe60841ce),
                      // Color(0xFFFF9100),
                      // Color(0xffff6d00),
                ])),
                child: Stack(
                  children: [
                  Container(
                    child: Image.asset(
                      "assets/images/girl.png",
                      height: context.screenHeight,
                      width: context.screenWidth,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        child: Stack(
                          children: [
                            Container(
                              height: context.screenHeight * 0.20,
                              width: context.screenWidth * 0.4,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.red,
                              ),
                              child: InkWell(
                                  onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) => Ab(),
                                        ),
                                      ),
                                  child: Center(
                                    child: "Learning"
                                        .text
                                        .fontFamily("Google Fonts")


                                        .white
                                        .size(30)
                                        .make(),
                                        
                                  )),
                            ).pOnly(left: 80, top: 50, bottom: 10),
                            Image.network(
                              "https://cdn-icons-png.flaticon.com/512/2436/2436636.png",
                              height: 110,
                              width: 110,
                            ).pOnly(left: 10, top: 70),
                          ],
                        ),
                      ),
                      Container(
                        child: Stack(
                          children: [
                            Container(
                              height: context.screenHeight * 0.20,
                              width: context.screenWidth * 0.4,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.green),
                              child: InkWell(
                                  onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) => GamePage(),
                                        ),
                                      ),
                                  child: Center(
                                    child:
                                        "Game".text .fontFamily("Google Fonts").white.size(30).make(),
                                  )),
                            ).pOnly(left: 80, top: 50, bottom: 10),
                            Image.network(
                              "https://image.freepik.com/free-vector/word-picture-matching-worksheet-children_1308-70627.jpg",
                              height: 110,
                              width: 110,
                            ).pOnly(left: 10, top: 70),
                          ],
                        ),
                      ),
                      Container(
                        child: Stack(
                          children: [
                            Container(
                              height: context.screenHeight * 0.20,
                              width: context.screenWidth * 0.4,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.orange),
                              child: InkWell(
                                  onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) => QuizPlay(),
                                        ),
                                      ),
                                  child: Center(
                                    child:
                                        "Quiz".text.fontFamily("Google Fonts").white.size(30).make(),
                                  )),
                            ).pOnly(left: 80, top: 50, bottom: 10),
                            Image.network(
                              "https://cdn-icons-png.flaticon.com/512/5678/5678190.png",
                              height: 110,
                              width: 110,
                            ).pOnly(left: 10, top: 70),
                          ],
                        ),
                      ),
                    ],
                  )
                ]),
              )
            : Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Color(0xe60841ce),
                      Color(0xe60841ce),
                ])),
                child: Stack(
                  children: [
                    Container(
                      child: Image.asset(
                        "assets/images/backround.png",
                      ).pOnly(top: 400).centered(),
                    ),
                    SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              child: Stack(
                                children: [
                                  Container(
                                    height: context.screenHeight * 0.20,
                                    width: context.screenWidth * 0.2,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color: Colors.red
                                        // gradient: LinearGradient(
                                        //     begin: Alignment.centerLeft,
                                        //     end: Alignment.bottomLeft,
                                        //     colors: [
                                        //       Color(0xFFCE83D8),
                                        //       Color(0xFFB39DDB)
                                        //     ])
                                        ),
                                    child: InkWell(
                                        onTap: () => Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (_) => Ab(),
                                              ),
                                            ),
                                        child: Center(
                                          child: "Learning"
                                              .text
                                              .fontFamily("Google Fonts")
                                              .white
                                              .size(30)
                                              .make(),
                                        )),
                                  ).pOnly(left: 80, top: 20, bottom: 10),
                                  Image.network(
                                    "https://cdn-icons-png.flaticon.com/512/2436/2436636.png",
                                    height: 110,
                                    width: 110,
                                  ).pOnly(left: 10, top: 30),
                                ],
                              ),
                            ).p(8),
                            Container(
                              child: Stack(
                                children: [
                                  Container(
                                    height: context.screenHeight * 0.20,
                                    width: context.screenWidth * 0.2,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color: Colors.green),
                                    child: InkWell(
                                        onTap: () => Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (_) => GamePage(),
                                              ),
                                            ),
                                        child: Center(
                                          child: "Game"
                                              .text
                                              .fontFamily("Google Fonts")

                                              .white
                                              .size(30)
                                              .make(),
                                        )),
                                  ).pOnly(left: 80, top: 20, bottom: 10),
                                  Image.network(
                                    "https://image.freepik.com/free-vector/word-picture-matching-worksheet-children_1308-70627.jpg",
                                    height: 110,
                                    width: 110,
                                  ).pOnly(left: 10, top: 30),
                                ],
                              ),
                            ).p(8),
                            Container(
                              child: Stack(
                                children: [
                                  Container(
                                    height: context.screenHeight * 0.20,
                                    width: context.screenWidth * 0.2,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: Colors.orange,
                                    ),
                                    child: InkWell(
                                        onTap: () => Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (_) => QuizPlay(),
                                              ),
                                            ),
                                        child: Center(
                                          child: "Quiz"
                                              .text
                                              .fontFamily("Google Fonts")

                                              .white
                                              .size(30)
                                              .make(),
                                        )),
                                  ).pOnly(
                                      left: 80, top: 20, bottom: 10, right: 80),
                                  Image.network(
                                    "https://cdn-icons-png.flaticon.com/512/5678/5678190.png",
                                    height: 110,
                                    width: 110,
                                  ).pOnly(left: 10, top: 30),
                                ],
                              ),
                            ).p(8),
                          ],
                        ).py(200).px(50).pOnly(left: 100)
                        // pOnly(left: 100,top: 200,right: 100),
                        ),
                  ],
                ),
              ));
  }
}
