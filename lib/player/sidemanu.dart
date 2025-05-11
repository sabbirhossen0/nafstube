import 'package:flutter/material.dart';


class Sidemenu extends StatefulWidget {
  const Sidemenu({super.key});

  @override
  State<Sidemenu> createState() => _SidemenuState();
}

class _SidemenuState extends State<Sidemenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Column(

        children: [

          Text("home "),
          Text("history"),
          Text("Login "),
          Text("Login "),

        ],

      ),
    ) ;
  }
}
