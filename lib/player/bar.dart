import 'dart:ui';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:responsive_custom_drewder/service/service.dart';
import 'responsive.dart';

class Bar extends StatefulWidget {
  const Bar({super.key});

  @override
  State<Bar> createState() => _BarState();
}

class _BarState extends State<Bar> {

  final langlist controller = Get.put(langlist());
  List<String> lang = [
    "HTML",
    "CSS",
    "JavaScript",
    "SQL",
    "Python",
    "Java",
    "PHP",
    "W3.CSS",
    "C",
    "C++",
    "C#",
    "Bootstrap",
    "React",
    "MySQL",
    "jQuery",
    "Excel",
    "XML",
    "Django",
    "NumPy",
    "Pandas",
    "Node.js",
    "R",
    "TypeScript",
    "Angular",
    "Git",
    "PostgreSQL",
    "MongoDB",
    "ASP.NET",
    "AI",
    "Go",
    "Kotlin",
    "SASS",
    "Vue",
    "Data Structures and Algorithms (DSA)",
    "Generative AI",
    "SciPy",
    "AWS",
    "Cybersecurity",
    "Data Science",
    "Dart" // Adding Dart specifically for your interest
  ];

bool isarray=false;






  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
   Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS88pVvJZYLv-4KMAY4CxgLyk7yoCxcccizmkC6J5Xe17E4Y6O1cHfTstN5CA1tCNXds-w&usqp=CAU',height: 40,width: 40,),
    // Expanded(
    //   child: ExpansionTile(title: Text('Menu'),
    //   children: [
    //     TextButton(onPressed: (){}, child:Text('Turorial') ),
    //     TextButton(onPressed: (){}, child:Text('Cirtificate') ),
    //     TextButton(onPressed: (){}, child:Text('Example') ),
    //     TextButton(onPressed: (){}, child:Text('Cariar') ),
    //   ],),
    // )
InkWell(
  onTap: (){
    setState(() {
      isarray=true;
    });

    showModalBottomSheet(context: context, builder: (context) 
      
      {
        
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  IconButton(onPressed: (){
                    setState(() {
                      isarray=false;
                      Navigator.pop(context);
                    });
                  }, icon: Icon(Icons.exit_to_app))
                ],
              ),
              ListTile(
                leading: Icon(Icons.access_alarm),
                title: Text('Tutorial'),
                onTap: () {
                  // Handle the Tutorial action
                  print("Tapped on Tutorial ");
                  Navigator.pop(context); // Close the bottom sheet
                },
              ),
              ListTile(
                leading: Icon(Icons.school),
                title: Text('Certificate'),
                onTap: () {
                  // Handle the Certificate action
                  print("Tapped on Certificate");
                  Navigator.pop(context); // Close the bottom sheet
                },
              ),
              ListTile(
                leading: Icon(Icons.code),
                title: Text('Example'),
                onTap: () {
                  // Handle the Example action
                  print("Tapped on Example");
                  Navigator.pop(context); // Close the bottom sheet
                },
              ),
              ListTile(
                leading: Icon(Icons.work),
                title: Text('Career'),
                onTap: () {
                  // Handle the Career action
                  print("Tapped on Career");
                  Navigator.pop(context); // Close the bottom sheet
                },
              ),
            ],
          ),
        );
      },
    );
    },
  child: Container(
    child: Row(
      children: [
        Text('Menu'),
        if(isarray==true)
           Icon(Icons.arrow_drop_down),

        if(isarray==false)
          Icon(Icons.arrow_drop_up),

      ],
    ),
  ),
),
Spacer(),
    IconButton(onPressed: (){}, icon: Icon(Icons.account_circle_rounded))


  ],
),
        Container(
          height: 50,
          color: Colors.black,
          child: Row(
            children: [

              if (Responsive.isMobile(context))
                IconButton(
                  icon: Icon(Icons.menu,color: Colors.white,),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                ),


              Expanded(
                child: ScrollConfiguration(
                  behavior: MyCustomScrollBehavior(), // Apply custom behavior to this widget
                  child: ListView.builder(
                
                    scrollDirection: Axis.horizontal,
                    itemCount: lang.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Center(
                          child: InkWell(
                
                            onTap: (){
                
                          controller.putlang(lang[index]);
                
                              Get.snackbar( 'language',lang[index],
                              snackPosition: SnackPosition.BOTTOM
                              );
                            },
                
                            child: Text(
                              lang[index],
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
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
