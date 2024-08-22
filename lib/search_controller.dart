import 'package:get/get.dart';

class mySearchController extends GetxController {
  final RxList<String> names = ['Pizza Place', 'Burger Joint', 'Sushi Spot'].obs; // Sample data
  final RxList<String> filteredNames = <String>[].obs;
  final RxString searchQuery = ''.obs; // Observable search query

  @override
  void onInit() {
    super.onInit();
    filteredNames.addAll(names);
  }

  void search(String query) {
    searchQuery.value = query; // Update search query
    if (query.isEmpty) {
      filteredNames.value = names;
    } else {
      filteredNames.value = names.where((name) => name.toLowerCase().startsWith(query.toLowerCase())).toList();
    }
  }
}
