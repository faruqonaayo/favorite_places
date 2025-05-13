import 'package:favorite_places/models/place.dart';
import 'package:favorite_places/screens/place_details_screen.dart';
import 'package:flutter/material.dart';

class PlacesList extends StatelessWidget {
  const PlacesList({super.key, required this.places});

  final List<Place> places;

  void _navigateToPlaceDetailsScreen(BuildContext context, Place place) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (ctx) => PlaceDetailsScreen(place)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return places.isEmpty
        ? Center(
          child: Text(
            "No places added yet",
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
        )
        : ListView.builder(
          itemCount: places.length,
          itemBuilder:
              (ctx, index) => ListTile(
                key: ValueKey(places[index].id),
                onTap:
                    () => _navigateToPlaceDetailsScreen(context, places[index]),
                leading: CircleAvatar(
                  radius: 26,
                  backgroundImage: FileImage(places[index].image),
                ),
                title: Text(
                  places[index].title,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ),
        );
  }
}
