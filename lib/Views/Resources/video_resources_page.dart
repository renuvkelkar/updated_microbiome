import 'dart:convert';
import 'dart:io';

import 'package:aahaarkranti_app/Model/Resources/videoResourcesModel.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


class VdPrivacy extends StatefulWidget {
  final String videoUrl;
  VdPrivacy(this.videoUrl);

  @override
  _PrivacyState createState() => _PrivacyState();
}

class _PrivacyState extends State<VdPrivacy> {
  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    // if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }
  @override
  Widget build(BuildContext context) {
    var index;
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.red,
        title: Text("Aahaar Kranti"),
      ),
      body:
      WebView(
        initialUrl:widget.videoUrl,
        // 'https://youtu.be/dCvfDXrfDr8?t=253',
        //  list[1]['videoUrl'].toString(),
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}