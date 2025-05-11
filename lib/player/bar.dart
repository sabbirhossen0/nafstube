import 'dart:ui';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:nafstube/player/responsive.dart';

import 'package:nafstube/player/Controllar/sidecontrollar.dart';


class Bar extends StatefulWidget {
  const Bar({super.key});

  @override
  State<Bar> createState() => _BarState();
}

class _BarState extends State<Bar> {

  final SideMenuController controller = Get.find();


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Column(
        children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
      SizedBox(width: 25,),
      if (Responsive.isMobile(context))
        IconButton(
          icon: Icon(Icons.menu,color: Colors.black,),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),

      // if (Responsive.isDesktop(context))
      // IconButton(
      //   icon: Icon(Icons.menu,color: Colors.black,),
      //   onPressed: () {
      //     Scaffold.of(context).openDrawer();
      //   },
      // ),
        if (Responsive.isDesktop(context))
          IconButton(icon: Icon(Icons.menu, color: Colors.black),
          onPressed: () {
            controller.toggleMenuWidth(); // Toggle between 100 and 200
          },
        ),
      SizedBox(width: 20,),

         Image.network('https://scontent.fdac41-1.fna.fbcdn.net/v/t39.30808-6/466403359_578527141341423_3069202312520923209_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=6ee11a&_nc_ohc=AgjrIDjWpiYQ7kNvwHM3HE6&_nc_oc=Adl4d7iG1sHu3fkhYT_5dRg_EmpcHOYugQXtP73I0obKwa6wNUENok0SCupizpTPJqc&_nc_zt=23&_nc_ht=scontent.fdac41-1.fna&_nc_gid=Zn3LFsQy_z8aiWtVYm0oIQ&oh=00_AfI6t-iDBi0pnNTvl26KEdRuWfP_fCAi6p1joBYSv2cXyA&oe=6824FE2C',height: 30,width: 30,),
      Text("NafsTube"),
      Spacer(),
      IconButton(onPressed: (){}, icon: Icon(Icons.account_circle_rounded))


        ],
      ),
        ],
      ),
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse, // Enable mouse drag scrolling
  };
}
