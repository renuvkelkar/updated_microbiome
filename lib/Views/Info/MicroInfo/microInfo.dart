import 'package:aahaarkranti_app/Views/Info/MicroInfo/page1.dart';
import 'package:aahaarkranti_app/Views/Info/MicroInfo/page2.dart';
import 'package:aahaarkranti_app/Views/Info/MicroInfo/page3.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
class MicroInfo extends StatefulWidget {
  const MicroInfo({Key key}) : super(key: key);

  @override
  _MicroInfoState createState() => _MicroInfoState();
}

class _MicroInfoState extends State<MicroInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(
        title: Text("What is Microbiome ?"),
        centerTitle: true,

      ),
      body: VxBox(
        child: VxSwiper(
          height: context.screenHeight,
         viewportFraction: 1.0,

         // autoPlay: true,
          items: [
            VxBox(
                child: Page1()).makeCentered(),

                Page2(),
                Page3(),
          ],
        ),
      ).height(context.screenHeight).width(context.screenWidth).makeCentered()

    );
  }
}
