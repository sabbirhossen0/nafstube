import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:dio/dio.dart';

import 'package:nafstube/player/responsive.dart';
class VideoPlayerPage extends StatefulWidget {
  final Map video;

  VideoPlayerPage({required this.video});

  @override
  _VideoPlayerPageState createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  late VideoPlayerController _controller;
  bool _isError = false;

  @override
  void initState() {
    super.initState();
    fetchVideos();


    String videoUrl = widget.video["video_file"];
    print("Video URL: $videoUrl"); // Debugging

    _controller = VideoPlayerController.network(videoUrl)
      ..initialize().then((_) {
        setState(() {});
      }).catchError((error) {
        print("Video initialization failed: $error");
        setState(() {
          _isError = true;
        });
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }



  List videos = [];
  final dio = Dio();

  Future<void> fetchVideos() async {
    final response = await dio.get('http://127.0.0.1:8001/videos/');
    setState((){
      videos = response.data;
    });
  }











  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.video["title"])),
      body: SingleChildScrollView(
        child: Column(
          children: [

            if (Responsive.isDesktop(context))
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width/1.50,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Column(
                        children: [
                          if (_isError)
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Text(
                                "Failed to load vid. Please check the vid URL.",
                                style: TextStyle(color: Colors.red, fontSize: 16),
                              ),
                            )
                          else if (!_controller.value.isInitialized)
                            Center(child: CircularProgressIndicator())
                          else
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                Center(
                                  child: Container(
                                    width: MediaQuery.of(context).size.width/2,
                                    height: MediaQuery.of(context).size.height/2,
                                    child: AspectRatio(
                                      // aspectRatio: _controller.value.aspectRatio,
                                      aspectRatio: 16/9,
                                      child: VideoPlayer(_controller),
                                    ),
                                  ),
                                ),
                                // Play/Pause Button
                                Positioned(
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _controller.value.isPlaying
                                            ? _controller.pause()
                                            : _controller.play();
                                      });
                                    },
                                    child: CircleAvatar(
                                      backgroundColor: Colors.black54,
                                      radius: 30,
                                      child: Icon(
                                        _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                                        color: Colors.white,
                                        size: 40,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ListTile(
                            leading: Icon(Icons.person),
                            title: Text("Channel Name"),
                            trailing: ElevatedButton(
                              onPressed: () {},
                              child: Text("Subscribe"),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(widget.video["description"]),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    // width:MediaQuery.of(context).size.width/1.33,
                    height: MediaQuery.of(context).size.height,
                    child: GridView.builder(
                      padding: const EdgeInsets.all(8.0),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 1.3,
                      ),
                      itemCount: videos.length,
                      itemBuilder: (context, index) {
                        var video = videos[index];
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => VideoPlayerPage(video: video),
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.grey[200],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 130,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
                                    image: DecorationImage(
                                      image: NetworkImage('${video["thumbnail"]}'),
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    video["title"],
                                    style: const TextStyle(fontWeight: FontWeight.bold),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                )



              ],
            ),

            if(Responsive.isMobile(context))
              Column(
                children: [
                  Container(
                    // width: MediaQuery.of(context).size.width/1.50,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Column(
                          children: [
                            if (_isError)
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Text(
                                  "Failed to load vid. Please check the vid URL.",
                                  style: TextStyle(color: Colors.red, fontSize: 16),
                                ),
                              )
                            else if (!_controller.value.isInitialized)
                              Center(child: CircularProgressIndicator())
                            else
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  Center(
                                    child: Container(
                                      width: MediaQuery.of(context).size.width/2,
                                      height: MediaQuery.of(context).size.height/2,
                                      child: AspectRatio(
                                        // aspectRatio: _controller.value.aspectRatio,
                                        aspectRatio: 16/9,
                                        child: VideoPlayer(_controller),
                                      ),
                                    ),
                                  ),
                                  // Play/Pause Button
                                  Positioned(
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _controller.value.isPlaying
                                              ? _controller.pause()
                                              : _controller.play();
                                        });
                                      },
                                      child: CircleAvatar(
                                        backgroundColor: Colors.black54,
                                        radius: 30,
                                        child: Icon(
                                          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                                          color: Colors.white,
                                          size: 40,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ListTile(
                              leading: Icon(Icons.person),
                              title: Text("Channel Name"),
                              trailing: ElevatedButton(
                                onPressed: () {},
                                child: Text("Subscribe"),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Text(widget.video["description"]),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // width:MediaQuery.of(context).size.width/1.33,
                    height: MediaQuery.of(context).size.height,
                    child: GridView.builder(
                      padding: const EdgeInsets.all(8.0),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 1.3,
                      ),
                      itemCount: videos.length,
                      itemBuilder: (context, index) {
                        var video = videos[index];
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => VideoPlayerPage(video: video),
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.grey[200],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 130,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
                                    image: DecorationImage(
                                      image: NetworkImage('${video["thumbnail"]}'),
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    video["title"],
                                    style: const TextStyle(fontWeight: FontWeight.bold),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  )



                ],
              ),


          ],
        ),
      ),
    );
  }

}
