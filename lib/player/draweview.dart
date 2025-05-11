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

          color: Colors.green,
        )
      ),
    );
  }
}

// Dummy GetX Controller for language management

