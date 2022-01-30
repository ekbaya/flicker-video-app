import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:visibility_detector/visibility_detector.dart';
import './multi_manager/flick_multi_manager.dart';
import './multi_manager/flick_multi_player.dart';
import '../utils/mock_data.dart';

class FeedPlayer extends StatefulWidget {
  FeedPlayer({Key? key}) : super(key: key);

  @override
  _FeedPlayerState createState() => _FeedPlayerState();
}

class _FeedPlayerState extends State<FeedPlayer> {
  List items = mockData['items'];

  late FlickMultiManager flickMultiManager;

  @override
  void initState() {
    super.initState();
    flickMultiManager = FlickMultiManager();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black,
      child: VisibilityDetector(
        key: ObjectKey(flickMultiManager),
        onVisibilityChanged: (visibility) {
          if (visibility.visibleFraction == 0 && this.mounted) {
            flickMultiManager.pause();
          }
        },
        child: Container(
          child: ListView.separated(
            separatorBuilder: (context, int) => Container(
              height: 10,
            ),
            itemCount: items.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.all(2),
                child: Column(
                  children: [
                    SizedBox(
                      height: 500,
                      width: MediaQuery.of(context).size.width,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: FlickMultiPlayer(
                          url: items[index]['trailer_url'],
                          flickMultiManager: flickMultiManager,
                          image: items[index]['image'],
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      color: Colors.black,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Text(
                              "Best makeup transformations 2021",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          ListTile(
                            horizontalTitleGap: 0,
                            leading: Icon(
                              FontAwesomeIcons.heart,
                              color: Colors.white,
                            ),
                            title: Text(
                              "89 Likes",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                            trailing: SizedBox(
                              width: 180,
                              child: ListTile(
                                horizontalTitleGap: 0,
                                leading: Icon(
                                  FontAwesomeIcons.comment,
                                  color: Colors.white,
                                ),
                                title: Text(
                                  "156 Comments",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ),
                              ),
                            ),
                          ),
                          Divider(
                            color: Colors.grey[100],
                            thickness: 0.5,
                            indent: 20,
                            endIndent: 20,
                          ),
                          ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Colors.blue,
                              child: Icon(Icons.person),
                            ),
                            title: Text(
                              "Elias's Hair Salon",
                              style: TextStyle(color: Colors.white),
                            ),
                            subtitle: SizedBox(
                              width: 150,
                              child: Row(
                                children: [
                                  SizedBox(
                                      width: 70,
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.directions_walk_outlined,
                                            color: Colors.white,
                                            size: 20,
                                          ),
                                          Text(
                                            "15min",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12),
                                          )
                                        ],
                                      )),
                                  SizedBox(
                                      width: 70,
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.drive_eta,
                                            color: Colors.white,
                                            size: 20,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            "5min",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12),
                                          )
                                        ],
                                      ))
                                ],
                              ),
                            ),
                            trailing: Container(
                              width: 60,
                              height: 30,
                              decoration: BoxDecoration(
                                color: Colors.purple,
                                borderRadius: BorderRadius.circular(5)
                              ),
                              child: Center(
                                child: Text(
                                  "Book",
                                  style: TextStyle(color: Colors.white, fontSize: 12),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10,),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
