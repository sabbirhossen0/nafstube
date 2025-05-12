import 'package:get/get.dart';

class SearchController extends GetxController {
  var searchQuery = ''.obs; // Reactive variable

  // Method to set the value
  void setQuery(String value) {
    searchQuery.value = value;
  }

  // Method to get the value (optional, can just use .value)
  String get getQuery => searchQuery.value;
}
