// import 'dart:html';

// import 'package:flutter/material.dart';
// import 'package:velocity_x/velocity_x.dart';

// class Microbium extends StatefulWidget {
//   Microbium({Key key}) : super(key: key);

//   @override
//   _MicrobiumState createState() => _MicrobiumState();
// }

// class _MicrobiumState extends State<Microbium> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.yellowAccent.shade400,
//       body: context.isMobile
//           ? SingleChildScrollView(
//               child: Column(
//                 children: [
//                   Container(
//                     height: 200,
//                     width: context.screenWidth,
//                     color: Colors.blueAccent,
//                   ),
//                   Row(
//                     children: [
//                       Container(
//                         child: Stack(
//                           children: [
//                             VxBox(
                             
//                               child: InkWell(
//                                   child: Column(
//                                 children: [
//                                   Image.asset(
//                                     "assets/micro1.png",
//                                     width: 100,
//                                     height: 100,
//                                   ),
//                                   "What is Microbium".text.bold.size(20).make(),
//                                 ],
//                               )),
//                             )
//                                 .roundedSM
//                                 .white
//                                 .shadowLg
//                                 .height(context.screenHeight * 0.25)
//                                 .width(context.screenWidth * 0.3)
//                                 .make()
//                                 .pOnly(left: 70, top: 40, bottom: 10),
//                           ],
//                         ),
//                       ),
//                       Container(
//                         child: Stack(
//                           children: [
//                             Container(
//                               height: context.screenHeight * 0.25,
//                               width: context.screenWidth * 0.3,
//                               decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(10),
//                                   color: Colors.white),
//                               child: InkWell(
//                                   child: Column(
//                                 children: [
//                                   Image.asset(
//                                     "assets/micro2.png",
//                                     width: 100,
//                                     height: 100,
//                                   ),
//                                   "Learning".text.bold.size(20).make(),
//                                 ],
//                               )),
//                             ).pOnly(left: 70, top: 40, bottom: 10),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                   Row(
//                     children: [
//                       Container(
//                         child: Stack(
//                           children: [
//                             Container(
//                               height: context.screenHeight * 0.25,
//                               width: context.screenWidth * 0.3,
//                               decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(10),
//                                   color: Colors.white),
//                               child: InkWell(
//                                   child: Column(
//                                 children: [
//                                   Image.asset(
//                                     "assets/micro3.png",
//                                     width: 100,
//                                     height: 100,
//                                   ),
//                                   "Learning".text.bold.size(20).make(),
//                                 ],
//                               )),
//                             ).pOnly(left: 70, top: 40, bottom: 10),
//                           ],
//                         ),
//                       ),
//                       Container(
//                         child: Stack(
//                           children: [
//                             Container(
//                               height: context.screenHeight * 0.25,
//                               width: context.screenWidth * 0.3,
//                               decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(10),
//                                   color: Colors.white),
//                               child: InkWell(
//                                   child: Column(
//                                 children: [
//                                   Image.asset(
//                                     "assets/micro4.png",
//                                     width: 100,
//                                     height: 100,
//                                   ),
//                                   "Learning".text.bold.size(20).make(),
//                                 ],
//                               )),
//                             ).pOnly(left: 70, top: 40, bottom: 10),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                      Row(
//                     children: [
//                       Container(
//                         child: Stack(
//                           children: [
//                             VxBox(
                              
//                               child: InkWell(
//                                   child: Column(
//                                 children: [
//                                   Image.asset(
//                                     "assets/micro1.png",
//                                     width: 100,
//                                     height: 100,
//                                   ),
//                                   "What is Microbium".text.bold.size(20).make(),
//                                 ],
//                               )),
//                             )
//                                 .roundedSM
//                                 .white
//                                 .shadowLg
//                                 .height(context.screenHeight * 0.25)
//                                 .width(context.screenWidth * 0.3)
//                                 .make()
//                                 .pOnly(left: 70, top: 40, bottom: 10),
//                           ],
//                         ),
//                       ),
//                       Container(
//                         child: Stack(
//                           children: [
//                             Container(
//                               height: context.screenHeight * 0.25,
//                               width: context.screenWidth * 0.3,
//                               decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(10),
//                                   color: Colors.white),
//                               child: InkWell(
//                                   child: Column(
//                                 children: [
//                                   Image.asset(
//                                     "assets/micro2.png",
//                                     width: 100,
//                                     height: 100,
//                                   ),
//                                   "Learning".text.bold.size(20).make(),
//                                 ],
//                               )),
//                             ).pOnly(left: 70, top: 40, bottom: 10),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             )
//           : SingleChildScrollView(
            
//             child: Column(
//                 children: [
//                   Container(
//                     height: context.screenHeight * 0.4,
//                     width: context.screenWidth * 0.5,
//                     color: Colors.blueAccent,
//                   ).centered(),
//                   Container(
//                     height: 400,
//                     width: 800,
//                     child: ListView(
//                       // mainAxisAlignment: MainAxisAlignment.center,
//                       // crossAxisAlignment: CrossAxisAlignment.center,
//                       scrollDirection: Axis.horizontal,
                      
//                       children: [
//                         InkWell(
//                           onTap: () {
                           
//                           },
//                           child: Container(
//                             child: Stack(
//                               children: [
//                                 VxBox(
//                                   child: InkWell(
//                                       child: Column(
//                                     children: [
//                                       Image.asset(
//                                         "assets/micro1.png",
//                                         width: 100,
//                                         height: 100,
//                                       ),
//                                       "Learning".text.bold.size(20).make(),
//                                     ],
//                                   )),
//                                 )
//                                     .roundedSM
//                                     .white
//                                     .shadowLg
//                                     .height(context.screenHeight * 0.25)
//                                     .width(context.screenWidth * 0.16)
//                                     .make()
//                                     .pOnly(left: 70, top: 40, bottom: 10),
//                               ],
//                             ),
//                           ),
//                           // child: Container(
//                           //   height: context.screenHeight * 0.2,
//                           //   width: context.screenWidth * 0.2,
//                           //   decoration: BoxDecoration(
//                           //       color: Colors.red,
//                           //       borderRadius: BorderRadius.circular(50)),
//                           //   child: Text("Info Cards").text.xl2.bold.white.makeCentered(),
//                           // ).p8(),
//                         ),
//                         15.heightBox,
//                         InkWell(
//                           onTap: () {
//                             // Navigator.push(
//                             //     context, MaterialPageRoute(builder: (_) => GamePage()));
//                           },
//                           child: Container(
//                             child: Stack(
//                               children: [
//                                 VxBox(
//                                   child: InkWell(
//                                       child: Column(
//                                     children: [
//                                       Image.asset(
//                                         "assets/micro2.png",
//                                         width: 100,
//                                         height: 100,
//                                       ),
//                                       "Learning".text.bold.size(20).make(),
//                                     ],
//                                   )),
//                                 )
//                                     .roundedSM
//                                     .white
//                                     .shadowLg
//                                     .height(context.screenHeight * 0.25)
//                                     .width(context.screenWidth * 0.16)
//                                     .make()
//                                     .pOnly(left: 70, top: 40, bottom: 10),
//                               ],
//                             ),
//                           ),
//                         ),
//                         15.heightBox,
//                         InkWell(
//                           onTap: () {
//                             // Navigator.push(
//                             //     context, MaterialPageRoute(builder: (_) => QuizPlay()));
//                           },
//                           child: Container(
//                             child: Stack(
//                               children: [
//                                 VxBox(
//                                   child: InkWell(
//                                       child: Column(
//                                     children: [
//                                       Image.asset(
//                                         "assets/micro3.png",
//                                         width: 100,
//                                         height: 100,
//                                       ),
//                                       "Learning".text.bold.size(20).make(),
//                                     ],
//                                   )),
//                                 )
//                                     .roundedSM
//                                     .white
//                                     .shadowLg
//                                     .height(context.screenHeight * 0.25)
//                                     .width(context.screenWidth * 0.16)
//                                     .make()
//                                     .pOnly(left: 70, top: 40, bottom: 10),
//                               ],
//                             ),
//                           ),
//                         ),
//                         InkWell(
//                           onTap: () {
//                             // Navigator.push(
//                             //     context, MaterialPageRoute(builder: (_) => GamePage()));
//                           },
//                           child: Container(
//                             child: Stack(
//                               children: [
//                                 VxBox(
//                                   child: InkWell(
//                                       child: Column(
//                                     children: [
//                                       Image.asset(
//                                         "assets/micro4.png",
//                                         width: 100,
//                                         height: 100,
//                                       ),
//                                       "Learning".text.bold.size(20).make(),
//                                     ],
//                                   )),
//                                 )
//                                     .roundedSM
//                                     .white
//                                     .shadowLg
//                                     .height(context.screenHeight * 0.25)
//                                     .width(context.screenWidth * 0.16)
//                                     .make()
//                                     .pOnly(left: 70, top: 40, bottom: 10),
//                               ],
//                             ),
//                           ),
                          
//                         ),
//                         InkWell(
//                           onTap: () {
//                             // Navigator.push(
//                             //     context, MaterialPageRoute(builder: (_) => GamePage()));
//                           },
//                           child: Container(
//                             child: Stack(
//                               children: [
//                                 VxBox(
//                                   child: InkWell(
//                                       child: Column(
//                                     children: [
//                                       Image.asset(
//                                         "assets/micro4.png",
//                                         width: 100,
//                                         height: 100,
//                                       ),
//                                       "Learning".text.bold.size(20).make(),
//                                     ],
//                                   )),
//                                 )
//                                     .roundedSM
//                                     .white
//                                     .shadowLg
//                                     .height(context.screenHeight * 0.25)
//                                     .width(context.screenWidth * 0.16)
//                                     .make()
//                                     .pOnly(left: 70, top: 40, bottom: 10),
//                               ],
//                             ),
//                           ),
                          
//                         ),
//                         InkWell(
//                           onTap: () {
//                             // Navigator.push(
//                             //     context, MaterialPageRoute(builder: (_) => GamePage()));
//                           },
//                           child: Container(
//                             child: Stack(
//                               children: [
//                                 VxBox(
//                                   child: InkWell(
//                                       child: Column(
//                                     children: [
//                                       Image.asset(
//                                         "assets/micro4.png",
//                                         width: 100,
//                                         height: 100,
//                                       ),
//                                       "Learning".text.bold.size(20).make(),
//                                     ],
//                                   )),
//                                 )
//                                     .roundedSM
//                                     .white
//                                     .shadowLg
//                                     .height(context.screenHeight * 0.25)
//                                     .width(context.screenWidth * 0.16)
//                                     .make()
//                                     .pOnly(left: 70, top: 40, bottom: 10),
//                               ],
//                             ),
//                           ),
                          
//                         ),
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//           ),
//     );
//   }
// }
