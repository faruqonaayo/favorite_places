import 'package:favorite_places/models/place.dart';
import 'package:favorite_places/providers/places_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NewPlaceScreen extends ConsumerStatefulWidget {
  const NewPlaceScreen({super.key});

  @override
  ConsumerState<NewPlaceScreen> createState() => _NewPlaceScreenState();
}

class _NewPlaceScreenState extends ConsumerState<NewPlaceScreen> {
  final _formKey = GlobalKey<FormState>();

  var _enteredName = '';

  @override
  Widget build(BuildContext context) {
    void saveItem() {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
      }

      ref.read(placesProvider.notifier).addNewPlace(Place(title: _enteredName));
      Navigator.pop(context);
    }

    return Scaffold(
      appBar: AppBar(title: Text("Add new Place")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(label: Text("Title")),
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      value.trim().length <= 1) {
                    return "Must be between 1 and 50 characters.";
                  }
                  return null;
                },
                onSaved: (newValue) {
                  setState(() {
                    _enteredName = newValue!;
                  });
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: saveItem,
                icon: Icon(Icons.add),
                label: Text("Add Place"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
