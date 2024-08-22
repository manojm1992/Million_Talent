import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'form_page.dart';
import 'restaurant_card.dart';
import 'search_controller.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final mySearchController searchController = Get.put(mySearchController());
  final List<Map<String, String>> dynamicCards = [];

  // Method to filter dynamic cards based on the search query
  List<Map<String, String>> getFilteredDynamicCards(String query) {
    if (query.isEmpty) {
      return dynamicCards;
    } else {
      return dynamicCards.where((restaurant) {
        return restaurant['name']!.toLowerCase().contains(query.toLowerCase());
      }).toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Restaurant App'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Search for a restaurant',
              ),
              onChanged: (value) {
                searchController.search(value);
                setState(() {}); // Trigger a rebuild to apply filter
              },
            ),
          ),
          Expanded(
            child: Obx(() {
              final searchQuery = searchController.searchQuery.value;
              final filteredNames = searchController.filteredNames;
              final filteredDynamicCards = getFilteredDynamicCards(searchQuery);
              
              return filteredNames.isEmpty && filteredDynamicCards.isEmpty
                  ? Center(child: Text('No restaurants available.'))
                  : ListView(
                      children: [
                        // Display filtered dynamic restaurant cards
                        ...filteredDynamicCards.map((restaurant) {
                          return RestaurantCard(
                            imageUrl: restaurant['imageUrl']!,
                            name: restaurant['name']!,
                            ratings: restaurant['ratings']!,
                            cuisine: restaurant['cuisine']!,
                            onAdd: () {
                              // This onAdd is no longer used but can remain if needed
                            },
                          );
                        }).toList(),
                        // Display list of search results
                        ...filteredNames.map((name) {
                          return ListTile(title: Text(name));
                        }).toList(),
                      ],
                    );
            }),
          ),
          // OutlinedButton at the bottom of the screen
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: OutlinedButton(
              onPressed: () {
                Get.to(FormPage())?.then((result) {
                  if (result != null) {
                    setState(() {
                      dynamicCards.add(result as Map<String, String>);
                    });
                  }
                });
              },
              child: Text('Add Restaurant'),
            ),
          ),
        ],
      ),
    );
  }
}
