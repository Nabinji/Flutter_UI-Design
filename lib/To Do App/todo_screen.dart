import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hive/hive.dart';
import 'hive_db.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  // Hive box for storing the todo list
  final myBox = Hive.box('todos');
  // Instance of the TodoApp class that handles data operations
  TodoApp db = TodoApp();
  // TextEditingController to manage the input field for adding tasks
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Check if the Hive box has any existing tasks, if not print "empty"
    if (myBox.get("TODOLIST") == null) {
      print("empty");
    } else {
      // Load existing tasks from the Hive database
      db.loadData();
    }
  }

  // Function to handle checkbox state changes (mark tasks as complete/incomplete)
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      // Toggle the completion status of the selected task
      db.todoList[index][1] = !db.todoList[index][1];
    });
    // Update the Hive database with the new state of the todo list
    db.updateData();
  }

  // Function to save a new task to the list
  void saveTask() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        // Add a new task with the user input and set it as incomplete
        db.todoList.add([_controller.text, false]);
        // Clear the input field after saving
        _controller.clear();
      });
      // Close the dialog after saving the task
      Navigator.of(context).pop();
      // Update the Hive database with the new task
      db.updateData();
    }
  }

  // Function to create a dialog for adding a new task
  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.blue,
        content: SizedBox(
          height: 120,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // TextField for inputting a new task
              TextField(
                controller: _controller,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                  hintText: "Add a new task",
                ),
              ),
              // Row with Save and Cancel buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Save button to add the task
                  MaterialButton(
                    onPressed: saveTask,
                    color: Colors.white,
                    child: const Text("Save"),
                  ),
                  const SizedBox(width: 8),
                  // Cancel button to close the dialog without saving
                  MaterialButton(
                    onPressed: () => Navigator.of(context).pop(),
                    color: Colors.white,
                    child: const Text("Cancel"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Flutter To Do'),
        elevation: 0,
      ),
      // If the todo list is empty, show a message to add tasks
      body: db.todoList.isEmpty
          ? const Center(child: Text("No items added yet, Please add a task."))
          // Otherwise, display the tasks using ListView.builder
          : ListView.builder(
              itemCount: db.todoList.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
                // Slidable widget for swipe-to-delete functionality
                child: Slidable(
                  endActionPane: ActionPane(
                    motion: const StretchMotion(),
                    children: [
                      // Slidable action to delete the task
                      SlidableAction(
                        onPressed: (context) {
                          setState(() {
                            // Remove the task from the list
                            db.todoList.removeAt(index);
                          });
                          // Update the Hive database after deletion
                          db.updateData();
                        },
                        icon: Icons.delete,
                        backgroundColor: Colors.red.shade300,
                        borderRadius: BorderRadius.circular(12),
                      )
                    ],
                  ),
                  // Task container with checkbox and text
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        // Checkbox for marking the task as complete/incomplete
                        Expanded(
                          child: Checkbox(
                            value: db.todoList[index][1],
                            onChanged: (value) => checkBoxChanged(value, index),
                            activeColor: Colors.black,
                          ),
                        ),
                        // Task text with strikethrough if marked complete
                        Expanded(
                          flex: 7,
                          child: Text(
                            db.todoList[index][0],
                            style: TextStyle(
                              decoration: db.todoList[index][1]
                                  ? TextDecoration.lineThrough
                                  : null,
                              color: db.todoList[index][1]
                                  ? Colors.black
                                  : Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
      // Floating action button to create a new task
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: const Icon(Icons.add),
      ),
    );
  }
}
