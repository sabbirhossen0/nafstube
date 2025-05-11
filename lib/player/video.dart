import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:nafstube/player/video_player.dart';
import 'package:nafstube/player/up_video.dart';
import 'package:nafstube/player/appbar.dart';


class video extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<video> {
  List videos = [];
  final dio = Dio();

  @override
  void initState() {
    super.initState();
    fetchVideos();
  }

  Future<void> fetchVideos() async {
    final response = await dio.get('http://127.0.0.1:8001/videos/');
    setState((){
      videos = response.data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: ListView.builder(
          itemCount: videos.length,
          itemBuilder: (context, index) {
            var video = videos[index];
            return

              //   ListTile(
              //   leading: Image.network('${video["thumbnail"]}'),
              //   title: Text(video["title"]),
              //   subtitle: Text(video["description"]),
              //   onTap: () {
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //         builder: (context) => VideoPlayerPage(video: video),
              //       ),
              //     );
              //   },
              // )


              InkWell(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VideoPlayerPage(video: video),
                    ),
                  );
                },
                child: Container(
                  height:260,
                  width: MediaQuery.of(context).size.width,
                  child:Column(
                    children: [
                      Container(
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage('${video["thumbnail"]}'),
                            fit: BoxFit.cover, // Optional: Adjust image fitting
                          ),
                        ),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(video["title"]),
                        ],
                      )

                    ],
                  ),
                ),
              );
          },
        ),
      ),
    );
  }
}
