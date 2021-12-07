import 'package:aahaarkranti_app/Views/Main_Dashbord.dart/Main_Dashbord.dart';
import 'package:aahaarkranti_app/Model/game_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:velocity_x/velocity_x.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key key}) : super(key: key);

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  final snackBar = SnackBar(
    content: "Yay! Correct 🥳".text.center.make(),
    backgroundColor: Colors.green,
  );
  final snackBar1 = SnackBar(
    content: "Opps! Wrong 😥".text.center.make(),
    backgroundColor: Colors.red,
  );

  List<Data> items = [];
  List<Data> items2 = [];
  bool gameOver;
  int score;
  bool isLoading = true;


  bool accepting = false;

  get child => null;

  @override
  void initState() {


    score = 0;
    gameOver = false;
    super.initState();
    getFruitsData();
    initGame();
    isLoading = false;
    // setState(() {
    //
    //
    //
    //
    // });
  }

  initGame() {
    //  gameOver = true;
    score = 0;
  }

  QuerySnapshot fruitsSnapshot;

  getFruitsData() async {

    fruitsSnapshot = await FirebaseFirestore.instance.collection("Game").get();
    items = fruitsSnapshot.docs
        .map((element) => Data.fromJson(element.data() as Map<String, dynamic>))
        .toList();
    items2 = fruitsSnapshot.docs
        .map((element) => Data.fromJson(element.data() as Map<String, dynamic>))
        .toList();

    // items?.shuffle();
    // items2?.shuffle();
    items?.shuffle();
    items = items?.take(4).toList();
    print("-------- ITEMS 1");
    items?.forEach((element) {
      print(element.name);
    });
    items2=[];
    print(items2);
    items2?.addAll(items);
    print("------ITEMS 2");
    items2?.forEach((element) {
      print(element.name);
    });
    items2?.shuffle();
    setState(() {

    });

    setState(() {
      // items?.take(3);
      // items2?.take(3);
    });
  }

  @override
  Widget build(BuildContext context) {
    //if (items!.length != 0) ;
    // gameOver = true
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text('Drag & Drop Game').text.fontFamily("Google Fonts").make(),
        backgroundColor: Colors.green.shade900,
        actions: [
          IconButton(onPressed: (){
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => DashBord()));
          }, icon: Icon(Icons.home))
        ],
        // flexibleSpace: Container(
        // decoration: BoxDecoration(
        //     gradient: LinearGradient(colors: [
        //   Color(0xFFFF9100),
        //   Color(0xFFFF6d00),
        // ])),
        // ),
      ),
      body:SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child:fruitsSnapshot ==null?Center(child: CircularProgressIndicator()): Container(

          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Color(0xFFFF9100),
                Color(0xFFFF6d00),
              ])),
          child: Stack(children: [
            Image.network(
              "https://image.freepik.com/free-vector/top-view-blank-wooden-table-with-leaves-elements_1308-51324.jpg",
              height: context.screenHeight,
              width: context.screenWidth,
              fit: BoxFit.cover,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Lottie.network(
                    //     'https://assets3.lottiefiles.com/packages/lf20_pyiyoyxf.json',
                    //     height: 80,
                    //     width: 80,
                    //     fit: BoxFit.cover),
                    Text.rich(TextSpan(children: [
                      TextSpan(
                          text: "Score: ",
                          style: TextStyle(
                              fontSize: 25,
                              // fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontFamily: ("Google Fonts"))),
                      TextSpan(
                          text: "$score",
                          style: TextStyle(
                              color: Colors.yellow,
                              fontWeight: FontWeight.bold,
                              fontSize: 30.0))
                    ])),
                  ],
                ),
                5.heightBox,
                if (items.length != 0)
                  Container(

                    height: 600,
                    width: 800,
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          return Row(
                            children: <Widget>[

                              Column(children: [
                                Draggable<Data>(
                                    data: items[index],
                                    feedback: ClipRRect(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(60)),
                                      child: Image.network(
                                        items[index].imgurl.toString(),
                                        height: 120,
                                        width: 120,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    childWhenDragging: ClipRRect(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(60)),
                                      child: Image.network(
                                        items[index].imgurl.toString(),
                                        height: 120,
                                        width: 120,
                                        fit: BoxFit.cover,
                                        colorBlendMode: BlendMode.softLight,
                                      ),
                                    ),
                                    child: ClipRRect(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(60)),
                                      child: Image.network(
                                        items[index].imgurl.toString(),
                                        height: 120,
                                        width: 120,
                                        fit: BoxFit.cover,
                                      ),
                                    ))
                              ]).p12(),
                              Spacer(),
                              Expanded(
                                child: Container(
                                    child: DragTarget<Data>(
                                      onAccept: (receivedItem) {
                                        if (items2[index].value ==
                                            receivedItem.value) {
                                          // ScaffoldMessenger.of(context)
                                          //     .showSnackBar(snackBar);
                                          setState(() {
                                            items2[index].accepting = true;
                                            items2.removeWhere((dataList) =>
                                            dataList.imgurl ==
                                                receivedItem.imgurl);
                                            items.removeWhere((dataList) =>
                                            dataList.imgurl ==
                                                receivedItem.imgurl);

                                            score += 10;
                                          });
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(snackBar1);
                                          setState(() {
                                            score -= 5;
                                            items[index].accepting = false;
                                          });
                                        }
                                      },
                                      onLeave: (receivedItem) {
                                        setState(() {
                                          items[index].accepting = false;
                                        });
                                      },
                                      onWillAccept: (receivedItem) {
                                        setState(() {
                                          items[index].accepting = true;
                                        });
                                        return true;
                                      },
                                      builder:
                                          (context, acceptedItems, rejectedItems) =>
                                          CircleAvatar(
                                              radius: 60,
                                              backgroundColor: Colors.white,
                                              child: Text(
                                                items2[index].name.toString(),
                                              ).text.red800.bold.xl.makeCentered().p8()),
                                    )),
                              )
                            ],
                          ).py(4).px8();
                        }),
                  ),
                10.heightBox,
                if (items.length == 0)

                  Container(

                    height: 600,
                    width: 800,
                    child: Column(
                      children: [
                        score >=40?
                        Container(
                          child:  Column(
                            children: [
                              "God Job !!".text.bold.white.xl3.make().shimmer(),
                              Lottie.network(
                                  'https://assets6.lottiefiles.com/temporary_files/49MSGC.json',
                                  height: context.isMobile? 90:100,
                                  width: context.isMobile?130:150,
                                  fit: BoxFit.cover),
                            ],
                          ),
                        ):
                        Container(
                          child:  Column(
                            children: [
                              "Well Done !You want to try again".text.bold.white.xl3.make().shimmer(),
                              Lottie.network(
                                  'https://assets1.lottiefiles.com/packages/lf20_AsP7Bf.json',
                                  height:context.isMobile? 100:120,
                                  width: context.isMobile?130:150,
                                  fit: BoxFit.cover),
                            ],
                          ),
                        ),
                        40.heightBox,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 150,
                              child: RaisedButton(
                                color: Colors.blue.shade900,
                                child: "New game".text.bold.xl2.white.italic.make(),
                                onPressed: () {

                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => GamePage()));

                                  //  initGame();
                                  // setState(() {});
                                },
                              ),
                            ),
                            20.widthBox,
                            Container(
                              width: 150,
                              child: MaterialButton(
                                color: Colors.blue.shade900,
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => DashBord()));
                                },
                                child: "Exit Game".text.white.bold.xl2.italic.make(),
                              ),
                            )
                          ],
                        ),
                        // 50.heightBox,
                        // Text('Your Score is $score',
                        //     style: TextStyle(
                        //       fontSize: 20,
                        //         fontWeight: FontWeight.bold,
                        //         color: Colors.white)),
                        //  'Your Score is $score'.text.bold.xl3.white.make().shimmer(primaryColor: Colors.blueGrey)
                      ],
                    ),
                  ),
              ],
            ),
          ],
          ),
        ).centered(),
      ),

    );
  }
}