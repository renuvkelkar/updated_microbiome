
import 'package:aahaarkranti_app/Views/Main_Dashbord.dart/Main_Dashbord.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';
import 'dart:ui';

import 'DisclaimerPage.dart';


class WebDrawer extends StatelessWidget {
  @override
  _launchURLApp() async {
    const url = 'https://gistusa.org/aahaarkranti/';
    if (await canLaunch(url)) {
      await launch(url, forceSafariVC: true, forceWebView: true);
    } else {
      throw 'Could not launch $url';
    }
  }
  _launchURLApp1() async {
    const url = 'https://techpowergirls.net/';
    if (await canLaunch(url)) {
      await launch(url, forceSafariVC: true, forceWebView: true);
    } else {
      throw 'Could not launch $url';
    }
  }
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: ListView(
        children: [
          DrawerHeader(
            // decoration: BoxDecoration(color: Colors.redAccent

            // ),
              child: Container(child:
              Center(
                child: Row(
                  children: [
                    Image.asset('assets/images/ninja.png', height: 80, width: 80, fit: BoxFit.fitHeight),
                    // Icon(Icons.face_outlined,color: Colors.white,),
                    15.widthBox,
                    Wrap(children: [Text('Microbiome \n Our Superhero', style: TextStyle(fontSize: 25,fontFamily: ("Google"), color: Colors.black,fontWeight: FontWeight.bold),)]),
                  ],
                ),
              ))),
          ListTile(
            title: Padding(
              padding: const EdgeInsets.only(left:10, right: 10),
              child: InkWell(
                splashColor: Colors.yellow,
                onTap: (){
                  _launchURLApp();
                },
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                      border:Border(bottom: BorderSide(color: Colors.grey.shade800 ))
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.network("https://cdn-icons-png.flaticon.com/512/1150/1150626.png",height: 50,width: 50,fit: BoxFit.cover,),
                          //Icon(Icons.web,color: Colors.redAccent),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                            child: Text('Aahaar Kranti', style: TextStyle(fontSize: 15,fontFamily: ("Google"),fontWeight: FontWeight.bold),),
                          ),
                        ],
                      ),
                      Icon(Icons.arrow_right,color: Colors.redAccent),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // ListTile(
          //   title: Padding(
          //     padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
          //     child: InkWell(
          //       splashColor: Colors.yellow,
          //       onTap: (){
          //         Navigator.push(context, MaterialPageRoute(builder: (_) => DashBord()));
          //       },
          //       child: Container(
          //         height: 60,
          //         decoration: BoxDecoration(
          //             border:Border(bottom: BorderSide(color: Colors.grey.shade800 ))
          //         ),
          //         child: Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //           children: [
          //             Row(
          //               children: [
          //                 Image.network("https://cdn-icons-png.flaticon.com/512/6207/6207649.png",height: 50,width: 50,fit: BoxFit.cover,),
          //                 // Icon(Icons.settings,color:Colors.redAccent),
          //                 Padding(
          //                   padding: const EdgeInsets.all(10.0),
          //                   child: Text('Privacy Page', style: TextStyle(fontSize: 15,fontFamily: ("Google"),fontWeight:FontWeight.bold),),
          //                 ),
          //               ],
          //             ),
          //             Icon(Icons.arrow_right,color: Colors.redAccent),
          //           ],
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          ListTile(
            title: Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
              child: InkWell(
                splashColor: Colors.yellow,

                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_) => Disclaimer()));
                },
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                      border:Border(bottom: BorderSide(color: Colors.grey.shade800 ))
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.network("https://cdn-icons-png.flaticon.com/512/2621/2621796.png",height: 50,width: 50,fit: BoxFit.cover,),
                          // Icon(Icons.business_center_rounded,color: Colors.redAccent),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text('Disclaimer Page', style: TextStyle(fontSize: 15,fontFamily:("Google"),fontWeight:FontWeight.bold),),
                          ),
                        ],
                      ),
                      Icon(Icons.arrow_right,color: Colors.redAccent),
                    ],
                  ),
                ),
              ),
            ),
          ),
          ListTile(
            title: Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
              child: InkWell(
                splashColor: Colors.yellow,
                onTap: (){
                  _launchURLApp1();

                },
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                      border:Border(bottom: BorderSide(color: Colors.grey.shade800 ))
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.network("https://cdn-icons-png.flaticon.com/512/6036/6036806.png",height: 50,width: 50,fit: BoxFit.cover,),
                          // Icon(Icons.logout,color: Colors.redAccent),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text('About Developer', style: TextStyle(fontSize: 15,fontWeight:FontWeight.bold,fontFamily:("Google"),),
                            ),
                          )
                        ],
                      ),
                      Icon(Icons.arrow_right,color: Colors.redAccent),
                    ],
                  ),
                ),
              ),
            ),
          ),


        ],
      ),
    );
  }
}