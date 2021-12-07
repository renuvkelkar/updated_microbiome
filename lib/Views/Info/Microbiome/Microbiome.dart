
import 'package:aahaarkranti_app/Views/Info/Microbiome/page1.dart';
import 'package:aahaarkranti_app/Views/Info/Microbiome/page2.dart';
import 'package:aahaarkranti_app/Views/Info/Microbiome/page3.dart';
import 'package:aahaarkranti_app/Views/Info/Microbiome/page4.dart';
import 'package:aahaarkranti_app/Views/Main_Dashbord.dart/Main_Dashbord.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
class Microbiome extends StatefulWidget {
  const Microbiome({Key key}) : super(key: key);

  @override
  _MicrobiomeState createState() => _MicrobiomeState();
}

class _MicrobiomeState extends State<Microbiome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(
        title: Text("What is Microbiome ?"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => DashBord()));
          }, icon: Icon(Icons.home))
        ],

      ),
      body: VxBox(
        child: VxSwiper(
          enableInfiniteScroll:false,
          autoPlayCurve: Curves.easeInOut,
          height: context.screenHeight,
         viewportFraction: 1.0,

         // autoPlay: true,
          items: [
            VxBox(
                child: Page1()).makeCentered(),

                Page2(),
            Page3(),
            Page4(),
          ],
        ),
      ).height(context.screenHeight).width(context.screenWidth).makeCentered()

    );
  }
}
