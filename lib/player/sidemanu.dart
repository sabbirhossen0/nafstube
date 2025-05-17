import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nafstube/player/Controllar/sidecontrollar.dart';

import 'package:nafstube/player/Controllar/searchview.dart';

class Sidemenu extends StatefulWidget {
  const Sidemenu({super.key});

  @override
  State<Sidemenu> createState() => _SidemenuState();
}

class _SidemenuState extends State<Sidemenu> {

  final controller = Get.find<SideMenuController>();

  final vsearchController searchviews = Get.put(vsearchController());
//hello

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

                  InkWell(
                    onTap: (){
                      searchviews.setQuery(1);
                    },
                    child: Container(
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
   Container(
     height: 550,
     child: SingleChildScrollView(
       child: Column(
         children: [
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
                       fontSize: 14
                   ),),

                   SizedBox(height: 10,),
                   Container(
                     width: 100,
                     height: 35,
                     decoration: BoxDecoration(
                         color: Colors.blue,
                         borderRadius: BorderRadius.circular(35),
                         border: Border.all(color: Colors.black)
                     ),

                     child: Center(
                       child: Row(
                         children: [
                           Icon(Icons.account_circle_rounded),
                           SizedBox(width: 5,),
                           Text("Sign in")
                         ],
                       ),
                     ) ,
                   )



                 ],
               ),
             ),
           ),
           SizedBox(height: 20,),
           Container(
             height: 2,
             width: double.infinity,
             color: Colors.black12, // or any color you want
           ),


           Text("Explore",style: TextStyle(
               fontWeight: FontWeight.bold,
               fontSize: 18
           ),),


           Padding(
             padding: const EdgeInsets.only(left: 20.0),
             child: Container(
               child: Row(

                 children: [
                   Icon(Icons.trending_up,size: 32,),
                   SizedBox(width: 5,),
                   Text("Trending")
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
                   Icon(Icons.music_note,size: 32,),
                   SizedBox(width: 5,),
                   Text("Music")
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
                   Icon(Icons.sports_esports,size: 32,),
                   SizedBox(width: 5,),
                   Text("Gaming")
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
                   Icon(Icons.sports_bar_sharp,size: 32,),
                   SizedBox(width: 5,),
                   Text("Sport")
                 ],
               ),
             ),
           ),
           SizedBox(height: 20,),



           Container(
             height: 2,
             width: double.infinity,
             color: Colors.black12, // or any color you want
           ),

           SizedBox(height: 15,),
           Text("More from Nafstube",style: TextStyle(
               fontWeight: FontWeight.bold,
               fontSize: 18
           ),),


           Padding(
             padding: const EdgeInsets.only(left: 20.0),
             child: Container(
               child: Row(

                 children: [
                   Icon(Icons.music_video,size: 32,),
                   SizedBox(width: 5,),
                   Text("Nafstube Music")
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
                   Icon(Icons.boy,size: 32,),
                   SizedBox(width: 5,),
                   Text("Nafstube kids")
                 ],
               ),
             ),
           ),
           SizedBox(height: 20,),

           Container(
             height: 2,
             width: double.infinity,
             color: Colors.black12, // or any color you want
           ),


           SizedBox(height: 15,),

           Padding(
             padding: const EdgeInsets.only(left: 20.0),
             child: Container(
               child: Row(

                 children: [
                   Icon(Icons.report_problem,size: 32,),
                   SizedBox(width: 5,),
                   Text("Setting")
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
                   Icon(Icons.help_outline,size: 32,),
                   SizedBox(width: 5,),
                   Text("Help")
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
                   Icon(Icons.feedback_outlined,size: 32,),
                   SizedBox(width: 5,),
                   Text("Send Feedback")
                 ],
               ),
             ),
           ),
           SizedBox(height: 20,),
           Container(
             height: 2,
             width: double.infinity,
             color: Colors.black12, // or any color you want
           ),

           SizedBox(height: 15,),

           Text("Copyright 2025 Peart Soft llc")



         ],
       ),
     ),
   )


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
