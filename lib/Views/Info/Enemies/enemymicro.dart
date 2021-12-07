import 'package:aahaarkranti_app/Views/Info/Enemies/widgets/slide1.dart';
import 'package:aahaarkranti_app/Views/Info/Enemies/widgets/slide2.dart';
import 'package:aahaarkranti_app/Views/Info/Enemies/widgets/slide3.dart';
import 'package:aahaarkranti_app/Views/Info/Enemies/widgets/slide4.dart';
import 'package:aahaarkranti_app/Views/Info/Enemies/widgets/slide5.dart';
import 'package:aahaarkranti_app/Views/Info/MicroInfo/page1.dart';
import 'package:aahaarkranti_app/Views/Info/MicroInfo/page2.dart';
import 'package:aahaarkranti_app/Views/Info/MicroInfo/page3.dart';
import 'package:aahaarkranti_app/Views/Info/Superpower/widgets/slide1.dart';
import 'package:aahaarkranti_app/Views/Info/Superpower/widgets/slide2.dart';
import 'package:aahaarkranti_app/Views/Info/Superpower/widgets/slide3.dart';
import 'package:aahaarkranti_app/Views/Info/Superpower/widgets/slide4.dart';
import 'package:aahaarkranti_app/Views/Info/Superpower/widgets/slide5.dart';
import 'package:aahaarkranti_app/Views/Info/Types/widget/type1.dart';
import 'package:aahaarkranti_app/Views/Info/Types/widget/type2.dart';
import 'package:aahaarkranti_app/Views/Info/Types/widget/type3.dart';
import 'package:aahaarkranti_app/Views/Info/Types/widget/type4.dart';
import 'package:aahaarkranti_app/Views/Info/Types/widget/type5.dart';
import 'package:aahaarkranti_app/Views/Main_Dashbord.dart/Main_Dashbord.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
class EnemyMicro extends StatefulWidget {
  const EnemyMicro({Key key}) : super(key: key);

  @override
  _EnemyMicroState createState() => _EnemyMicroState();
}

class _EnemyMicroState extends State<EnemyMicro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightBlue,
        appBar: AppBar(
          title: Text("Avoiding Enemies"),
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
            height: context.screenHeight,
            viewportFraction: 1.0,
            enableInfiniteScroll:false,
            autoPlayCurve: Curves.easeInOut,
           // autoPlayAnimationDuration: Duration(seconds: 70),
           //
           // autoPlay: true,
            items: [
              VxBox(
                  child: EnemySlide1()).makeCentered(),

              EnemySlide2(),
              EnemySlide3(),
              EnemySlide4(),
              EnemySlide5(),

            ],
          ),
        ).height(context.screenHeight).width(context.screenWidth).makeCentered()

    );
  }
}
