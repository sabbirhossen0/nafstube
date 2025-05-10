import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'service/service.dart';

class side extends StatefulWidget {
  const side({super.key});

  @override
  State<side> createState() => _SideState();
}

class _SideState extends State<side> {
  // Declare the language controller
  final langlist control = Get.put(langlist());

  // Main topic categories with subcategories
  final Map<String, List<String>> cTopics = {
    ' HOME': [],
    ' Basics': [
      'Intro',
      'Get Started',
      'Syntax',
      'Output',
      'Comments',
      'Variables',
      'Data Types',
      'Constants',
      'Operators',
      'Booleans',
      'If...Else',
      'Switch',
      'While Loop',
      'For Loop',
      'Break/Continue',
      'Arrays',
      'Strings',
      'User Input',
      'Memory Address',
      'Pointers',
    ],
    ' Functions': [
      'Functions',
      'Function Parameters',
      'Scope',
      'Function Declaration',
      'Recursion',
      'Math Functions',
    ],
    ' Files': [
      'Create Files',
      'Write To Files',
      'Read Files',
    ],
    ' Structures': ['Structures'],
    ' Enums': ['Enums'],
    ' Memory': ['Memory Management'],
    ' Reference': [
      'Keywords',
      '<stdio.h>',
      '<stdlib.h>',
      '<string.h>',
      '<math.h>',
      '<ctype.h>',
    ],
    ' Examples': [
      'Examples',
      'Real-Life Examples',
      'Exercises',
      'Quiz',
      'Compiler',
      'Certificate',
      'update',

    ],
  };

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Drawer(

        child:Container(
          width: MediaQuery.of(context).size.width/6,
          height: MediaQuery.of(context).size.height/1.5,
          color: Colors.green,
        )



        // Obx(() {
        //   return ListView(
        //     children: [
        //       // Display the current language value as the title
        //       ListTile(
        //         title: Text(
        //           '${control.language.value} Tutorial',
        //           style: const TextStyle(
        //             fontWeight: FontWeight.bold,
        //             fontSize: 30,
        //           ),
        //         ),
        //       ),
        //       // Use ExpansionTile for categories with subcategories
        //       ...cTopics.keys.map((category) {
        //         return ExpansionTile(
        //
        //           title: Text(
        //             '${control.language.value}'+category,
        //             style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        //           ),
        //           children: cTopics[category]!.isEmpty
        //               ? [
        //
        //                 Text('${cTopics[category]}')
        //
        //
        //             // ListTile(
        //             //   title: Text('No topics available'),
        //             // ),
        //           ]
        //               : cTopics[category]!.map((topic) {
        //             return ListTile(
        //               title: Text(
        //                 topic,
        //                 style: const TextStyle(fontSize: 12),
        //               ),
        //               onTap: () {
        //                 // Handle subtopic item tap
        //                 print("Tapped on $topic in $category");
        //               },
        //             );
        //           }).toList(),
        //         );
        //       }).toList(),
        //     ],
        //   );
        // }),
      ),
    );
  }
}

// Dummy GetX Controller for language management

