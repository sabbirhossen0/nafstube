import 'dart:ui';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:nafstube/player/responsive.dart';

import 'package:nafstube/player/Controllar/sidecontrollar.dart';
import 'package:nafstube/player/Controllar/searchview.dart';

class Bar extends StatefulWidget {
  const Bar({super.key});

  @override
  State<Bar> createState() => _BarState();
}

class _BarState extends State<Bar> {

  final SideMenuController controller = Get.find();

  final vsearchController searchviews = Get.put(vsearchController());




  final TextEditingController _searchController = TextEditingController();
  bool showSheet = false;
  List<String> searchHistory = [];



  @override
  Widget build(BuildContext context) {


    List<String> filteredHistory = searchHistory
        .where((item) => item.toLowerCase().contains(_searchController.text.toLowerCase()))
        .toList();


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

      InkWell(
        onTap: (){
          searchviews.setQuery(1);


        },
        child: Row(
          children: [
            Image.network('https://scontent.fdac41-1.fna.fbcdn.net/v/t39.30808-6/466403359_578527141341423_3069202312520923209_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=6ee11a&_nc_ohc=AgjrIDjWpiYQ7kNvwHM3HE6&_nc_oc=Adl4d7iG1sHu3fkhYT_5dRg_EmpcHOYugQXtP73I0obKwa6wNUENok0SCupizpTPJqc&_nc_zt=23&_nc_ht=scontent.fdac41-1.fna&_nc_gid=Zn3LFsQy_z8aiWtVYm0oIQ&oh=00_AfI6t-iDBi0pnNTvl26KEdRuWfP_fCAi6p1joBYSv2cXyA&oe=6824FE2C',height: 30,width: 30,),
            Text("NafsTube"),
          ],

        ),
      ),



      Spacer(),




          // Container(
          //   height: 50,
          //   width: 100,
          //   child: TextField(
          //     // controller: _searchController,
          //     decoration: const InputDecoration(
          //
          //       labelText: 'Search for products',
          //       border: OutlineInputBorder(),
          //       prefixIcon: Icon(Icons.search),
          //     ),
          //     onChanged: (query) {
          //       // Trigger search whenever the text changes
          //
          //     },
          //   ),
          // ),



          /// Stack with Search and Suggestions
          Stack(
            children: [
              Container(
                height: 50,
                width: 200,
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    labelText: 'Search your Visson',
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(40))
                    ),


                    // suffixIcon: Icon(Icons.search),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        final query = _searchController.text.trim();
                     if(query.isNotEmpty){searchviews.setQuery(0);}



                        if (query.isNotEmpty) {
                          setState(() {
                            if (!searchHistory.contains(query)) {
                              searchHistory.insert(0, query);
                            }
                            showSheet = false;
                          });

                          // Add your actual search logic here
                          print("Searched for: $query");
                        }
                      },
                      child: const Icon(Icons.search),
                    ),
                  ),
                  onChanged: (query) {
                    setState(() {
                      showSheet = query.isNotEmpty;
                    });
                  },
                  onSubmitted: (query) {
                    if (query.trim().isEmpty) return;
                    setState(() {
                      if (!searchHistory.contains(query)) {
                        searchHistory.insert(0, query);
                      }
                      showSheet = false;
                    });

                    // Add your actual search logic here too
                    print("Submitted search: $query");
                  },
                ),
              ),

              // Suggestion/history sheet
              if (showSheet)
                Positioned(
                  top: 55,
                  child: Container(
                    width: 250,
                    color: Colors.white,
                    child: Column(
                      children: filteredHistory.isEmpty
                          ? [const ListTile(title: Text("No history"))]
                          : filteredHistory.map((entry) {
                        return ListTile(
                          title: Text(entry),
                          leading: const Icon(Icons.history),
                          onTap: () {
                            _searchController.text = entry;
                            setState(() => showSheet = false);

                            // Add your actual search logic here if needed
                            print("Tapped on history: $entry");
                          },
                        );
                      }).toList(),
                    ),
                  ),
                ),
            ],
          ),
SizedBox(height: 8,),
Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTiMLnfL5rQkrCV9cFp1_fXGKe6s_K97UzLuQrlWu_BBQohslxJl_kdeKG5HqT-wEz8L58&usqp=CAU",width: 40,height: 40,),




          Spacer(),
 
          Icon(Icons.more_vert),
          IconButton(onPressed: (){}, icon: Icon(Icons.account_circle_rounded)),



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
