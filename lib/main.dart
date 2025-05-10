import 'package:flutter/material.dart';
import 'package:nafstube/player/video.dart';
import 'package:nafstube/player/bar.dart';
import 'package:nafstube/player/responsive.dart';
import 'package:nafstube/player/sidemenu.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        key: _scaffoldKey,

        drawer: side(),



        body: SafeArea(
          child: Column(
            children: [
              Bar(),
              Expanded(
                child: Row(
                  children: [
                    if (Responsive.isDesktop(context))
                      Expanded(flex: 1, child: side()),

                    Expanded(flex: 5, child: video()),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
