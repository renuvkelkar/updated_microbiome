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
class TypesOfMicro extends StatefulWidget {
  const TypesOfMicro({Key key}) : super(key: key);

  @override
  _TypesOfMicroState createState() => _TypesOfMicroState();
}

class _TypesOfMicroState extends State<TypesOfMicro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightBlue,
        appBar: AppBar(
          title: Text("Types of Germs"),
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
                  child: Type1()).makeCentered(),

              Type2(),
              Type3(),
              Type4(),
              Type5(),
            ],
          ),
        ).height(context.screenHeight).width(context.screenWidth).makeCentered()

    );
  }
}
