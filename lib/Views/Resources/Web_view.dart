
import 'package:aahaarkranti_app/Model/Resources/videoResourcesModel.dart';
import 'package:aahaarkranti_app/Model/Resources/webResourcesModel.dart';
import 'package:aahaarkranti_app/Views/Main_Dashbord.dart/Main_Dashbord.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:velocity_x/velocity_x.dart';
class WebVideoList extends StatefulWidget {
  WebVideoList({Key key}) : super(key: key);

  @override
  _VideoListState createState() => _VideoListState();
}

class _VideoListState extends State<WebVideoList> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Resources"),
          actions: [
            IconButton(onPressed: (){
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => DashBord()));
            }, icon: Icon(Icons.home))
          ],
        ),
        body:

        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              "Source Videos".text.black.bold.xl2.make().p8(),
              10.heightBox,
              ListView.builder(
                shrinkWrap: true,
                itemCount: list.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    splashColor: Colors.yellow,
                    onTap: () async{


                      var url = list[index]['videoUrl'];
                      if (await canLaunch(url)) {
                        await launch(url, forceSafariVC: true, forceWebView: true);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                          border:Border(bottom: BorderSide(color: Colors.grey ))
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.network(list[index]["thumbnailUrl"]),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(list[index]['name'], style: TextStyle(fontSize: 15),),
                              ),
                            ],
                          ),
                          Icon(Icons.arrow_right,color: Colors.green),
                        ],
                      ),
                    ).p8(),
                  );

                },
              ),
              20.heightBox,
              "Web Resources".text.black.bold.xl2.make().p8(),
              ListView.builder(
                shrinkWrap: true,
                itemCount: weblist.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    splashColor: Colors.yellow,
                    onTap: () async{


                      var url = weblist[index]['webUrl'];
                      if (await canLaunch(url)) {
                        await launch(url, forceSafariVC: true, forceWebView: true);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                    child: Card(
                      child: Container(
                        height: 50,

                        decoration: BoxDecoration(
                          border:Border(bottom: BorderSide(color: Colors.grey )

                          ),
                          color: Colors.red,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:Center(child: Text(weblist[index]['name'], style: TextStyle(fontSize: 15,color: Colors.white),)),
                        ),
                      ).p8(),
                    ),
                  );

                },
              ),
            ],
          ),
        ));



  }
}