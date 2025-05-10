import 'package:flutter/material.dart';
import 'package:get/get.dart';


class side extends StatefulWidget {
  const side({super.key});

  @override
  State<side> createState() => _SideState();
}

class _SideState extends State<side> {
  // Declare the language controller

  // Main topic categories with subcategories


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Drawer(
        child:Container(
          color: Colors.green,
        )
      ),
    );
  }
}

// Dummy GetX Controller for language management

