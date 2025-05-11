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
      color: Colors.red,
      child: Obx(() {
        final controller = Get.find<SideMenuController>();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (controller.sideMenuWidth == 100) ...[
              Text("Home"),
              Text("History"),
              Text("Login"),
              Text("Settings"),
            ],
            if (controller.sideMenuWidth == 200) ...[
              Text("Home"),
              Text("Sign Up"),
              Text("Your Channel"),
              Text("Response"),
            ],
          ],
        );
      })
      ,
    ) ;
  }
}
