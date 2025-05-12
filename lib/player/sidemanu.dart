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
    return Padding(
      padding: const EdgeInsets.only(top: 23.0),
      child: Container(
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

                  SizedBox(height: 20,),


                  Container(
                    width: 90,
                    child: Center(
                      child: Column(
                        children: [
                          Icon(Icons.video_library_outlined),
                          Text("Qasir")
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 20,),


                  Container(
                    width: 90,
                    child: Center(
                      child: Column(
                        children: [
                          Icon(Icons.video_camera_front_outlined),
                          Text("Subscription")
                        ],
                      ),
                    ),
                  ),


                  SizedBox(height: 20,),

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

                  SizedBox(height: 20,),
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
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Container(
                      child: Row(

                        children: [
                          Icon(Icons.home,size: 32,),
                          SizedBox(width: 5,),
                          Text("Home")
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Container(
                      child: Row(

                        children: [
                          // Icon(Icons.home),
                          Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTK1hIUveugGmU1IKIhteLlbJAJqqEFjkkKNe05uGRvUJpbiw3kv9VysYMZ1ypnNS5YDho&usqp=CAU",height: 32,width: 32,),
                          SizedBox(width: 5,),
                          Text("Qasir")
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),

                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Container(
                      child: Row(

                        children: [
                          Icon(Icons.video_camera_front_outlined,size: 32,),
                          SizedBox(width: 5,),
                          Text("Subscription")
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),



                  //spacer here
                  Container(
                    height: 2,
                    width: double.infinity,
                    color: Colors.black12, // or any color you want
                  ),


                  Padding(
                    padding: const EdgeInsets.only(left: 20.0,top: 10),
                    child: Container(
                      child: Row(

                        children: [
                          Icon(Icons.account_circle_rounded,size: 32,),
                          SizedBox(width: 5,),
                          Text("You")
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),


                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Container(
                      child: Row(

                        children: [
                          Icon(Icons.history,size: 32,),
                          SizedBox(width: 5,),
                          Text("History")
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),


                  //spacer
                  Container(
                          height: 2,
                          width: double.infinity,
                          color: Colors.black12, // or any color you want
                        ),


                  Padding(
                    padding: const EdgeInsets.only(left: 20.0,top: 15),
                    child: Container(



                      child: Column(
                        children: [
                          Text("Sign in to like videos,\ncomment, and subscribe.",style: TextStyle(
                            fontSize: 16
                          ),),
                         Container(

                           decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(30),
                               border: Border.all(color: Colors.black)
                           ),

                           child: Row(
                             children: [
                               Icon(Icons.account_circle_rounded),
                               SizedBox(width: 5,),
                               Text("Sign in")
                             ],
                           ) ,
                         )



                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),

                ],
              ],
            ),
          );
        })
        ,
      ),
    ) ;
  }
}
