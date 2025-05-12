import 'package:favorite_places/models/place.dart';
import 'package:favorite_places/providers/places_provider.dart';
import 'package:favorite_places/screens/place_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlacesList extends ConsumerStatefulWidget {
  const PlacesList({super.key});

  @override
  ConsumerState<PlacesList> createState() => _PlacesListState();
}

class _PlacesListState extends ConsumerState<PlacesList> {
  void _navigateToPlaceDetailsScreen(BuildContext context, Place place) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (ctx) => PlaceDetailsScreen(place)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final places = ref.watch(placesProvider);
    return places.isEmpty
        ? Center(
          child: Text(
            "No places added yet",
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
        )
        : ListView.builder(
          itemCount: places.length,
          itemBuilder:
              (ctx, index) => InkWell(
                onTap:
                    () => _navigateToPlaceDetailsScreen(context, places[index]),
                child: ListTile(title: Text(places[index].title)),
              ),
        );
  }
}
