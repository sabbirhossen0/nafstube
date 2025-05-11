import 'package:flutter/material.dart';
import 'package:nafstube/player/video.dart';
import 'package:nafstube/player/bar.dart';
import 'package:nafstube/player/responsive.dart';
import 'package:nafstube/player/draweview.dart';

import 'package:nafstube/player/sidemanu.dart';

//controllar

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

        drawer: drawerview(),



        body: SafeArea(
          child: Column(
            children: [
              Bar(),
              Expanded(
                child: Row(
                  children: [
                    if (Responsive.isDesktop(context))
                      SizedBox(
                           width: 100,
                          child: Sidemenu()),

                    Expanded(child: video()),
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
