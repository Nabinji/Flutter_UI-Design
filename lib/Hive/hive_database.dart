import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveDatabaseFlutter extends StatefulWidget {
  const HiveDatabaseFlutter({super.key});

  @override
  State<HiveDatabaseFlutter> createState() => _HiveDatabaseFlutterState();
}

class _HiveDatabaseFlutterState extends State<HiveDatabaseFlutter> {
  var peopleBox = Hive.box("Box");
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  @override
  void dispose() {
    _ageController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  // function for add or update
  void addOrUpdatePerson({String? key}) {
    // If key is provided, it means we are updating an existing record
    if (key != null) {
      final person = peopleBox.get(key); // Fetch existing data from Hive
      if (person != null) {
        _nameController.text = person['name'] ?? ''; // Pre-fill the name input
        _ageController.text =
            person['age']?.toString() ?? ''; // Pre-fill the age input
      }
    } else {
      // If key is null, it's a new entry, so we clear the input fields
      _nameController.clear();
      _ageController.clear();
    }

    // Show a modal bottom sheet with input fields for adding/updating the person
    showModalBottomSheet(
      context: context,
      isScrollControlled:
          true, // Allows the bottom sheet to resize when the keyboard opens
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context)
                .viewInsets
                .bottom, // Adjust for the keyboard
            left: 16,
            right: 16,
            top: 16,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min, // Make the column size dynamic
            children: [
              // Text field for entering the name
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Enter name'),
              ),
              // Text field for entering the age
              TextField(
                controller: _ageController,
                decoration: const InputDecoration(labelText: 'Enter age'),
                keyboardType: TextInputType.number, // Set input type to number
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                // Logic to add or update a person when the button is pressed
                onPressed: () {
                  final name = _nameController.text; // Get name input
                  final age = int.tryParse(
                      _ageController.text); // Get age input and parse it

                  // Validate if name or age is not empty/null
                  if (name.isEmpty || age == null) {
                    // Show a snack bar if the input is invalid
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please enter valid name and age'),
                      ),
                    );
                    return;
                  }

                  if (key == null) {
                    // If key is null, it's a new entry
                    final newKey = DateTime.now()
                        .millisecondsSinceEpoch
                        .toString(); // Unique key based on timestamp
                    peopleBox.put(newKey, {
                      'name': name,
                      'age': age
                    }); // Add new person to the box
                  } else {
                    // If key exists, update the existing entry
                    peopleBox.put(key,
                        {'name': name, 'age': age}); // Update person in the box
                  }
                  // Close the modal sheet after adding/updating
                  Navigator.pop(context);
                },
                child: Text(key == null
                    ? 'Add'
                    : 'Update'), // Button text changes based on action
              ),
              const SizedBox(height: 30),
            ],
          ),
        );
      },
    );
  }

  // for delete operation
  void deleteOperation(String key) {
    peopleBox.delete(key);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        title: const Text("Flutter Hive Database"),
        backgroundColor: Colors.blue[100],
      ),
      body: ValueListenableBuilder(
        valueListenable: peopleBox.listenable(),
        builder: (context, box, widget) {
          if (box.isEmpty) {
            return const Center(
              child: Text("No items added yet."),
            );
          }
          return ListView.builder(
            itemCount: box.length,
            itemBuilder: (context, index) {
              final key = box.keyAt(index).toString();
              final items = box.get(key);
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Material(
                  color: Colors.white,
                  elevation: 2,
                  borderRadius: BorderRadius.circular(10),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: ListTile(
                      title: Text(items?["name"] ?? "Unknown"),
                      subtitle: Text("Age: ${items?["age"] ?? "Unknown"}"),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () => addOrUpdatePerson(key: key),
                            icon: const Icon(
                              Icons.edit,
                            ),
                          ),
                          IconButton(
                            onPressed: () =>deleteOperation(key),
                            icon: const Icon(
                              Icons.delete,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        onPressed: () => addOrUpdatePerson(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
