import 'package:aahaarkranti_app/Views/Main_Dashbord.dart/Quiz/result.dart';
import 'package:aahaarkranti_app/Views/Main_Dashbord.dart/Quiz/widget/quiz_play_widget.dart';
import 'package:aahaarkranti_app/Model/quiz_model.dart';
import 'package:aahaarkranti_app/provider/quiz_provider.dart';

import 'package:aahaarkranti_app/sevices/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

import '../Main_Dashbord.dart';

class QuizPlay extends StatefulWidget {
  @override
  _QuizPlayState createState() => _QuizPlayState();
}

class _QuizPlayState extends State<QuizPlay> {
  QuerySnapshot questionSnaphot;
  DatabaseService databaseService = new DatabaseService();
  PageController pageController = PageController(initialPage: 0);
  int pageChanged = 0;
  bool isLoading = true;
  QuizProvider _quizProvider;
  List<QuestionModel> _questions;
  var ShuffledQueList;

  @override
  void initState() {
    _quizProvider = Provider.of<QuizProvider>(context, listen: false);
    databaseService.getQuestionData().listen((value) {
      questionSnaphot = value;
      _questions = [];
      questionSnaphot.docs.forEach((element) {
        _questions.add(getQuestionModelFromDatasnapshot(element));
      });
      _quizProvider.questions = _questions;
      isLoading = false;
      _questions.shuffle(); // this code is for shuffling the question list.
      setState(() {});
    });

    super.initState();
  }

  QuestionModel getQuestionModelFromDatasnapshot(
      DocumentSnapshot questionSnapshot) {
    Map<String, dynamic> data = questionSnapshot.data() as Map<String, dynamic>;
    QuestionModel questionModel = new QuestionModel.fromJson(data);
    questionModel.question = data["question"];
    questionModel.answered = false;
    return questionModel;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: VxAppBar(
        elevation: 0.0,
        title: "Lets play Quiz!".text.make(),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => DashBord()));
          }, icon: Icon(Icons.home))
        ],
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Color(0xFFFF9100),
            Color(0xFFFF6d00),
          ])),
        ),
      ),
      body: isLoading
          ? SingleChildScrollView(
              child: Container(
                child: Center(child: CircularProgressIndicator()),
              ),
            )
          : Column(
              children: [
                questionSnaphot.docs == null
                    ? Container(
                        child: Center(
                          child: Text("No Data"),
                        ),
                      )
                    : Column(
                        children: [
                          //Image.network("https://image.freepik.com/free-vector/cartoon-vegetables-fresh-vegan-veggies-raw-vegetable-green-zucchini-celery-lettuce-tomato-carrot-illustration-set_102902-1204.jpg",height: context.screenHeight * 0.30,width: context.screenWidth,fit: BoxFit.cover,),
                          10.heightBox,
                          Container(
                            height: context.screenHeight* 0.80 ,
                            width: context.screenWidth * 0.95,
                            child: Consumer<QuizProvider>(
                              builder: (_, model, child) => PageView.builder(
                                  onPageChanged: (index) {
                                    setState(() {
                                      pageChanged = index;
                                    });
                                  },
                                  controller: pageController,
                                  itemCount: model.questions.take(10).length,
                                  itemBuilder: (context, index) {
                                    return VxBox(
                                      child: QuizPlayTile(
                                        questionSelected: () {
                                          setState(() {
                                            pageController.animateToPage(
                                                index + 1,
                                                duration:
                                                    Duration(milliseconds: 200),
                                                curve: Curves.bounceIn);
                                          });
                                        },
                                        index: index,
                                      ),
                                    )
                                        // .height(context.screenHeight * 0.50)
                                        .width(context.screenWidth * 0.50)
                                        .make();
                                  }),
                            ),
                          ).centered(),
                        ],
                      ),
              ],
            ),
      floatingActionButton: Consumer<QuizProvider>(
        builder: (_, model, child) => FloatingActionButton.extended(
          onPressed: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => Results(
                          correct: model.getCorrectCount(),
                          incorrect: model.getInCorrectCount(),
                          total: 10,
                          notattempted: model.getNotAttemptedCount(),
                        )));
          },
          icon: Icon(Icons.check),
          label: "Quiz Completed".text.make(),
          backgroundColor: Colors.blue,
        ),
      ).pOnly(right: 8, bottom: 8),
    );
  }
}

class QuizPlayTile extends StatefulWidget {
  final int index;
  final Function questionSelected;

  QuizPlayTile({this.index, this.questionSelected});

  @override
  _QuizPlayTileState createState() => _QuizPlayTileState();
}

class _QuizPlayTileState extends State<QuizPlayTile> {
  String optionSelected = "";
  List alphoPTION = ["A", "B", "C", "D"];

  @override
  void initState() {
    QuizProvider quizProvider =
        Provider.of<QuizProvider>(context, listen: false);
    optionSelected = quizProvider.optionsSelected[widget.index];
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<QuizProvider>(
        builder: (_, model, child) => Container(
              child: VxBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: FadeInImage.assetNetwork(image: model.questions[widget.index].imgurl,
                          height: context.isMobile
                              ? context.screenHeight * 0.35
                              : context.screenHeight * 0.39,
                          width: context.isMobile
                              ? context.screenWidth
                              : context.screenWidth ,
                          fit:
                              context.isMobile ? BoxFit.fill : BoxFit.contain, placeholder: 'assets/images/placeholder.jpg',),
                      // child: Image.network(model.questions[widget.index].imgurl,
                      //     height: context.isMobile
                      //         ? context.screenHeight * 0.35
                      //         : context.screenHeight * 0.39,
                      //     width: context.isMobile
                      //         ? context.screenWidth
                      //         : context.screenWidth ,
                      //     fit:
                      //     context.isMobile ? BoxFit.fill : BoxFit.contain),
                    ),
                    10.heightBox,
                    VxBox(
                      // margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "Q${widget.index + 1}: ${model.questions[widget.index].question}",
                        style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold,  color: Colors.white),
                      ).p16(),
                    ).make(),
                    5.heightBox,
                    ListView.builder(
                      
                        shrinkWrap: true,
                        itemCount: model
                            .questions[widget.index].shuffledOptions.length,
                        itemBuilder: (_, i) => GestureDetector(
                              onTap: () {
                                if (!model.questions[widget.index].answered) {
                                  optionSelected = model.questions[widget.index]
                                      .shuffledOptions[i];
                                  setState(() {});
                                  model.setOptionSelected(
                                      optionSelected, widget.index);
                                } else {
                                  //Show the Snackbar
                                }
                                widget.questionSelected.call();
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 4.0,
                                ),
                                child: OptionTile(
                                    sno: alphoPTION[i],
                                    disabled:
                                        model.questions[widget.index].answered,
                                    correctAnswer: model
                                        .questions[widget.index].correctOption,
                                    option: model.questions[widget.index]
                                        .shuffledOptions[i],
                                    optionSelected: optionSelected),
                              ),
                            )),
                  ],
                ),
              )
                  .linearGradient([Color(0xFFFF9100), Color(0xFFFF6d00)])
                  .height(context.isMobile
                      ? context.screenHeight
                      : context.screenHeight * 11.0)
                  .width(context.isMobile
                      ? context.screenWidth
                      : context.screenWidth * 0.4)
                  .p8
                  .makeCentered(),
            ));
  }
}
