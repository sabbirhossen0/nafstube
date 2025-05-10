import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:nafstube/player/video_player.dart';
import 'package:nafstube/player/up_video.dart';
import 'package:nafstube/player/appbar.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      appBar: const CustomAppBar(
        title: 'Custom AppBar',
        showBackButton: true,
      ),



      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                'My Drawer Header',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context); // Close drawer
                // Handle navigation
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                Navigator.pop(context);
                // Handle navigation
              },
            ),
          ],
        ),
      ),







      body: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width/10,
            height: MediaQuery.of(context).size.height,
            color: Colors.red,
          ),


          Spacer(),

          Container(
            width: MediaQuery.of(context).size.width/1.3,
            height: MediaQuery.of(context).size.height,
            color: Colors.green,
          ),


          // ListView.builder(
          //   itemCount: videos.length,
          //   itemBuilder: (context, index) {
          //     var video = videos[index];
          //     return
          //
          //       //   ListTile(
          //       //   leading: Image.network('${video["thumbnail"]}'),
          //       //   title: Text(video["title"]),
          //       //   subtitle: Text(video["description"]),
          //       //   onTap: () {
          //       //     Navigator.push(
          //       //       context,
          //       //       MaterialPageRoute(
          //       //         builder: (context) => VideoPlayerPage(video: video),
          //       //       ),
          //       //     );
          //       //   },
          //       // )
          //
          //
          //       InkWell(
          //         onTap: (){
          //           Navigator.push(
          //             context,
          //             MaterialPageRoute(
          //               builder: (context) => VideoPlayerPage(video: video),
          //             ),
          //           );
          //         },
          //         child: Container(
          //           height:260,
          //           width: MediaQuery.of(context).size.width,
          //           child:Column(
          //             children: [
          //               Container(
          //                 height: 200,
          //                 width: MediaQuery.of(context).size.width,
          //                 decoration: BoxDecoration(
          //                   image: DecorationImage(
          //                     image: NetworkImage('${video["thumbnail"]}'),
          //                     fit: BoxFit.cover, // Optional: Adjust image fitting
          //                   ),
          //                 ),
          //               ),
          //
          //               Row(
          //                 mainAxisAlignment: MainAxisAlignment.start,
          //                 crossAxisAlignment: CrossAxisAlignment.start,
          //                 children: [
          //                   Text(video["title"]),
          //                 ],
          //               )
          //
          //             ],
          //           ),
          //         ),
          //       );
          //   },
          // )

        ],
      ),
    );
  }
}
