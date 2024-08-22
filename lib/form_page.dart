import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormPage extends StatelessWidget {
  final TextEditingController imageController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ratingsController = TextEditingController();
  final TextEditingController cuisineController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Restaurant'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: imageController,
              decoration: InputDecoration(labelText: 'Image URL'),
            ),
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Restaurant Name'),
            ),
            TextField(
              controller: ratingsController,
              decoration: InputDecoration(labelText: 'Ratings'),
            ),
            TextField(
              controller: cuisineController,
              decoration: InputDecoration(labelText: 'Cuisine'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Validate the input
                if (imageController.text.isNotEmpty &&
                    nameController.text.isNotEmpty &&
                    ratingsController.text.isNotEmpty &&
                    cuisineController.text.isNotEmpty) {
                  
                  // Create a new restaurant object
                  final newRestaurant = {
                    'imageUrl': imageController.text,
                    'name': nameController.text,
                    'ratings': ratingsController.text,
                    'cuisine': cuisineController.text,
                  };
                  
                  // Return the new restaurant data to the previous page
                  Get.back(result: newRestaurant);
                } else {
                  // Show an error message if any field is empty
                  Get.snackbar('Error', 'Please fill out all fields');
                }
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
