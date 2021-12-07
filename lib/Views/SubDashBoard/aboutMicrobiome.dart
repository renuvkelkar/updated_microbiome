import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
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
        title: Text("Sub DashBoard"),
      ),
      body: Column(
        children: [
          Container(
            height: context.isMobile?context.screenHeight*0.4:context.screenHeight*0.5,
            width:context.isMobile?context.screenWidth:context.screenWidth*0.5 ,
            color: Colors.green,
          ),
          Container(
          height: context.isMobile?context.screenHeight:context.screenHeight*0.3,
            child: GridView(
              scrollDirection: context.isMobile?Axis.vertical:Axis.horizontal,
                gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: context.isMobile?2:1),
              children: [
                VxBox().red500.roundedSM.make().p16(),
                VxBox().red500.roundedSM.make().p16(),
                VxBox().red500.roundedSM.make().p16(),
                VxBox().red500.roundedSM.make().p16(),
                VxBox().red500.roundedSM.make().p16(),
                VxBox().red500.roundedSM.make().p16(),
                VxBox().red500.roundedSM.make().p16(),
                VxBox().red500.roundedSM.make().p16(),

              ],
            ),
          )
        ],
      ).scrollVertical(),
    );
  }
}
