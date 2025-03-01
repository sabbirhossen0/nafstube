import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:nafstube/player/video_player.dart';
import 'package:nafstube/player/up_video.dart';

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
    final response = await dio.get('http://192.168.0.111:8001/videos/');
    setState(() {
      videos = response.data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("nafstube"),
leading: InkWell(
  onTap: (){
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>UploadPage(),
      ),
    );
  },
    child: Icon(Icons.add)),

      ),
      body: ListView.builder(
        itemCount: videos.length,
        itemBuilder: (context, index) {
          var video = videos[index];
          return ListTile(
            leading: Image.network('${video["thumbnail"]}'),
            title: Text(video["title"]),
            subtitle: Text(video["description"]),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => VideoPlayerPage(video: video),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
