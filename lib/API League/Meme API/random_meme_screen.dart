import 'package:flutter/material.dart';
import 'package:flutter_ui_design/API%20League/Meme%20API/meme_model.dart';
import 'service.dart';

class RandomMemeScreen extends StatefulWidget {
  const RandomMemeScreen({super.key});

  @override
  _RandomMemeScreenState createState() => _RandomMemeScreenState();
}

class _RandomMemeScreenState extends State<RandomMemeScreen> {
  // Holds the current meme data, initially set to `null`
  RandomMeme? meme;

  // Indicates whether a meme is currently being loaded
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _getNewmeme(); // Fetch the first meme as soon as the screen loads
  }

  // Function to fetch a new meme from the API
  Future<void> _getNewmeme() async {
    setState(() {
      isLoading = true; // Show loading indicator while fetching
    });

    // Fetches a new meme from the API via `ApiService`
    final newmeme = await ApiService().fetchRandomMeme();

    // Updates the state with the new meme and removes the loading indicator
    setState(() {
      meme = newmeme;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        backgroundColor: Colors.blue[100],
        title: const Text("Random Meme"),
      ),
      body: Center(
        child: isLoading
            ? const CircularProgressIndicator()
            : meme != null // If there's a meme, display it
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network(
                          meme!.url, // Displays the meme image from the API
                          width: 400,
                          height: 400,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          meme!.description, // Displays the meme description
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed:
                              _getNewmeme, // Fetch a new meme when button is clicked
                          child: const Text("Generate New meme"),
                        ),
                      ],
                    ),
                  )
                : const Text(
                    "No meme available",
                  ), // Shows message if no meme data is available
      ),
    );
  }
}
