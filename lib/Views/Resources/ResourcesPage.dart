import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'Web_view.dart';
import 'mobile_view.dart';

class ResourecePage extends StatefulWidget {
  const ResourecePage({Key key}) : super(key: key);

  @override
  _ResourecePageState createState() => _ResourecePageState();
}

class _ResourecePageState extends State<ResourecePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,

      body: Container(
        child: context.isMobile?
        MbVideoList():
        WebVideoList(),




      ),
    );
  }
}
