
import 'package:flutter/material.dart';
import 'package:flutter_sequence_animation/flutter_sequence_animation.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:lottie/lottie.dart';
import "package:velocity_x/velocity_x.dart";
class IntroScreen extends StatefulWidget {


  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  AnimationController controller;
  SequenceAnimation sequenceAnimation;

  bool forward;
  List<Slide> slides = [];
  @override
  void initState() {
    super.initState();
    sequenceAnimation = new SequenceAnimationBuilder()
        .addAnimatable(
        animatable: new ColorTween(begin: Colors.red, end: Colors.yellow),
        from:  const Duration(seconds: 0),
        to: const Duration(seconds: 2),
        tag: "color"
    ).addAnimatable(
        animatable: new Tween<double>(begin: 0.0, end: 1.0),
        from:  const Duration(seconds: 0),
        to: const Duration(seconds: 1),
        tag: "opacity",
        curve: Curves.easeOut
    ).addAnimatable(
        animatable: new Tween<double>(begin: 0.0, end: 1.0),
        from:  const Duration(seconds: 2),
        to: const Duration(seconds: 7),
        tag: "opacity1",
        curve: Curves.easeOut
    ).addAnimatable(
        animatable: new Tween<double>(begin: 0.0, end: 1.0),
        //  animatable: new Tween<double>(begin: 200.0, end: 40.0),
        from:  const Duration(seconds: 8),
        to: const Duration(seconds: 9),
        tag: "opacity2",
        curve: Curves.fastOutSlowIn
    ).addAnimatable(
        animatable: new Tween<double>(begin: 0.0, end: 40),
        //  animatable: new Tween<double>(begin: 200.0, end: 40.0),
        from:  const Duration(seconds: 7),
        to: const Duration(seconds: 10),
        tag: "size1",
        curve: Curves.fastOutSlowIn
    ).addAnimatable(
        animatable: new Tween<double>(begin: 0.0, end: 1.0),
        from:  const Duration(seconds: 10),
        to: const Duration(seconds: 11),
        tag: "opacity3",
        curve: Curves.easeOut
    ).addAnimatable(
        animatable: new Tween<double>(begin: 0.0, end: 1.0),
        from:  const Duration(seconds: 12),
        to: const Duration(seconds: 13),
        tag: "opacity4",
        curve: Curves.easeOut
    )
        .addAnimatable(
        animatable: new Tween<double>(begin: 0, end: 500),
        //  animatable: new Tween<double>(begin: 200.0, end: 40.0),
        from:  const Duration(seconds: 4),
        to: const Duration(seconds: 8),
        tag: "scale",
        curve: Curves.fastOutSlowIn
    ).animate(controller);
    controller.forward();

    slides.add(
      new Slide(
       //  heightImage: context.screenHeight*0.7,
       // widthImage: context.screenWidth*0.7,
       // centerWidget: Image.network("https://image.freepik.com/free-photo/top-view-vegetables-fruits-lettuce-tomatoes-cucumber-dill-cherry-tomatoes-zucchini-green-onion-parsley-apple-lemon-kiwi-free-space-center_140725-59431.jpg"),
        centerWidget: Stack(
          children: [
            AnimatedBuilder(
              builder: (context, child){
                return
                  Stack(
                    children: [
                      VxBox(child: Column(
                        children: [
                          Image.network("https://events.flutter.dev/engage/assets/img/flutter-engage-sharing.jpg",height:context.screenHeight*0.5,fit: BoxFit.cover,).opacity(value: sequenceAnimation["opacity"].value),
                        ],
                      )).color(Color(0xFF71D7FF)).height(context.screenHeight).make(),
                      Image.network("https://events.flutter.dev/engage/assets/img/birds.png",width: sequenceAnimation["scale"].value,).pOnly(top:350,left: 20).opacity(value: sequenceAnimation["opacity1"].value),
                      "Flutter Engage".text.white.bold.size(sequenceAnimation["size1"].value).makeCentered().opacity(value: sequenceAnimation["opacity2"].value),
                      "03.03.21".text.xl2.semiBold.makeCentered().opacity(value: sequenceAnimation["opacity3"].value).pOnly(top: 70),
                      "9:30am - 1:00pm PST".text.gray700.makeCentered().opacity(value: sequenceAnimation["opacity3"].value).pOnly(top: 110),
                      VxBox(child: "Sign up for Updates".text.semiBold.white.makeCentered()).height(30).width(200).roundedSM.color(Colors.blue).makeCentered().opacity(value: sequenceAnimation["opacity4"].value).pOnly(top: 110).pOnly(top: 400)

                    ],
                  );

              },
              animation: controller,

            )

          ],
        ),
        // Lottie.network(
        //     'https://assets8.lottiefiles.com/packages/lf20_tll0j4bb.json',
        //     height: 300,
        //     width: 300,
        //     fit: BoxFit.cover),


      ),
    );
    slides.add(
      new Slide(
        centerWidget: Lottie.network(
            'https://assets8.lottiefiles.com/packages/lf20_TmewUx.json',
            height: 300,
            width: 300,
            fit: BoxFit.cover),
        title: "Eat a rainbow of fruits and vegetables",
        styleTitle:
        TextStyle(color: Colors.black, fontSize: 30.0, fontWeight: FontWeight.bold, fontFamily: 'RobotoMono'),
        description: "Ye indulgence unreserved connection alteration appearance",
        styleDescription:
        TextStyle(color: Colors.black, fontSize: 20.0, fontStyle: FontStyle.italic, fontFamily: 'Raleway'),
        backgroundColor: Colors.white,
        directionColorBegin: Alignment.topRight,
        directionColorEnd: Alignment.bottomLeft,
      ),
    );
    slides.add(
      new Slide(
        centerWidget: Lottie.network(
            'https://assets6.lottiefiles.com/packages/lf20_agde5pma.json',
            height: 300,
            width: 300,
            fit: BoxFit.cover),
        title: "Fruits are your Best Friends",
        styleTitle:
        TextStyle(color: Colors.black, fontSize: 30.0, fontWeight: FontWeight.bold, fontFamily: 'RobotoMono'),
        description:
        "Much evil soon high in hope do view. Out may few northward believing attempted. Yet timed being songs marry one defer men our. Although finished blessing do of",
        styleDescription:
        TextStyle(color: Colors.black, fontSize: 20.0, fontStyle: FontStyle.italic, fontFamily: 'Raleway'),
        backgroundColor: Colors.white,

        directionColorBegin: Alignment.topCenter,
        directionColorEnd: Alignment.bottomCenter,
        maxLineTextDescription: 3,
      ),
    );
  }

  void onDonePress() {
    // Do what you want
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => SelectionScreen()),
    // );
  }

  Widget renderNextBtn() {
    return Icon(
      Icons.navigate_next,
      color: Color(0xffF3B4BA),
      size: 35.0,
    );
  }

  Widget renderDoneBtn() {
    return Icon(
      Icons.done,
      color: Color(0xffF3B4BA),
    );
  }

  Widget renderSkipBtn() {
    return Icon(
      Icons.skip_next,
      color: Color(0xffF3B4BA),
    );
  }

  ButtonStyle myButtonStyle() {
    return ButtonStyle(
      shape: MaterialStateProperty.all<OutlinedBorder>(StadiumBorder()),
      backgroundColor: MaterialStateProperty.all<Color>(Color(0x33F3B4BA)),
      overlayColor: MaterialStateProperty.all<Color>(Color(0x33FFA8B0)),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: IntroSlider(
        // List slides
        slides: this.slides,

        // Skip button
        renderSkipBtn: this.renderSkipBtn(),
        skipButtonStyle: myButtonStyle(),

        // Next button
        renderNextBtn: this.renderNextBtn(),
        nextButtonStyle: myButtonStyle(),

        // Done button
        renderDoneBtn: this.renderDoneBtn(),
        onDonePress: this.onDonePress,
        doneButtonStyle: myButtonStyle(),

        // Dot indicator
        colorDot: Color(0x33FFA8B0),
        colorActiveDot: Color(0xffFFA8B0),
        sizeDot: 13.0,

        // Show or hide status bar
        hideStatusBar: true,
        backgroundColorAllSlides: Colors.grey,

        // Scrollbar
       // verticalScrollbarBehavior: scrollbarBehavior.SHOW_ALWAYS,
      ),


    );
  }
}
