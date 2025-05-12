import 'package:favorite_places/screens/new_place_screen.dart';
import 'package:favorite_places/widgets/places_list.dart';
import 'package:flutter/material.dart';

class PlacesScreen extends StatelessWidget {
  const PlacesScreen({super.key});

  void _navigateToNewPlaceScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (ctx) => NewPlaceScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Places"),
        actions: [
          IconButton(
            onPressed: () {
              _navigateToNewPlaceScreen(context);
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: PlacesList(),
    );
  }
}
