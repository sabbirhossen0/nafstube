import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nafstube/player/Controllar/sidecontrollar.dart';

class Sidemenu extends StatefulWidget {
  const Sidemenu({super.key});

  @override
  State<Sidemenu> createState() => _SidemenuState();
}

class _SidemenuState extends State<Sidemenu> {

  final controller = Get.find<SideMenuController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Obx(() {
        final controller = Get.find<SideMenuController>();
        return Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (controller.sideMenuWidth == 100) ...[

                Container(
                  width: 90,
                  child: Center(
                    child: Column(
                      children: [
                        Icon(Icons.home),
                        Text("Home")
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 90,
                  child: Center(
                    child: Column(
                      children: [
                        Icon(Icons.video_library_outlined),
                        Text("Short")
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 90,
                  child: Center(
                    child: Column(
                      children: [
                        Icon(Icons.video_camera_front_outlined),
                        Text("Subscripton")
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 90,
                  child: Center(
                    child: Column(
                      children: [
                        Icon(Icons.account_circle_rounded),
                        Text("You")
                      ],
                    ),
                  ),
                ),


                Container(
                  width: 90,
                  child: Center(
                    child: Column(
                      children: [
                        Icon(Icons.history),
                        Text("History")
                      ],
                    ),
                  ),
                ),





              ],
              if (controller.sideMenuWidth == 200) ...[
                Text("Home"),
                Text("Sign Up"),
                Text("Your Channel"),
                Text("Response"),
              ],
            ],
          ),
        );
      })
      ,
    ) ;
  }
}
