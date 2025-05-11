import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nafstube/player/responsive.dart';


class drawerview extends StatefulWidget {
  const drawerview({super.key});

  @override
  State<drawerview> createState() => _SideState();
}

class _SideState extends State<drawerview> {
  // Declare the language controller

  // Main topic categories with subcategories


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0),
      child:  Drawer(
        child:Container(
          child: Column(

            children: [

              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.menu,color: Colors.black,),
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                    ),

                    SizedBox(width: 40,),

                    Image.network('https://scontent.fdac41-1.fna.fbcdn.net/v/t39.30808-6/466403359_578527141341423_3069202312520923209_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=6ee11a&_nc_ohc=AgjrIDjWpiYQ7kNvwHM3HE6&_nc_oc=Adl4d7iG1sHu3fkhYT_5dRg_EmpcHOYugQXtP73I0obKwa6wNUENok0SCupizpTPJqc&_nc_zt=23&_nc_ht=scontent.fdac41-1.fna&_nc_gid=Zn3LFsQy_z8aiWtVYm0oIQ&oh=00_AfI6t-iDBi0pnNTvl26KEdRuWfP_fCAi6p1joBYSv2cXyA&oe=6824FE2C',height: 40,width: 40,),
                    Text("NafsTube"),

                  ],
                ),
              )




            ],
          ),
        )
      ),
    );
  }
}

// Dummy GetX Controller for language management

