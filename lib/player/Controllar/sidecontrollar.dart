import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SideMenuController extends GetxController {
  var isExpanded = false.obs;

  void toggleMenuWidth() {
    isExpanded.value = !isExpanded.value;
  }

  double get sideMenuWidth => isExpanded.value ? 200 : 100;
}
