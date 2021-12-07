

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


class Privacy extends StatefulWidget {
  @override
  _PrivacyState createState() => _PrivacyState();
}

class _PrivacyState extends State<Privacy> {
  @override
  bool isloading = true;
  void initState() {
    super.initState();
    isloading = false;
    // Enable hybrid composition.
    // if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.red,
        title: Text("Aahaar Kranti"),
      ),
      body:isloading?CircularProgressIndicator():
      WebView(
        initialUrl: "https://gistusa.org/aahaarkranti/",
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}