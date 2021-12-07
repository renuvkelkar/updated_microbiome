import 'package:aahaarkranti_app/Views/Info/Splashscreen/splashScreenNew.dart';
import 'package:aahaarkranti_app/provider/quiz_provider.dart';
import 'package:aahaarkranti_app/test.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'HomePage.dart';
import 'Views/Info/IntroSlider/inroSlider.dart';
import 'Views/Info/MicroInfo/microInfo.dart';
import 'Views/Info/Splashscreen/splashScreen.dart';
import 'Views/Info/Types/typesofMicro.dart';
import 'Views/Main_Dashbord.dart/Main_Dashbord.dart';
import 'Views/SubDashBoard/aboutMicrobiome.dart';
import 'Views/VideoPage.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_)=>QuizProvider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(

            primarySwatch: Colors.red,
          ),
          home: Type1(

          ),
          //  home: Splashscreen(),
          // home: QuizPlay(),
        )


    );

  }
}
