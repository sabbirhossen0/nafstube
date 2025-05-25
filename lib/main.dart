import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nafstube/player/video.dart';
import 'package:nafstube/player/bar.dart';
import 'package:nafstube/player/responsive.dart';
import 'package:nafstube/player/draweview.dart';
import 'package:nafstube/player/sidemanu.dart';
import 'package:nafstube/player/search_video.dart';

//controllar

import 'package:nafstube/player/Controllar/sidecontrollar.dart';
import 'package:nafstube/player/Controllar/searchview.dart';

void main() {
  Get.put(SideMenuController());
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();



  int _selectedIndex = 0;
  late List<Widget> _pages = [
    searchvideo(),
    video()
  ];





  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
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
                      Obx(() {
                        final controller = Get.find<SideMenuController>();
                        return SizedBox(
                          width: controller.sideMenuWidth, // 100 or 200
                          child: Sidemenu(),
                        );
                      }),

                    Expanded(child:Obx((){
                      final searchController = Get.find<vsearchController>();
                      return _pages[searchController.getpage];
                    }) ),
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
