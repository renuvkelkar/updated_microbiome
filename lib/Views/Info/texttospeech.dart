import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class TextToSpeech extends StatefulWidget {
  TextToSpeech({Key key}) : super(key: key);

  @override
  _TextToSpeechState createState() => _TextToSpeechState();
}

class _TextToSpeechState extends State<TextToSpeech> {
  bool isSpeaking = false;
  final _flutterTts = FlutterTts();
  String dec ="The Griffith Observatory is the most iconic building in Los Angeles, perched high in the Hollywood Hills, 1,134 feet above sea level.";

  void initializeTts() {
    _flutterTts.setStartHandler(() {
      setState(() {
        isSpeaking = true;
      });
    });
    _flutterTts.setCompletionHandler(() {
      setState(() {
        isSpeaking = false;
      });
    });
    _flutterTts.setErrorHandler((message) {
      setState(() {
        isSpeaking = false;
      });
    });
  }
  @override
  void initState() {

    super.initState();
    initializeTts();
  }

  void speechSettings1() {
    _flutterTts.setLanguage("hi-IN");
    _flutterTts.setPitch(1);
    _flutterTts.setSpeechRate(.9);
  }
  Future speak(String text) async {
    if (text != null && text.isNotEmpty) {
      var result = await _flutterTts.speak(text);
      if (result == 1)
        setState(() {
          isSpeaking = true;
        });
    }
  }

  Future stop() async {
    var result = await _flutterTts.stop();
    if (result == 1)
      setState(() {
        isSpeaking = false;
      });
  }

  @override
  void dispose() {
    _flutterTts.stop();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text(dec),
            IconButton(onPressed: (){isSpeaking ? stop() : speak(dec);}, icon: Icon(Icons.volume_up),)

          ],
        ),
      ),
    );
  }
}