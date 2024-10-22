import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:stability_image_generation/stability_image_generation.dart';

class AiTextToImageGenerator extends StatefulWidget {
  const AiTextToImageGenerator({super.key});
  @override
  State<AiTextToImageGenerator> createState() => _AiTextToImageGeneratorState();
}

class _AiTextToImageGeneratorState extends State<AiTextToImageGenerator> {
  // Controller for the input field
  final TextEditingController _queryController = TextEditingController();
  // Instance of StabilityAI for image generation
  final StabilityAI _ai = StabilityAI();
  // API key for the AI service
  final String apiKey = 'sk-fj8aMPYtOiIW5tSW1rhTKSYeomP28x3T0nBqNNfIdP8sIge1';
  // Set the style for the generated image
  final ImageAIStyle imageAIStyle = ImageAIStyle.digitalPainting;
  // Flag to check if images have been generated
  bool isItems = false;
  
  // Function to generate an image based on the input query
  Future<Uint8List> _generate(String query) async {
    Uint8List image = await _ai.generateImage(
      apiKey: apiKey, // API key
      imageAIStyle: imageAIStyle, // Style for the image
      prompt: query, // The text prompt input by the user
    );
    return image; // Return the generated image as bytes
  }

  // Dispose method to clean up the controller when the widget is removed from the tree
  @override
  void dispose() {
    _queryController.dispose(); // Dispose of the controller
    super.dispose(); // Call the super class dispose method
  }

  @override
  Widget build(BuildContext context) {
    // Build the UI of the widget
    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "Text to Image",
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            Container(
              width: double.infinity,
              height: 55,
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: TextField(
                controller:
                    _queryController, // Link the text field to the controller
                decoration: const InputDecoration(
                  hintText: 'Enter your prompt',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(left: 15, top: 5),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: isItems // Check if images have been generated
                  ? FutureBuilder<Uint8List>(
                      future: _generate(
                          _queryController.text), // Call the generate function
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          // Show loading indicator while waiting for the image
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (snapshot.hasData) {
                          // If data is received, display the generated image
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.memory(snapshot
                                .data!), // Display the image from memory
                          );
                        } else {
                          return Container(); // Return an empty container if no data
                        }
                      },
                    )
                  : const Center(
                      child: Text(
                        'No any image generated yet', // Message if no images generated
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
            ),
            ElevatedButton(
              onPressed: () {
                String query = _queryController.text; // Get the input text
                if (query.isNotEmpty) {
                  setState(() {
                    isItems =
                        true; // Set the flag to indicate images are being generated
                  });
                } else {
                  // Log a message if the query is empty
                  if (kDebugMode) {
                    print('Query is empty !!');
                  }
                }
              },
              child: const Text("Generate Image"),
            ),
          ],
        ),
      ),
    );
  }
}
