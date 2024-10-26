import 'package:http/http.dart' as http;
import 'meme_model.dart';

class ApiService {
  // API endpoint to retrieve a random meme with a specified API key and keyword
  final String apiUrl =
      "https://api.apileague.com/retrieve-random-meme?api-key=79c3612273624f36b3d8c258ab80bbdf&keywords=rocket";

  // Function to fetch a random meme from the API
  Future<RandomMeme?> fetchRandomMeme() async {
    try {
      // Sends a GET request to the API
      final response = await http.get(Uri.parse(apiUrl));

      // If the response status is 200 (OK), parse the JSON data
      if (response.statusCode == 200) {
        return randomMemeFromJson(
            response.body); // Converts JSON to `RandomMeme` model
      } else {
        // If the response is not successful, log an error message
        print("Failed to load meme: ${response.statusCode}");
        return null; // Returns null to indicate an error occurred
      }
    } catch (e) {
      // If there's an error with the request, print the error message
      print("Error: $e");
      return null;
    }
  }
}
