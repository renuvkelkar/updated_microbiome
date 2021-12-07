import 'package:aahaarkranti_app/Views/Info/GoodandBad/widgets/slide1.dart';
import 'package:aahaarkranti_app/Views/Info/GoodandBad/widgets/slide2.dart';
import 'package:aahaarkranti_app/Views/Info/GoodandBad/widgets/slide3.dart';
import 'package:aahaarkranti_app/Views/Info/MicroInfo/page1.dart';
import 'package:aahaarkranti_app/Views/Info/MicroInfo/page2.dart';
import 'package:aahaarkranti_app/Views/Info/MicroInfo/page3.dart';
import 'package:aahaarkranti_app/Views/Info/Types/widget/type1.dart';
import 'package:aahaarkranti_app/Views/Info/Types/widget/type2.dart';
import 'package:aahaarkranti_app/Views/Info/Types/widget/type3.dart';
import 'package:aahaarkranti_app/Views/Info/Types/widget/type4.dart';
import 'package:aahaarkranti_app/Views/Info/Types/widget/type5.dart';
import 'package:aahaarkranti_app/Views/Main_Dashbord.dart/Main_Dashbord.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
class GoodBadMicro extends StatefulWidget {
  const GoodBadMicro({Key key}) : super(key: key);

  @override
  _GoodBadMicroState createState() => _GoodBadMicroState();
}

class _GoodBadMicroState extends State<GoodBadMicro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightBlue,
        appBar: AppBar(
          title: Text("Good / Bad "),
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
           // autoPlayAnimationDuration: Duration(seconds: 70),
           //
           // autoPlay: true,
            items: [
              VxBox(
                  child: Slide1()).makeCentered(),

               Slide2(),
              Slide3(),

            ],
          ),
        ).height(context.screenHeight).width(context.screenWidth).makeCentered()

    );
  }
}
