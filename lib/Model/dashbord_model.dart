import 'package:aahaarkranti_app/Views/Main_Dashbord.dart/Main_Dashbord.dart';

class Dashbord {
  String imageUrl;
  String name;

  // int color;

  Dashbord({
    this.imageUrl,
    this.name,
    // this.color,
  });
}

List<Dashbord> info = [
  Dashbord(
    imageUrl: "https://cdn-icons-png.flaticon.com/512/2436/2436636.png",
    name: 'Learing',
     // color: 0xFFF2CF5B,
  ),
  Dashbord(
    imageUrl: "https://image.freepik.com/free-vector/match-picture-word-worksheet-children_1308-53804.jpg",
    name: 'Puzzles',

    // color: 0xFFF2CF5B,
  ),
  Dashbord(
    imageUrl: "https://cdn-icons-png.flaticon.com/512/5678/5678190.png",
    name: 'Quiz',

    // color: 0xFF36ba5e,
  ),
];
