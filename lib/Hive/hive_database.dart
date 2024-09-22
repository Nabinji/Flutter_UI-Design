import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveDatabaseFlutter extends StatefulWidget {
  const HiveDatabaseFlutter({super.key});

  @override
  _HiveDatabaseFlutterState createState() => _HiveDatabaseFlutterState();
}

class _HiveDatabaseFlutterState extends State<HiveDatabaseFlutter> {
  var peopleBox = Hive.box("MyBox");
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  void _addOrUpdatePerson({String? key}) {
    if (key != null) {
      final person = peopleBox.get(key);
      if (person != null) {
        _nameController.text = person['name'] ?? '';
        _ageController.text = person['age']?.toString() ?? '';
      }
    } else {
      _nameController.clear();
      _ageController.clear();
    }

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 16,
            right: 16,
            top: 16,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Enter name'),
              ),
              TextField(
                controller: _ageController,
                decoration: const InputDecoration(labelText: 'Enter age'),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  final name = _nameController.text;
                  final age = int.tryParse(_ageController.text);

                  if (name.isEmpty || age == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please enter valid name and age'),
                      ),
                    );
                    return;
                  }

                  if (key == null) {
                    // Add new entry
                    final newKey =
                        DateTime.now().millisecondsSinceEpoch.toString();
                    peopleBox.put(newKey, {'name': name, 'age': age});
                  } else {
                    // Update existing entry
                    peopleBox.put(key, {'name': name, 'age': age});
                  }

                  Navigator.pop(context);
                },
                child: Text(key == null ? 'Add' : 'Update'),
              ),
              const SizedBox(height: 30),
            ],
          ),
        );
      },
    );
  }

  void _deletePerson(String key) {
    peopleBox.delete(key);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        title: const Text('Hive CRUD Example'),
        backgroundColor: Colors.blue[100],
      ),
      body: ValueListenableBuilder(
        valueListenable: peopleBox.listenable(),
        builder: (context, box, widget) {
          if (box.isEmpty) {
            return const Center(child: Text('No items added yet.'));
          }

          return ListView.builder(
            itemCount: box.length,
            itemBuilder: (context, index) {
              final key = box.keyAt(index).toString();
              final person = box.get(key);
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Material(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  elevation: 2,
                  child: ListTile(
                    title: Text(person?['name'] ?? 'Unknown'),
                    subtitle: Text('Age: ${person?['age'] ?? 'N/A'}'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () => _addOrUpdatePerson(key: key),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () => _deletePerson(key),
                        ),
                      ],
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
        onPressed: () => _addOrUpdatePerson(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
