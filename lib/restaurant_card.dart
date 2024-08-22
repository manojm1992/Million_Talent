import 'package:flutter/material.dart';

class RestaurantCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String ratings;
  final String cuisine;
  final VoidCallback onAdd;  // Ensure this parameter is defined

  RestaurantCard({
    required this.imageUrl,
    required this.name,
    required this.ratings,
    required this.cuisine,
    required this.onAdd,  // Ensure this parameter is included
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         Image.network(
  imageUrl,
  height: 150,
  width: double.infinity,
  fit: BoxFit.cover,
  errorBuilder: (context, error, stackTrace) {
    print('Error loading image: $error'); // Debug log
    return Center(child: Text('Image not available'));
  },
  loadingBuilder: (context, child, progress) {
    if (progress == null) {
      return child;
    } else {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
  },
),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text('Ratings: $ratings', style: TextStyle(color: Colors.grey)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text('Cuisine: $cuisine', style: TextStyle(color: Colors.grey)),
          ),
        
        ],
      ),
    );
  }
}
