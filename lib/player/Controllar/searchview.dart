import 'package:get/get.dart';

class vsearchController extends GetxController {
  var  searchQuery = 0.obs; // Reactive variable

  // Method to set the value
  void setQuery(int value) {
    searchQuery.value = value ;
  }

  // Method to get the value (optional, can just use .value)
  int get getpage => searchQuery.value;
}
