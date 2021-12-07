import 'package:aahaarkranti_app/Views/Info/Diseases/DisesesMicro.dart';
import 'package:aahaarkranti_app/Views/Info/Enemies/enemymicro.dart';
import 'package:aahaarkranti_app/Views/Info/GoodandBad/goodvsbadmicro.dart';
import 'package:aahaarkranti_app/Views/Info/MicroInfo/microInfo.dart';
import 'package:aahaarkranti_app/Views/Info/Microbiome/Microbiome.dart';
import 'package:aahaarkranti_app/Views/Info/Superpower/superpoermicro.dart';
import 'package:aahaarkranti_app/Views/Info/Types/typesofMicro.dart';
import 'package:aahaarkranti_app/Views/Resources/ResourcesPage.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../VideoPage.dart';
import '../Main_Dashbord.dart';

class Ab extends StatefulWidget {
  const Ab({Key key}) : super(key: key);

  @override
  _AbState createState() => _AbState();
}

class _AbState extends State<Ab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Learning"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => DashBord()));
          }, icon: Icon(Icons.home))
        ],
      ),
      body: Container(
        height: context.screenHeight,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Color(0xe60841ce),
              Color(0xe60841ce),
        ])),
        child: Column(
          children: [
           Container(
             height: context.isMobile
                 ? context.screenHeight * 0.4
                 : context.screenHeight * 0.6,
             width: context.isMobile
                 ? context.screenWidth
                 : context.screenWidth * 0.5,
             // color: Colors.green,
             child: AssetVideoWidget(),
           ),
            context.isMobile?
            Container(
              // height: context.isMobile
              //     ? context.screenHeight
              //     : context.screenHeight * 0.3,
              child: GridView(
                shrinkWrap: true,
                physics: context.isMobile?NeverScrollableScrollPhysics():null,


                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: context.isMobile ? 2 : 1),
                children: [
                  InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => Microbiome(),
                      ),
                    ),
                    child: VxBox(
                        child: Column(children: [
                      Image.asset(
                        "assets/images/micro2.png",
                        width: 100,
                        height: 100,
                      ),
                      "What is Microbiome?".text.fontFamily('Google Font').semiBold.size(15).center.make(),
                    ])).shadowLg.white.roundedSM.make().p16(),
                  ),
                  InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => GoodBadMicro(),
                      ),
                    ),
                    child: VxBox(
                        child: Column(children: [
                      Image.asset(
                        "assets/images/micro1.png",
                        width: 100,
                        height: 100,
                      ),
                      "Good V/S Bad ".text.center.semiBold.size(15).make(),
                    ])).shadowLg.white.roundedSM.make().p16(),
                  ),
                  InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => TypesOfMicro(),
                      ),
                    ),
                    child: VxBox(
                        child: Column(children: [
                      Image.asset(
                        "assets/images/micro3.png",
                        width: 100,
                        height: 100,
                      ),
                      "Types of Germs".text.center.semiBold.size(15).make(),
                    ])).shadowLg.white.roundedSM.make().p16(),
                  ),
                  InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => SuperPowerMicro(),
                      ),
                    ),

                    child: VxBox(
                        child: Column(children: [
                      Image.asset(
                        "assets/images/super.png",
                        width: 100,
                        height: 100,
                      ),
                      " Gaining Superpower".text.center.semiBold.size(15).make(),
                    ])).shadowLg.white.roundedSM.make().p16(),
                  ),
                  InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => EnemyMicro(),
                      ),
                    ),
                    child: VxBox(
                        child: Column(children: [
                      Image.asset(
                        "assets/images/avoiding.png",
                        width: 100,
                        height: 100,
                      ),
                      "Avoiding Enemies".text.center.semiBold.size(15).make(),
                    ])).shadowLg.white.roundedSM.make().p16(),
                  ),

                  InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => Diseses(),
                      ),
                    ),

                    child: VxBox(
                        child: Column(children: [
                      Image.asset(
                        "assets/images/diseses.png",
                        width: 100,
                        height: 100,
                      ),
                      "Diseases ".text.center.semiBold.size(15).make(),
                    ])).shadowLg.white.roundedSM.make().p16(),
                  ),
                  InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ResourecePage(),
                      ),
                    ),
                    child: VxBox(
                        child: Column(children: [
                      Image.asset(
                        "assets/images/resources.png",
                        width: 100,
                        height: 100,
                      ),
                      "Resources".text.center.semiBold.size(18).make(),
                    ])).shadowLg.white.roundedSM.make().p16(),
                  ),
                ],
              ),
            ):
            Container(
              height: context.isMobile
                  ? context.screenHeight
                  : context.screenHeight * 0.3,
              child: GridView(
                //shrinkWrap: context.isMobile?true:false,
                // physics: context.isMobile?NeverScrollableScrollPhysics():null,

                scrollDirection: Axis.horizontal,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: context.isMobile ? 2 : 1),
                children: [
                  InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => Microbiome(),
                      ),
                    ),
                    child: VxBox(
                        child: Column(children: [
                          Image.asset(
                            "assets/images/micro2.png",
                            width: 125,
                            height: 125,
                          ),
                          "What is Microbiome?".text.fontFamily('Google Font').semiBold.size(18).center.make(),
                        ])).shadowLg.white.roundedSM.make().p20(),
                  ),
                  InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => GoodBadMicro(),
                      ),
                    ),
                    child: VxBox(
                        child: Column(children: [
                          Image.asset(
                            "assets/images/micro1.png",
                            width: 125,
                            height: 125,
                          ),
                          "Good V/S Bad Microbiome ".text.center.semiBold.size(18).make(),
                        ])).shadowLg.white.roundedSM.make().p20(),
                  ),
                  InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => TypesOfMicro(),
                      ),
                    ),
                    child: VxBox(
                        child: Column(children: [
                          Image.asset(
                            "assets/images/micro3.png",
                            width: 125,
                            height: 125,
                          ),
                          "Types of Microbiome".text.center.semiBold.size(18).make(),
                        ])).shadowLg.white.roundedSM.make().p20(),
                  ),
                  InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => SuperPowerMicro(),
                      ),
                    ),

                    child: VxBox(
                        child: Column(children: [
                          Image.asset(
                            "assets/images/super.png",
                            width: 130,
                            height: 130,
                          ),
                          " Gaining Superpower".text.center.semiBold.size(18).make(),
                        ])).shadowLg.white.roundedSM.make().p20(),
                  ),
                  InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => EnemyMicro(),
                      ),
                    ),
                    child: VxBox(
                        child: Column(children: [
                          Image.asset(
                            "assets/images/avoiding.png",
                            width: 130,
                            height: 130,
                          ),
                          "Avoiding Enemies".text.center.semiBold.size(18).make(),
                        ])).shadowLg.white.roundedSM.make().p20(),
                  ),

                  InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => Diseses(),
                      ),
                    ),

                    child: VxBox(
                        child: Column(children: [
                          Image.asset(
                            "assets/images/diseses.png",
                            width: 130,
                            height: 130,
                          ),
                          "Diseases ".text.center.semiBold.size(18).make(),
                        ])).shadowLg.white.roundedSM.make().p20(),
                  ),
                  InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ResourecePage(),
                      ),
                    ),
                    child: VxBox(
                        child: Column(children: [
                          Image.asset(
                            "assets/images/resources.png",
                            width: 130,
                            height: 130,
                          ),
                          "Resources".text.center.semiBold.size(18).make(),
                        ])).shadowLg.white.roundedSM.make().p20(),
                  ),
                ],
              ),
            )
          ],
        ).scrollVertical()
      ),
    );
  }
}
