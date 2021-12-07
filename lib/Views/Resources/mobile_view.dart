
import 'package:aahaarkranti_app/Model/Resources/videoResourcesModel.dart';
import 'package:aahaarkranti_app/Model/Resources/webResourcesModel.dart';
import 'package:aahaarkranti_app/Views/Main_Dashbord.dart/Main_Dashbord.dart';
import 'package:aahaarkranti_app/Views/Resources/video_resources_page.dart';
import 'package:aahaarkranti_app/Views/Resources/web_resources_page.dart';
import 'package:flutter/material.dart';

import 'package:velocity_x/velocity_x.dart';

class MbVideoList extends StatefulWidget {
  MbVideoList({Key key}) : super(key: key);

  @override
  _VideoListState createState() => _VideoListState();
}

class _VideoListState extends State<MbVideoList> {
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
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              "Source Videos".text.black.bold.xl2.make().p8(),
              10.heightBox,
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: list.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    splashColor: Colors.yellow,
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => VdPrivacy(list[index]['videoUrl'].toString())));
                    },
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                          border:
                          Border(bottom: BorderSide(color: Colors.grey))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.network(list[index]["thumbnailUrl"]),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: 200,
                                  child: Wrap(
                                    children: [
                                      Center(
                                        child: Text(
                                          list[index]['name'],
                                          style: TextStyle(fontSize: 15),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Icon(Icons.arrow_right, color: Colors.green),
                        ],
                      ),
                    ).p8(),
                  );
                },
              ),
              20.heightBox,
              "Web Resources".text.black.bold.xl2.make().p8(),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: weblist.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    splashColor: Colors.yellow,
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => WebPrivacy(weblist[index]['webUrl'].toString())));
                    },
                    child: Card(
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          border:
                          Border(bottom: BorderSide(color: Colors.grey)),
                          color: Colors.red,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                              child: Text(
                                weblist[index]['name'],
                                style: TextStyle(fontSize: 15, color: Colors.white),
                              )),
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