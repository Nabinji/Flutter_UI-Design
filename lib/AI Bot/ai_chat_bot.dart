import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart'; // To pick files from the device
import 'package:http/http.dart' as http; // To send HTTP requests

class ImageChat extends StatefulWidget {
  const ImageChat({super.key});

  @override
  State<ImageChat> createState() => _ImageChatState();
}

class _ImageChatState extends State<ImageChat> {
  PlatformFile? pickedImage; // Holds the selected image file
  // Displays the response from the API, initially empty
  String responseMessage = '';
  // Indicates if the app is waiting for the API response
  bool isLoading = false;
  // Controls the text input for the prompt
  final promptController = TextEditingController();

  // Replace `YOUR_API_KEY` with your actual API key
  final apiUrl =
      "https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash-latest:generateContent?key=your api key";

  /// Picks an image file from the device using FilePicker
  Future<void> pickImage() async {
    final result = await FilePicker.platform
        .pickFiles(type: FileType.image, withData: true);
    if (result != null) {
      // Update the state with the selected image
      setState(() => pickedImage = result.files.first);
    }
  }

  /// Sends the image and prompt to the API and fetches a response
  Future<void> generateResponse() async {
    // Exit if no image is selected
    if (pickedImage == null || pickedImage!.bytes == null) return;

    setState(() {
      isLoading = true; // Show loading indicator
      responseMessage = ''; // Clear any previous response
      promptController.clear();
    });

    try {
      // Create a request payload
      final requestPayload = {
        "contents": [
          {
            "parts": [
              {
                "text": promptController.text
              }, // Include the user-entered prompt
              {
                "inlineData": {
                  "mimeType": "image/jpeg", // Image type
                  "data": base64
                      .encode(pickedImage!.bytes!), // Convert image to Base64
                }
              }
            ]
          }
        ],
      };

      // Send a POST request to the API
      final response = await http.post(
        Uri.parse(apiUrl),
        // Specify JSON content type
        headers: {'Content-Type': 'application/json'},
        // Convert request payload to JSON
        body: jsonEncode(requestPayload),
      );

      if (response.statusCode == 200) {
        // Parse the API response
        final result = jsonDecode(response.body);
        responseMessage = result['candidates']?[0]?['content']?['parts']?[0]
                ?['text'] ??
            'No text found';
      } else {
        responseMessage = 'Error: ${response.statusCode}'; // Handle errors
      }
    } catch (e) {
      responseMessage = 'Error: ${e.toString()}'; // Handle exceptions
    }

    setState(() => isLoading = false); // Hide loading indicator
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Image Chat Bot',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            // Image display section
            GestureDetector(
              onTap: pickImage, // Trigger image selection
              child: pickedImage == null
                  ? Container(
                      height: 340,
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Center(
                        child: Text(
                          'Select an Image',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  : Column(
                      children: [
                        // Display the selected image
                        ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image.memory(pickedImage!.bytes!,
                              height: 340, fit: BoxFit.cover),
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue),
                          onPressed: pickImage,
                          child: const Text(
                            'Select New Image',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
            ),
            const SizedBox(height: 20),

            // Prompt input section
            TextField(
              controller:
                  promptController, // Bind to the prompt text controller
              decoration: InputDecoration(
                hintText: 'Enter your prompt here', // Placeholder text
                prefixIcon: const Icon(Icons.pending, color: Colors.black),
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Generate response button
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              onPressed: generateResponse, // Trigger API call
              child: const Text(
                "Generate Answer",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 30),

            // Display loading indicator or response text
            isLoading
                ? const Center(child: CircularProgressIndicator())
                : Text(
                    responseMessage, // Display the API response
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 18),
                  ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
