


import 'package:aahaarkranti_app/Views/Main_Dashbord.dart/Main_Dashbord.dart';
import 'package:aahaarkranti_app/Views/Main_Dashbord.dart/Quiz/quiz_play.dart';
import 'package:flutter/cupertino.dart';




import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:velocity_x/velocity_x.dart';

class Results extends StatefulWidget {
  final int total, correct, incorrect, notattempted;
  Results(
      {  this.incorrect,
         this.total,
         this.correct,
         this.notattempted});

  @override
  _ResultsState createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
  // late ConfettiController _controllerCenter;
  void initState() {
    // _controllerCenter =
    //     ConfettiController(duration: const Duration(seconds: 4));
    super.initState();
  }

  void dispose() {
    // _controllerCenter.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  backgroundColor: Colors.orangeAccent.shade400,
      // appBar: VxAppBar(
      //   title: "Results".text.make(),
      //   centerTitle: true,
      //   backgroundColor: Colors.teal,
        
      // ),
      body: Stack(
        children: [
         
         context.isMobile?
          // Image.network("https://image.freepik.com/free-vector/banner-with-many-kids-reading-book_1308-32489.jpg",
          // height: context.screenHeight,
          //     width: context.screenWidth,fit: BoxFit.cover,)

          Image.network("https://image.freepik.com/free-vector/board-template-with-happy-boy_1308-72244.jpg",
          height: context.screenHeight,
              width: context.screenWidth,fit: BoxFit.cover,)
              :
              Image.network("https://image.freepik.com/free-vector/banner-with-boy-girl_1308-32521.jpg",
          height: context.screenHeight,
              width: context.screenWidth,fit: BoxFit.contain,),
          Container(
           
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  widget.correct >=6?
                  Container(
                    padding: EdgeInsets.only(top: context.isMobile?50:10,bottom:context.isMobile?10:10 ),
                    child:  Column(
                      children: [
                        Text("Good Job!!", style:  TextStyle(color: Colors.white,fontWeight: FontWeight.w600,   fontSize: context.isMobile ? 20:30,),),
                        Lottie.network(
                            'https://assets7.lottiefiles.com/packages/lf20_xldzoar8.json',
                            height: context.isMobile? 60:100,
                            width: context.isMobile?130:150,
                            fit: BoxFit.cover),
                      ],
                    ),
                  ):
                  Container(
                    padding: EdgeInsets.only(top: context.isMobile?50:10,bottom:context.isMobile?10:10 ),
                    child:  Column(
                      children: [
                        Text("Well Done !You want to try again",style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: context.isMobile ? 20:30,
                         
                        )),
                        Lottie.network(
                            'https://assets5.lottiefiles.com/private_files/lf30_ansmdrzi.json',
                            height:context.isMobile? 60:100,
                            width: context.isMobile?130:150,
                            fit: BoxFit.cover),
                      ],
                    ),
                  )
                  ,
                 context.isMobile? 12.heightBox:6.heightBox,
                  Text(
                    "Score : ${widget.correct}/ ${widget.total}",
                    style: TextStyle(fontSize: 25,color: Colors.white,),

                  ),
                  3.heightBox,
                  "Correct - ${widget.correct}".text.lg.white.bold.make().p4(),
                  "Wrong - ${widget.incorrect}".text.lg.white.bold.make().p4(),

                context.isMobile?  20.heightBox:45.heightBox,
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DashBord()),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(30)),
                      child: Text(
                        "Go to home",
                        style: TextStyle(color: Colors.white, fontSize: 19),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ).pOnly(top:context.isMobile?80:10),
        ],
      ),
    );
  }

  Align buildButton() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: VxBox(
        child: TextButton(
          onPressed: () {
            // _controllerCenter.play();
          },
          child: "Congratulations!".text.white.bold.xl5.letterSpacing(0.2).makeCentered(),
        ),
      ).height(80).width(context.screenWidth*0.70).red500.make(),
    );
  }
}