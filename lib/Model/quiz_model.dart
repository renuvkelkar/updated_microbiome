class QuestionModel{


  String question;
  String imgurl;
   String option1;
 String option2;
 String option3;
   String option4;
   String correctOption;
   bool answered;
   List<String> shuffledOptions;



  QuestionModel({ this.question, this.option1, this.option2,
     this.option3, this.option4, this.correctOption, this.answered,this.imgurl
  });

  QuestionModel.fromJson(Map<String , dynamic> json){
    imgurl= json['imgurl'];
    question= json['question'];
    option1 = json['option1'];
    option2= json['option2'];
    option3 = json['option3'];
    option4 = json['option4'];
    correctOption = json['option1'];
    shuffledOptions = [
      json["option1"],
      json["option2"],
      json["option3"],
      json["option4"],
    ];
    shuffledOptions.shuffle();
    answered = false;
  }
//
// Map<String , dynamic> toJson(){
//   final Map<String , dynamic> data = new Map<String , dynamic>();
//   data['question'] = this.question;
//   data[' option1'] = this. option1;
//   data['option2'] = this.option2;
//   data['option3'] = this.option3;
//   data['option4'] = this.option4;
//   data['correctOption'] = this.correctOption;
//   data[' answered'] = this. answered;
//   return data;
// }


}
