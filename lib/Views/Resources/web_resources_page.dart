import 'dart:convert';
import 'dart:io';


import 'package:aahaarkranti_app/Model/Resources/webResourcesModel.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


class WebPrivacy extends StatefulWidget {
  final String webUrl;
  WebPrivacy(this.webUrl);
  @override
  _PrivacyState createState() => _PrivacyState();
}

class _PrivacyState extends State<WebPrivacy> {
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
        initialUrl: widget.webUrl,
        // weblist[index]['webUrl'],
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}